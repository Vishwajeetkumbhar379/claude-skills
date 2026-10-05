---
name: motion-website-builder
description: Builds award-level animated websites by combining the motion stack from this repo — Lenis smooth scroll, GSAP (core, timelines, ScrollTrigger, SplitText, Flip and every other plugin, all free), Vanta.js WebGL backgrounds, React Bits animated components, Godly design inspiration and ui-ux-pro-max design rules. Use whenever the user asks to build, design or upgrade a website, landing page, portfolio, agency or studio site, product page or hero section, especially with words like premium, award-winning, Awwwards, Godly, smooth, animated, scroll animation, interactive, WebGL, or "make it look amazing". Ships a tested vanilla starter (templates/starter.html).
---

# Motion website builder

The stack from the "tools I honestly use" video, wired together:

| Layer | Tool | Skill to load for details |
|---|---|---|
| Inspiration | Godly (godly.design) | `godly-inspiration` |
| Design system | palettes, fonts, UX rules | `ui-ux-pro-max` |
| Smooth scroll | Lenis | `lenis-smooth-scroll` |
| Animation engine | GSAP 3.15 (all plugins free, no licence or token) | `gsap-core`, `gsap-timeline`, `gsap-scrolltrigger`, `gsap-plugins`, `gsap-react`, `gsap-frameworks`, `gsap-utils`, `gsap-performance` |
| WebGL background | Vanta.js (three.js / p5 wrapped) | `vanta-backgrounds` |
| Ready-made animated components (React) | React Bits | `react-bits` |

Load the specific skill before writing code for that layer. This file decides **what** to use; those skills say **how**.

## Workflow

1. **Brief.** Get: what the site is for, audience, 3 mood words, sections, stack (plain HTML, React/Next.js, Vue/Nuxt, or a claude.ai artifact). Don't stall on missing details: assume sensible defaults and state them.
2. **Direction.** Use `godly-inspiration` to pick reference patterns and `ui-ux-pro-max` for palette + font pairing. Write a 5 to 10 line direction: palette (hex), fonts, grid, motion plan, one signature moment.
3. **Choose the stack** (table below).
4. **Build.** For plain HTML / artifacts, start from [templates/starter.html](templates/starter.html) and restyle it; don't rebuild the wiring from scratch. For React/Next.js, use the React wiring below.
5. **Polish and check** against the checklist at the end.

## Choosing the stack

| Target | Smooth scroll | Animation | Background | Components |
|---|---|---|---|---|
| claude.ai HTML artifact / static HTML | Lenis CDN | GSAP CDN (ScrollTrigger, SplitText, Flip...) | Vanta CDN (three r134) | hand-built |
| React / Next.js | `lenis/react` | `gsap` + `@gsap/react` (`useGSAP`) | React Bits background (ogl/three) **or** Vanta | React Bits |
| Vue / Nuxt | `lenis/vue` | `gsap` (see `gsap-frameworks`) | Vanta | hand-built (Vue Bits exists as a port) |
| Webflow / Framer | built-in or Lenis script | GSAP (Webflow Interactions run on GSAP) | Vanta embed | — |

Pick **one** WebGL background per page: Vanta **or** a React Bits background, not both.

## CDN URLs (pinned, tested together)

```html
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/lenis@1.3.26/dist/lenis.css">
<script src="https://cdnjs.cloudflare.com/ajax/libs/three.js/r134/three.min.js"></script>        <!-- only if using Vanta -->
<script src="https://cdn.jsdelivr.net/npm/vanta@0.5.24/dist/vanta.fog.min.js"></script>           <!-- swap effect name -->
<script src="https://cdn.jsdelivr.net/npm/gsap@3.15.0/dist/gsap.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/gsap@3.15.0/dist/ScrollTrigger.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/gsap@3.15.0/dist/SplitText.min.js"></script>             <!-- any plugin: dist/<Plugin>.min.js -->
<script src="https://cdn.jsdelivr.net/npm/lenis@1.3.26/dist/lenis.min.js"></script>
```

Other GSAP plugins load the same way: `Flip`, `Observer`, `Draggable`, `InertiaPlugin`, `MorphSVGPlugin`, `DrawSVGPlugin`, `MotionPathPlugin`, `ScrambleTextPlugin`, `CustomEase`, `ScrollToPlugin`. Register each with `gsap.registerPlugin(...)`.

## The core wiring (always the same)

```js
gsap.registerPlugin(ScrollTrigger, SplitText);
const lenis = new Lenis();
lenis.on('scroll', ScrollTrigger.update);
gsap.ticker.add((t) => lenis.raf(t * 1000));
gsap.ticker.lagSmoothing(0);
```

## React / Next.js wiring

```bash
npm i gsap @gsap/react lenis
# optional: npm i vanta three@0.134.0   |   npx shadcn@latest add https://reactbits.dev/r/<Name>-TS-TW
```

```tsx
// app/providers/smooth-scroll.tsx
'use client';
import { ReactLenis, type LenisRef } from 'lenis/react';
import { gsap } from 'gsap';
import { ScrollTrigger } from 'gsap/ScrollTrigger';
import { useEffect, useRef } from 'react';
import 'lenis/dist/lenis.css';
gsap.registerPlugin(ScrollTrigger);

export function SmoothScroll({ children }: { children: React.ReactNode }) {
  const lenisRef = useRef<LenisRef>(null);
  useEffect(() => {
    const update = (time: number) => lenisRef.current?.lenis?.raf(time * 1000);
    gsap.ticker.add(update);
    gsap.ticker.lagSmoothing(0);
    lenisRef.current?.lenis?.on('scroll', ScrollTrigger.update);
    return () => gsap.ticker.remove(update);
  }, []);
  return <ReactLenis root options={{ autoRaf: false, anchors: true }} ref={lenisRef}>{children}</ReactLenis>;
}
```

```tsx
// any animated section
'use client';
import { useRef } from 'react';
import { gsap } from 'gsap';
import { ScrollTrigger } from 'gsap/ScrollTrigger';
import { useGSAP } from '@gsap/react';
gsap.registerPlugin(ScrollTrigger, useGSAP);

export function Reveal() {
  const scope = useRef<HTMLElement>(null);
  useGSAP(() => {
    gsap.from('.item', { y: 60, autoAlpha: 0, stagger: 0.1, scrollTrigger: { trigger: scope.current, start: 'top 80%' } });
  }, { scope });
  return <section ref={scope}>{/* .item elements */}</section>;
}
```

## Signature moments (pick 2 to 4, not all)

- Split-text headline intro (GSAP SplitText with `mask`, or React Bits SplitText/BlurText)
- Pinned section with scrubbed image scale or `clip-path` reveal (ScrollTrigger `pin` + `scrub`)
- Horizontal scroll gallery (pin + `x: () => -(track.scrollWidth - innerWidth)`)
- Grid/list view toggle with Flip
- Scroll-velocity marquee (Lenis `velocity` → `timeScale`)
- Magnetic buttons / custom cursor (desktop, `(pointer: fine)` only)
- WebGL hero background (Vanta Fog/Net/Waves or React Bits Aurora/Silk/Grainient)
- Page-load counter/preloader (CountUp) only if assets genuinely need it

## Quality checklist (run before handing over)

- [ ] One frame loop: Lenis driven by GSAP ticker; no `autoRaf` alongside it; no ScrollSmoother alongside Lenis.
- [ ] `gsap.matchMedia()` with a `prefers-reduced-motion: reduce` branch; Vanta/WebGL skipped or static for reduced motion and small screens.
- [ ] Animate transforms and opacity (`x`, `y`, `scale`, `autoAlpha`), not `top/left/width/height`.
- [ ] `ScrollTrigger.refresh()` after fonts/images load (`document.fonts.ready`); SplitText runs after fonts load.
- [ ] Cleanup on unmount: `useGSAP`/`gsap.context().revert()`, `vanta.destroy()`, `lenis.destroy()` if created manually.
- [ ] Text contrast over animated backgrounds meets WCAG AA; focus states visible; nav works without JS.
- [ ] Mobile: one WebGL context max, lighter effects, no hover-only content, 16px+ side gutters, no horizontal overflow.
- [ ] Content is original (references inspire, never copied); no fake client logos, metrics or testimonials.

## Delivering in claude.ai chat

Build it as an **HTML artifact** from `templates/starter.html` (CDN scripts work there). React artifacts in claude.ai cannot install `gsap`, `lenis`, `vanta` or React Bits packages, so use HTML for live previews and hand over React files separately when the user's real project is React/Next.js.
