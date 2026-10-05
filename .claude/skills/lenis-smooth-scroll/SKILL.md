---
name: lenis-smooth-scroll
description: Lenis smooth scroll (darkroomengineering/lenis) for websites — setup in vanilla JS, React/Next.js (lenis/react), Vue, CDN with no build step, syncing with GSAP ScrollTrigger, anchors, modals and nested scroll, horizontal scroll, snap, reduced motion. Use when the user wants smooth scrolling, buttery or "premium" scroll, scroll inertia, a Lenis setup, or smooth scroll that works with ScrollTrigger, parallax or WebGL scenes.
license: MIT
---

# Lenis smooth scroll

Lenis (v1.3.x, npm `lenis`, MIT, zero dependencies) smooths the browser's **native** scroll. Because it wraps native scroll, `position: sticky`, anchor links, find-in-page and accessibility keep working. It is the de facto standard on award-winning sites and pairs with GSAP ScrollTrigger.

Full option, property, method and event tables: [references/lenis-api.md](references/lenis-api.md). Read it before using an option not shown here.

## Pick the setup

### 1. CDN, no build step (static HTML, Claude artifacts, quick prototypes)

```html
<link rel="stylesheet" href="https://unpkg.com/lenis@1.3.26/dist/lenis.css">
<script src="https://unpkg.com/lenis@1.3.26/dist/lenis.min.js"></script>
<script>
  const lenis = new Lenis({ autoRaf: true, anchors: true, allowNestedScroll: true });
</script>
```

In a claude.ai artifact use the jsDelivr mirror if unpkg is blocked: `https://cdn.jsdelivr.net/npm/lenis@1.3.26/dist/lenis.min.js` and `.../dist/lenis.css`.

### 2. npm, vanilla

```bash
npm i lenis
```

```js
import Lenis from 'lenis';
import 'lenis/dist/lenis.css';

const lenis = new Lenis({ autoRaf: true, anchors: true });
```

### 3. With GSAP ScrollTrigger (the common case for animated sites)

Drive Lenis from GSAP's ticker so both share one frame loop. Do **not** also pass `autoRaf: true`.

```js
import Lenis from 'lenis';
import { gsap } from 'gsap';
import { ScrollTrigger } from 'gsap/ScrollTrigger';
gsap.registerPlugin(ScrollTrigger);

const lenis = new Lenis();
lenis.on('scroll', ScrollTrigger.update);
gsap.ticker.add((time) => lenis.raf(time * 1000)); // GSAP time is seconds, Lenis wants ms
gsap.ticker.lagSmoothing(0);
```

Do not combine Lenis with GSAP ScrollSmoother. They solve the same problem; pick one (Lenis by default, ScrollSmoother only if the user asks for it).

### 4. React / Next.js

```jsx
'use client'; // Next.js App Router
import { ReactLenis, useLenis } from 'lenis/react';
import 'lenis/dist/lenis.css';

export default function SmoothScroll({ children }) {
  return <ReactLenis root options={{ anchors: true }}>{children}</ReactLenis>;
}

// anywhere below:
const lenis = useLenis(({ scroll, velocity }) => { /* runs every scroll */ });
lenis?.scrollTo('#contact', { offset: -80 });
```

React + GSAP: turn off Lenis's own loop and drive it from the GSAP ticker.

```jsx
import { ReactLenis } from 'lenis/react';
import { gsap } from 'gsap';
import { ScrollTrigger } from 'gsap/ScrollTrigger';
import { useEffect, useRef } from 'react';
gsap.registerPlugin(ScrollTrigger);

export function SmoothScroll({ children }) {
  const lenisRef = useRef(null);
  useEffect(() => {
    const update = (time) => lenisRef.current?.lenis?.raf(time * 1000);
    gsap.ticker.add(update);
    gsap.ticker.lagSmoothing(0);
    const lenis = lenisRef.current?.lenis;
    lenis?.on('scroll', ScrollTrigger.update);
    return () => gsap.ticker.remove(update);
  }, []);
  return <ReactLenis root options={{ autoRaf: false }} ref={lenisRef}>{children}</ReactLenis>;
}
```

### 5. Vue / Nuxt

`import { VueLenis, useLenis } from 'lenis/vue'` and render `<VueLenis root />`. Same options as above.

## Recipes

- **Scroll to element / top:** `lenis.scrollTo('#id', { offset: -80, duration: 1.4 })`, `lenis.scrollTo('top')`, `lenis.scrollTo(0, { immediate: true })`.
- **Modal or menu open:** `lenis.stop()` on open, `lenis.start()` on close. Or set `autoToggle: true` and toggle `overflow: hidden` on `<html>`.
- **Scrollable child (modal body, code block, dropdown):** add `data-lenis-prevent` to it, or use `allowNestedScroll: true`.
- **Horizontal site:** `new Lenis({ orientation: 'horizontal', gestureOrientation: 'both' })`.
- **Scroll velocity effects** (skew, marquee speed): read `lenis.velocity` inside `lenis.on('scroll', ...)`.
- **Progress bar:** `lenis.on('scroll', ({ progress }) => bar.style.transform = `scaleX(${progress})`)`.
- **Snap sections:** use `lenis/snap` (CSS scroll-snap does not work with Lenis). See the reference file.
- **Route change in SPA:** `lenis.scrollTo(0, { immediate: true })` after navigation, or `stopInertiaOnNavigate: true`.

## Tuning the feel

- `lerp` (default `0.1`): lower is floatier (0.05 to 0.08 = luxury/editorial), higher is snappier (0.12 to 0.15). Using `lerp` ignores `duration`/`easing`.
- `duration` + `easing`: use instead of `lerp` for a time-based feel, e.g. `duration: 1.2`.
- `wheelMultiplier` / `touchMultiplier`: speed.
- `syncTouch: true` only when touch must stay in sync with WebGL; it can be unstable on iOS < 16.

## Rules

- Always include the Lenis CSS (`lenis.css`). Missing CSS is the top cause of broken scroll, iframes and `autoToggle`.
- Use exactly one frame loop: `autoRaf: true` **or** a manual/GSAP ticker `lenis.raf(time)`, never both.
- Leave `respectReducedMotion` at its default `true`.
- Call `lenis.destroy()` on unmount when you created the instance yourself.
- Don't put `scroll-behavior: smooth` on `html`; it fights Lenis.
- After big layout changes (images loaded, accordions), call `lenis.resize()` (only needed if `autoResize: false`) and `ScrollTrigger.refresh()`.
- Known limits: no CSS scroll-snap, wheel events don't pass through iframes, Safari caps at 60fps.
