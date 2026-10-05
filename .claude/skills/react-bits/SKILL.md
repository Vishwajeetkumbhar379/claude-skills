---
name: react-bits
description: "React Bits (DavidHDev/react-bits, reactbits.dev) — 200+ free animated React components: text animations (SplitText, BlurText, ShinyText, DecryptedText, ScrollReveal), animations and cursors (ClickSpark, BlobCursor, Magnet), UI components (Dock, CircularGallery, MagicBento, Masonry), micro-interactions and WebGL backgrounds (Aurora, Silk, Galaxy, Iridescence, LiquidChrome, Hyperspeed, Threads). Use when building a React/Next.js site that needs eye-catching animated text, backgrounds, cursors, galleries or micro-interactions, or when the user mentions React Bits, reactbits, or \"animated React components\"."
license: MIT + Commons Clause (see LICENSE.md)
---

# React Bits

React Bits is the largest open-source library of animated React components (MIT + Commons Clause: free to use in any app or site, not to resell as a component library). Every component ships in 4 variants: **JS-CSS** (default), **JS-TW** (Tailwind), **TS-CSS**, **TS-TW**.

Full catalogue with one-line descriptions, CLI names and npm dependencies: [references/catalog.md](references/catalog.md). Search it (grep for a word like `cursor`, `gallery`, `text`, `ogl`) instead of guessing names.

## Install a component

In a project with a terminal (Claude Code, local dev):

```bash
# shadcn (writes into components/ per components.json)
npx shadcn@latest add https://reactbits.dev/r/SplitText-TS-TW
# or jsrepo
npx jsrepo@latest add https://reactbits.dev/r/SplitText-JS-CSS
```

`<Name>` is PascalCase from the catalogue. Pick the variant to match the project: TypeScript → `TS`, Tailwind → `TW`.

Then install the dependencies listed for that component in the catalogue (the CLI usually does this; verify `package.json`). Common ones: `gsap @gsap/react`, `motion`, `ogl`, `three @react-three/fiber @react-three/drei`.

### Without a CLI (claude.ai chat, sandbox without npm)

Fetch the source and paste it into the project:

- Registry JSON with file contents and deps: `https://reactbits.dev/r/<Name>-<JS|TS>-<CSS|TW>.json` (`files[].content`, `dependencies`)
- Raw source on GitHub: `https://raw.githubusercontent.com/DavidHDev/react-bits/main/src/<variant>/<Category>/<Name>/<Name>.<jsx|tsx>` where `<variant>` is `content` (JS-CSS), `tailwind` (JS-TW), `ts-default` (TS-CSS), `ts-tailwind` (TS-TW) and `<Category>` is `TextAnimations`, `Animations`, `Components`, `Backgrounds` or `Micro`. CSS variants also have `<Name>.css` next to it.

Never invent component code from memory and call it React Bits. Fetch it, or write your own component and say so.

## Use it

```jsx
import SplitText from '@/components/SplitText';
import Aurora from '@/components/Aurora';

export default function Hero() {
  return (
    <section style={{ position: 'relative', minHeight: '100vh' }}>
      <div style={{ position: 'absolute', inset: 0 }}>
        <Aurora colorStops={['#3A29FF', '#FF94B4', '#FF3232']} amplitude={1.0} blend={0.5} speed={0.6} />
      </div>
      <SplitText text="We build things that move." tag="h1" splitType="chars" delay={40} />
    </section>
  );
}
```

Read the fetched component's props (its default parameter list) before using it; don't guess prop names.

## Good picks by job

| Job | Components |
|---|---|
| Hero headline | SplitText, BlurText, ShinyText, GradientText, RotatingText, DecryptedText, TextPressure, VariableProximity |
| Scroll storytelling | ScrollReveal, ScrollFloat, ScrollVelocity, ScrollStack, AnimatedContent, FadeContent |
| Hero background | Aurora, Silk, Galaxy, Iridescence, LiquidChrome, LiquidEther, Threads, DarkVeil, Plasma, Beams, Hyperspeed, Particles, DotGrid |
| Cursor and delight | ClickSpark, BlobCursor, SplashCursor, TargetCursor, Magnet, ImageTrail, Crosshair |
| Galleries and cards | CircularGallery, DomeGallery, Masonry, MagicBento, ChromaGrid, TiltedCard, ProfileCard, CardSwap, Stack |
| Navigation | Dock, GooeyNav, PillNav, StaggeredMenu, FlowingMenu, CardNav |
| Counters and logos | CountUp, LogoLoop |

## Rules

- WebGL backgrounds (ogl/three) are heavy: one per page, give the wrapper explicit size, and lazy-load below-the-fold ones (`next/dynamic` with `ssr: false`).
- Components start with `'use client'` where needed; keep them in client components in Next.js App Router.
- Text components using GSAP SplitText are free (all GSAP plugins are free since 3.13); pair with the gsap-react skill for cleanup patterns.
- Respect `prefers-reduced-motion`: pass reduced values or render static text/background for those users.
- If the site already uses Lenis smooth scroll, scroll-based components that read `window.scrollY` or use ScrollTrigger keep working (Lenis is native-scroll based).
- claude.ai React artifacts can't install npm packages; for a live preview in chat, build an HTML artifact with CDN scripts instead, or deliver the component files for the user's project.
