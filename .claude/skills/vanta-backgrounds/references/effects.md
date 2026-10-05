# Vanta effects and default options

Extracted from `tengbao/vanta` `src/vanta.*.js` (v0.5.24). Colors are numbers (`0xRRGGBB`).

Common options for every effect: `el` (selector or element, required), `mouseControls` (true), `touchControls` (true), `gyroControls` (false), `minHeight` (200), `minWidth` (200), `scale` (1), `scaleMobile` (1), `THREE` / `p5` (pass the library when importing from npm).

Instance methods: `setOptions({...})`, `resize()`, `destroy()`.

| Effect | Global / import | Renderer | Defaults |
|---|---|---|---|
| Birds | `VANTA.BIRDS` / `vanta/dist/vanta.birds.min` | three | backgroundColor 0x07192f, color1 0xff0000, color2 0x00d1ff, colorMode 'varianceGradient' ('lerp', 'variance', 'lerpGradient'), birdSize 1, wingSpan 30, speedLimit 5, separation 20, alignment 20, cohesion 20, quantity 5 (2 to 5) |
| Cells | `VANTA.CELLS` | three shader | color1 0x008c8c, color2 0xf2e735, backgroundColor 0xd7ff8f, amplitudeFactor 1, ringFactor 1, rotationFactor 1, size 1.5, speed 1, scaleMobile 3 |
| Clouds | `VANTA.CLOUDS` | three shader | backgroundColor 0xffffff, skyColor 0x68b8d7, cloudColor 0xadc1de, cloudShadowColor 0x183550, sunColor 0xff9919, sunGlareColor 0xff6633, sunlightColor 0xff9933, scale 3, scaleMobile 12, speed 1, mouseEase true |
| Clouds2 | `VANTA.CLOUDS2` | three shader | backgroundColor 0x000000, skyColor 0x5ca6ca, cloudColor 0x334d80, lightColor 0xffffff, speed 1, texturePath './gallery/noise.png' (host a noise texture and set this path, or use the vantajs.com one), scaleMobile 4 |
| Dots | `VANTA.DOTS` | three | color 0xff8820, color2 0xff8820, backgroundColor 0x222222, size 3, spacing 35, showLines true |
| Fog | `VANTA.FOG` | three shader | highlightColor 0xffc300, midtoneColor 0xff1f00, lowlightColor 0x2d00ff, baseColor 0xffebeb, blurFactor 0.6, speed 1, zoom 1, scale 2, scaleMobile 4 |
| Globe | `VANTA.GLOBE` | three | color 0xff3f81, color2 0xffffff, size 1, backgroundColor 0x23153c, points 10, maxDistance 20, spacing 15, showDots true |
| Halo | `VANTA.HALO` | three shader | baseColor 0x001a59, color2 0xf2e735, backgroundColor 0x131a43, amplitudeFactor 1, ringFactor 1, rotationFactor 1, xOffset 0, yOffset 0, size 1, speed 1, mouseEase true |
| Net | `VANTA.NET` | three | color 0xff3f81, backgroundColor 0x23153c, points 10, maxDistance 20, spacing 15, showDots true |
| Rings | `VANTA.RINGS` | three | backgroundColor 0x202428, color 0x88ff00 |
| Ripple | `VANTA.RIPPLE` | three shader | color1 0x060b25, color2 0xffffff, backgroundColor 0xf6f6f6, amplitudeFactor 1, ringFactor 4, rotationFactor 0.1, speed 1, scaleMobile 4 |
| Topology | `VANTA.TOPOLOGY` | p5 | color 0x89964e, backgroundColor 0x002222 |
| Trunk | `VANTA.TRUNK` | p5 | color 0x98465f, backgroundColor 0x222426, spacing 0, chaos 1 |
| Waves | `VANTA.WAVES` | three | color 0x005588, shininess 30, waveHeight 15, waveSpeed 1, zoom 1 |

CDN pattern: `https://cdn.jsdelivr.net/npm/vanta@0.5.24/dist/vanta.<effect>.min.js` with three r134 (`https://cdnjs.cloudflare.com/ajax/libs/three.js/r134/three.min.js`) or p5 1.1.9 (`https://cdnjs.cloudflare.com/ajax/libs/p5.js/1.1.9/p5.min.js`).

## Brand-matched presets

```js
// Dark studio (portfolio, agency)
VANTA.FOG({ el, highlightColor: 0x6b6b6b, midtoneColor: 0x2a2a2a, lowlightColor: 0x0f0f0f, baseColor: 0x050505, blurFactor: 0.7, speed: 0.6 })

// AI / SaaS network
VANTA.NET({ el, color: 0x7c5cff, backgroundColor: 0x0b0b10, points: 12, maxDistance: 22, spacing: 16 })

// Calm ocean (wellness, travel)
VANTA.WAVES({ el, color: 0x0b2a3a, shininess: 25, waveHeight: 12, waveSpeed: 0.6, zoom: 0.9 })

// Editorial generative (art, culture)
VANTA.TOPOLOGY({ el, p5, color: 0xe8e2d0, backgroundColor: 0x141414 })
```
