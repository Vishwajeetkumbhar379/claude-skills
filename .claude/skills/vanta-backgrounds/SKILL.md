---
name: vanta-backgrounds
description: Vanta.js animated 3D/WebGL backgrounds (three.js and p5.js wrapped, tengbao/vanta) — Birds, Fog, Waves, Clouds, Clouds2, Globe, Net, Cells, Trunk, Topology, Dots, Rings, Halo, Ripple. Use when the user wants an animated hero background, a WebGL or 3D background, "Vanta", a living gradient/fog/net/globe backdrop, or interactive mouse-reactive backgrounds in HTML, React, Next.js or Vue.
license: MIT
---

# Vanta.js backgrounds

Vanta (npm `vanta` 0.5.24, MIT) puts an animated WebGL (three.js) or p5.js canvas behind any element in a few lines. The canvas fills the container element; the container's other children stay on top as foreground content. Gallery and live option editor: https://www.vantajs.com.

All 14 effects with their options and defaults: [references/effects.md](references/effects.md).

## three.js version: pin it

Vanta was built against **three r134**. Newer three releases removed APIs some effects use. Always load three **0.134.0** for Vanta (CDN `r134`, or `npm i three@0.134.0`). If the project already needs a newer three for other work, load r134 only for Vanta via the CDN `window.THREE`, or pass it as `THREE` option from a separate import alias, and test every effect you ship.

## Vanilla / CDN (also works in claude.ai artifacts)

```html
<div id="hero" style="min-height:100vh">
  <h1>Foreground content</h1>
</div>

<script src="https://cdnjs.cloudflare.com/ajax/libs/three.js/r134/three.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/vanta@0.5.24/dist/vanta.fog.min.js"></script>
<script>
  const vanta = VANTA.FOG({
    el: '#hero',
    mouseControls: true,
    touchControls: true,
    gyroControls: false,
    highlightColor: 0xffc300,
    midtoneColor: 0xff1f00,
    lowlightColor: 0x2d00ff,
    baseColor: 0x0a0a0a,
    blurFactor: 0.6,
    speed: 1.0,
    zoom: 1.0,
  });
  // later: vanta.setOptions({ baseColor: 0x111111 }); vanta.resize(); vanta.destroy();
</script>
```

p5 effects (TRUNK, TOPOLOGY) need p5 instead of three:
`<script src="https://cdnjs.cloudflare.com/ajax/libs/p5.js/1.1.9/p5.min.js"></script>` then `vanta.trunk.min.js`.

## React / Next.js

```bash
npm i vanta three@0.134.0
```

```jsx
'use client';
import { useEffect, useRef } from 'react';
import * as THREE from 'three';
import NET from 'vanta/dist/vanta.net.min';

export function VantaHero({ children }) {
  const ref = useRef(null);
  useEffect(() => {
    const effect = NET({
      el: ref.current,
      THREE,               // pass three explicitly when importing from npm
      color: 0x7c5cff,
      backgroundColor: 0x0b0b10,
      points: 12,
      maxDistance: 22,
      spacing: 16,
    });
    return () => effect.destroy();
  }, []);
  return <section ref={ref} style={{ minHeight: '100vh' }}>{children}</section>;
}
```

With React StrictMode the effect mounts twice in dev; the cleanup above handles that. In Next.js keep it in a client component, or `dynamic(() => import('./VantaHero'), { ssr: false })`.

For p5 effects: `import p5 from 'p5'` and pass `p5` in the options.

## Vue

Create in `mounted()`/`onMounted`, store the instance, call `.destroy()` in `beforeUnmount`/`onBeforeUnmount`. Pass `THREE` like the React example.

## Picking an effect

| Mood | Effect |
|---|---|
| Dark luxe, studio, cinematic | FOG (dark baseColor), CLOUDS2, HALO |
| Tech, network, AI, data | NET, GLOBE, DOTS |
| Calm, water, wellness | WAVES, RIPPLE |
| Organic, art, generative | TRUNK, TOPOLOGY, CELLS |
| Playful, nature | BIRDS, CLOUDS, RINGS |

Match the effect colors to the brand palette (hex as `0xRRGGBB` numbers, not strings).

## Rules

- Always keep the instance and call `.destroy()` on unmount or route change; leaking WebGL contexts crashes tabs.
- Give the container an explicit height (`min-height: 100vh` for a hero). Zero height means no canvas.
- Use one Vanta effect per page, normally only the hero. Several WebGL contexts kill mobile performance.
- For mobile: `scaleMobile` (shader effects), fewer `points`/`quantity`, or swap to a static gradient under `(max-width: 640px)` or `prefers-reduced-motion: reduce`.
- Text over the canvas needs contrast: add a dark/light overlay gradient on a child element if needed.
- Call `effect.resize()` when the container changes size without a window resize.
- To save battery on long pages, destroy the effect when the hero scrolls out (ScrollTrigger `onLeave`) and recreate it on `onEnterBack`. For a hero-only effect, leaving it running is fine.
