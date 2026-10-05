# Lenis API reference (v1.3.26)

Vendored from darkroomengineering/lenis README (MIT). Sponsors and badges removed.

## Installation

Using a package manager:

```bash
npm i lenis
# or
yarn add lenis
# or
pnpm add lenis
```

```js
import Lenis from 'lenis'
```


Using scripts:

```html
<script src="https://unpkg.com/lenis@1.3.26/dist/lenis.min.js"></script> 
```



## Setup

### Basic:

```js
// Initialize Lenis
const lenis = new Lenis({
  autoRaf: true,
});

// Listen for the scroll event and log the event data
lenis.on('scroll', (e) => {
  console.log(e);
});
```

### Custom raf loop:

```js
// Initialize Lenis
const lenis = new Lenis();

// Use requestAnimationFrame to continuously update the scroll
function raf(time) {
  lenis.raf(time);
  requestAnimationFrame(raf);
}

requestAnimationFrame(raf);
```

### Recommended CSS:

**Import stylesheet:**
```js
import 'lenis/dist/lenis.css'
```

**Or link the CSS file:**

```html
<link rel="stylesheet" href="https://unpkg.com/lenis@1.3.26/dist/lenis.css">
```

**Or add it manually:**

[See lenis.css stylesheet](./packages/core/lenis.css)

### GSAP ScrollTrigger:
```js
// Initialize a new Lenis instance for smooth scrolling
const lenis = new Lenis();

// Synchronize Lenis scrolling with GSAP's ScrollTrigger plugin
lenis.on('scroll', ScrollTrigger.update);

// Add Lenis's requestAnimationFrame (raf) method to GSAP's ticker
// This ensures Lenis's smooth scroll animation updates on each GSAP tick
gsap.ticker.add((time) => {
  lenis.raf(time * 1000); // Convert time from seconds to milliseconds
});

// Disable lag smoothing in GSAP to prevent any delay in scroll animations
gsap.ticker.lagSmoothing(0);

```


## No-code usage

One line, no build step — just drop this into your HTML:

```html
<link rel="stylesheet" href="https://unpkg.com/lenis@1.3.26/dist/lenis.css">
<script src="https://unpkg.com/lenis@1.3.26/dist/lenis.min.js"></script> 
<script>new Lenis({ autoRaf: true, autoToggle: true, anchors: true, allowNestedScroll: true, naiveDimensions: true, stopInertiaOnNavigate: true })</script>
```

That's it, your page now has smooth scrolling and should handle most of the usual issues such as:
- compatibility with other packages
- modals
- smooth anchors
- scroll reset on page change



## Settings

| Option                  | Type                       | Default                                            | Description                                                                                                                                                                                                                                                                          |
|-------------------------|----------------------------|----------------------------------------------------|--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| `allowNestedScroll`     | `boolean`                  | `false`                                            | Automatically allow nested scrollable elements to scroll natively. This is the simplest way to handle nested scroll. ⚠️ Can create performance issues since it checks the DOM tree on every scroll event. If that's a concern, use `prevent` option instead.          |
| `anchors`               | `boolean, ScrollToOptions` | `false`                                            | Scroll to anchor links when clicked. If `true` is passed, it will enable anchor links with default options. If `ScrollToOptions` is passed, it will enable anchor links with the given options.                                                                                      |
| `autoRaf`               | `boolean`                  | `false`                                            | Whether or not to automatically run `requestAnimationFrame` loop.                                                                                                                                                                                                                    |
| `autoResize`            | `boolean`                  | `true`                                             | Resize instance automatically based on `ResizeObserver`. If `false` you must resize manually using `.resize()`.                                                                                                                                                                      |
| `autoToggle`            | `boolean`                  | `false`                                            | Automatically start or stop the lenis instance based on the wrapper's overflow property, ⚠️ this requires Lenis recommended CSS. Safari > 17.3, Chrome > 116 and Firefox > 128 ([https://caniuse.com/?search=transition-behavior](https://caniuse.com/?search=transition-behavior)). |
| `content`               | `HTMLElement`              | `document.documentElement`                         | The element that contains the content that will be scrolled, usually `wrapper`'s direct child.                                                                                                                                                                                       |
| `duration`              | `number`                   | `1.2`                                              | The duration of scroll animation (in seconds). Useless if lerp defined.                                                                                                                                                                                                              |
| `easing`                | `function`                 | `(t) => Math.min(1, 1.001 - Math.pow(2, -10 * t))` | The easing function to use for the scroll animation, our default is custom but you can pick one from [Easings.net](https://easings.net/en). Useless if lerp defined.                                                                                                                 |
| `eventsTarget`          | `HTMLElement, Window`      | `wrapper`                                          | The element that will listen to `wheel` and `touch` events.                                                                                                                                                                                                                          |
| `gestureOrientation`    | `string`                   | `vertical`                                         | The orientation of the gestures. Can be `vertical`, `horizontal` or `both`.                                                                                                                                                                                                          |
| `infinite`              | `boolean`                  | `false`                                            | Enable infinite scrolling! `syncTouch: true` is required on touch devices ([See example](https://codepen.io/ClementRoche/pen/OJqBLod)).                                                                                                                                              |
| `lerp`                  | `number`                   | `0.1`                                              | Linear interpolation (lerp) intensity (between 0 and 1).                                                                                                                                                                                                                             |
| `naiveDimensions`       | `boolean`                  | `false`                                            | If `true`, Lenis will use naive dimensions calculation. ⚠️ Be careful, this has a performance impact.                                                                                                                                                                                |
| `orientation`           | `string`                   | `vertical`                                         | The orientation of the scrolling. Can be `vertical` or `horizontal`.                                                                                                                                                                                                                 |
| `overscroll`            | `boolean`                  | `true`                                             | Similar to CSS overscroll-behavior (https://developer.mozilla.org/en-US/docs/Web/CSS/overscroll-behavior).                                                                                                                                                                           |
| `prevent`               | `function`                 | `undefined`                                        | Manually prevent scroll to be smoothed based on elements traversed by events. If `true` is returned, it will prevent the scroll to be smoothed. Example: `(node) =>  node.classList.contains('cookie-modal')`.                                                                       |
| `respectReducedMotion`  | `boolean`                  | `true`                                             | Honor the user's `prefers-reduced-motion` setting: smoothing is disabled and programmatic scrolls are instant, while scroll keeps running on the main thread ([see Reduced motion](#reduced-motion)).                                                                                 |
| `smoothWheel`           | `boolean`                  | `true`                                             | Smooth the scroll initiated by `wheel` events.                                                                                                                                                                                                                                       |
| `stopInertiaOnNavigate` | `boolean`                  | `false`                                            | If `true`, Lenis will stop inertia when an internal link is clicked.                                                                                                                                                                                                                 |
| `syncTouch`             | `boolean`                  | `false`                                            | Mimic touch device scroll while allowing scroll sync (can be unstable on iOS<16).                                                                                                                                                                                                    |
| `syncTouchLerp`         | `number`                   | `0.075`                                            | Lerp applied during `syncTouch` inertia.                                                                                                                                                                                                                                             |
| `touchInertiaExponent`  | `number`                   | `1.7`                                              | Manage the strength of syncTouch inertia.                                                                                                                                                                                                                                            |
| `touchMultiplier`       | `number`                   | `1`                                                | The multiplier to use for touch events.                                                                                                                                                                                                                                              |
| `virtualScroll`         | `function`                 | `undefined`                                        | Manually modify the events before they get consumed. If `false` is returned, the scroll will not be smoothed. Examples: `(e) => { e.deltaY /= 2 }` (to slow down vertical scroll) or `({ event }) => !event.shiftKey` (to prevent scroll to be smoothed if shift key is pressed).    |
| `wheelMultiplier`       | `number`                   | `1`                                                | The multiplier to use for mouse wheel events.                                                                                                                                                                                                                                        |
| `wrapper`               | `HTMLElement, Window`      | `window`                                           | The element that will be used as the scroll container.                                                                                                                                                                                                                               |

<!-- `target`: goal to reach
- `number`: value to scroll in pixels
- `string`: CSS selector or keyword (`top`, `left`, `start`, `bottom`, `right`, `end`)
- `HTMLElement`: DOM element


`options`:
- `offset`(`number`): equivalent to [`scroll-padding-top`](https://developer.mozilla.org/en-US/docs/Web/CSS/scroll-padding-top)
- `lerp`(`number`): animation lerp intensity
- `duration`(`number`): animation duration (in seconds)
- `easing`(`function`): animation easing
- `immediate`(`boolean`): ignore duration, easing and lerp
- `lock`(`boolean`): whether or not to prevent user from scrolling until target reached
- `onComplete`(`function`): called when target is reached -->

## Properties

| Property                | Type              | Description                                                                |
|-------------------------|-------------------|----------------------------------------------------------------------------|
| `actualScroll`          | `number`          | Current scroll value registered by the browser                             |
| `animatedScroll`        | `number`          | Current scroll value                                                       |
| `className` (getter)    | `string`          | `rootElement` className                                                    |
| `dimensions`            | `object`          | Dimensions instance                                                        |
| `direction`             | `number`          | `1`: scrolling up, `-1`: scrolling down                                    |
| `isHorizontal` (getter) | `boolean`         | Whether or not the instance is horizontal                                  |
| `isScrolling` (getter)  | `boolean, string` | Whether or not the scroll is being animated, `smooth`, `native` or `false` |
| `isStopped` (getter)    | `boolean`         | Whether or not the user should be able to scroll                           |
| `lastVelocity`          | `number`          | Last scroll velocity                                                       |
| `limit` (getter)        | `number`          | Maximum scroll value                                                       |
| `options`               | `object`          | Instance options                                                           |
| `prefersReducedMotion` (getter) | `boolean` | Whether the user prefers reduced motion and Lenis is honoring it           |
| `progress` (getter)     | `number`          | Scroll progress from `0` to `1`                                            |
| `rootElement` (getter)  | `HTMLElement`     | Element on which Lenis is instanced                                        |
| `scroll` (getter)       | `number`          | Current scroll value (handles infinite scroll if activated)                |
| `targetScroll`          | `number`          | Target scroll value                                                        |
| `time`                  | `number`          | Time elapsed since instance creation                                       |
| `velocity`              | `number`          | Current scroll velocity                                                    |


## Methods

| Method                      | Description                                                                     | Arguments                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                   |
|-----------------------------|---------------------------------------------------------------------------------|---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| `destroy()`                 | Destroys the instance and removes all events.                                   |                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                             |
| `on(id, function)`          | `id` can be any of the following [instance events](#instance-events) to listen. |                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                             |
| `raf(time)`                 | Must be called every frame for internal usage.                                  | `time`: in ms                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                               |
| `resize()`                  | Compute internal sizes, it has to be used if `autoResize` option is `false`.    |                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                             |
| `scrollTo(target, options)` | Scroll to target.                                                               | `target`: goal to reach<ul><li>`number`: value to scroll in pixels</li><li>`string`: CSS selector or keyword (`top`, `left`, `start`, `bottom`, `right`, `end`)</li><li>`HTMLElement`: DOM element</li></ul>`options`<ul><li>`offset`(`number`): equivalent to [`scroll-padding-top`](https://developer.mozilla.org/en-US/docs/Web/CSS/scroll-padding-top)</li><li>`lerp`(`number`): animation lerp intensity</li><li>`duration`(`number`): animation duration (in seconds)</li><li>`easing`(`function`): animation easing</li><li>`immediate`(`boolean`): ignore duration, easing and lerp</li><li>`lock`(`boolean`): whether or not to prevent the user from scrolling until the target is reached</li><li>`force`(`boolean`): reach target even if instance is stopped</li><li>`onComplete`(`function`): called when the target is reached</li><li>`userData`(`object`): this object will be forwarded through `scroll` events</li></ul> |
| `start()`                   | Resumes the scroll                                                              |                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                             |
| `stop()`                    | Pauses the scroll                                                               |                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                             |



## Events

| Event            | Callback Arguments        |
|------------------|---------------------------|
| `scroll`         | Lenis instance            |
| `virtual-scroll` | `{deltaX, deltaY, event}` |



## Considerations

### Nested scroll

The simplest and most reliable way to handle nested scrollable elements is to use the `allowNestedScroll` option:

```js
const lenis = new Lenis({
  allowNestedScroll: true,
})
```

This automatically detects nested scrollable elements and lets them scroll natively. However, this can create performance issues since Lenis needs to check the DOM tree on every scroll event. If you experience performance problems, use `data-lenis-prevent` instead.

#### Using HTML attributes

```html
<div data-lenis-prevent>scrollable content</div>
```

[See example](https://codepen.io/ClementRoche/pen/PoLdjpw)

| Attribute                       | Description                          |
|---------------------------------|--------------------------------------|
| `data-lenis-prevent`            | Prevent all smooth scroll events     |
| `data-lenis-prevent-wheel`      | Prevent wheel events only            |
| `data-lenis-prevent-touch`      | Prevent touch events only            |
| `data-lenis-prevent-vertical`   | Prevent vertical scroll events only  |
| `data-lenis-prevent-horizontal` | Prevent horizontal scroll events only|

#### Using Javascript

```html
<div id="modal">scrollable content</div>
```

```js
const lenis = new Lenis({
  prevent: (node) => node.id === 'modal',
})
```

[See example](https://codepen.io/ClementRoche/pen/emONGYN)



### Anchor links
By default, Lenis will prevent anchor links from working while scrolling. To enable them, you must set `anchors: true`.

```js
new Lenis({
  anchors: true
})
```

You can also use `scrollTo` options:

```js
new Lenis({
  anchors: {
    offset: 100,
    onComplete: ()=>{
      console.log('scrolled to anchor')
    }
  }
})
```

### Reduced motion

By default, Lenis honors the user's [`prefers-reduced-motion`](https://developer.mozilla.org/en-US/docs/Web/CSS/@media/prefers-reduced-motion) setting: when it is set to `reduce`, smoothing is disabled (`lerp` is forced to `1` so the scroll tracks the input device 1:1, ignoring `duration`/`easing`) and programmatic scrolls (`scrollTo`, anchor links) jump instantly to their target. Lenis keeps running so WebGL/DOM synchronization stays intact, and the preference is picked up live without a reload. You can check `lenis.prefersReducedMotion` to adapt your own animations.

You can opt out (not recommended) with:

```js
const lenis = new Lenis({
  respectReducedMotion: false,
})
```


## Limitations

- no support for CSS scroll-snap, you must use ([lenis/snap](https://github.com/darkroomengineering/lenis/tree/main/packages/snap/README.md))
- capped to 60fps on Safari ([source](https://bugs.webkit.org/show_bug.cgi?id=173434)) and 30fps on low power mode
- smooth scroll will stop working over iframe since they don't forward wheel events
- position fixed seems to lag on MacOS Safari pre-M1 ([source](https://github.com/darkroomengineering/lenis/issues/103))
- touch events may behave unexpectedly when `syncTouch` is enabled on iOS < 16
- nested scroll containers require proper configuration to work correctly


## Troubleshooting
- Make sure you use the latest version of [Lenis](https://www.npmjs.com/package/lenis?activeTab=versions)
- Include the recommended CSS
- If using GSAP ScrollTrigger, ensure proper integration (see [GSAP ScrollTrigger setup](#setup) section)
- Test without Lenis to ensure your element/page is scrollable
- Be sure to use `autoRaf: true` or manually call `lenis.raf(time)` in your animation loop



---

# lenis/react (React adapter)

## Introduction
lenis/react provides a `<ReactLenis>` component that creates a [Lenis](https://github.com/darkroomengineering/lenis) instance and provides it to its children via context. This allows you to use Lenis in your React app without worrying about passing the instance down through props. It also provides a `useLenis` hook that allows you to access the Lenis instance from any component in your app.


## Installation

```bash
npm i lenis
```

## Recommended CSS

Import the Lenis CSS to ensure proper behavior:

```js
import 'lenis/dist/lenis.css'
```

## Usage

### Basic

```jsx
import { ReactLenis, useLenis } from 'lenis/react'

function App() {
  const lenis = useLenis((lenis) => {
    // called every scroll
    console.log(lenis)
  })

  return (
    <>
      <ReactLenis root />
      { /* content */ }
    </>
  )
}
```

## Props
- `options`: [Lenis options](https://github.com/darkroomengineering/lenis#instance-settings).
- `root`: When `true`, makes the Lenis instance globally accessible via `useLenis` from anywhere in your app (even outside the provider tree). Lenis will use the default `<html>` scroll container. When `'asChild'`, renders wrapper elements for custom scroll containers while still making the instance globally accessible. Default: `false`.

## Hooks
Once the Lenis context is set (components mounted inside `<ReactLenis>`) you can use these handy hooks:

`useLenis` is a hook that returns the Lenis instance

The hook takes three arguments:
- `callback`: The function to be called whenever a scroll event is emitted
- `deps`: Trigger callback on change
- `priority`: Manage callback execution order





## Examples

### Custom requestAnimationFrame loop:

```jsx
import { ReactLenis } from 'lenis/react'
import { useEffect, useRef } from 'react'

function App() {
  const lenisRef = useRef()
  
  useEffect(() => {
    function update(time) {
      lenisRef.current?.lenis?.raf(time)
    }
  
    const rafId = requestAnimationFrame(update)
  
    return () => cancelAnimationFrame(rafId)
  }, [])
  
  return (
    <ReactLenis root options={{ autoRaf: false }} ref={lenisRef} />
  )
}
```


### GSAP integration

```jsx
import gsap from 'gsap'
import { ReactLenis } from 'lenis/react'
import { useEffect, useRef } from 'react'

function App() {
  const lenisRef = useRef()
  
  useEffect(() => {
    function update(time) {
      lenisRef.current?.lenis?.raf(time * 1000)
    }
  
    gsap.ticker.add(update)
  
    return () => gsap.ticker.remove(update)
  }, [])
  
  return (
    <ReactLenis root options={{ autoRaf: false }} ref={lenisRef} />
  )
}
```

### Framer Motion integration:
```jsx
import { ReactLenis } from 'lenis/react';
import type { LenisRef } from 'lenis/react';
import { cancelFrame, frame } from 'framer-motion';
import { useEffect, useRef } from 'react';

function App() {
  const lenisRef = useRef<LenisRef>(null)

  useEffect(() => {
    function update(data: { timestamp: number }) {
      const time = data.timestamp
      lenisRef.current?.lenis?.raf(time)
    }

    frame.update(update, true)

    return () => cancelFrame(update)
  }, [])


  return (
    <ReactLenis root options={{ autoRaf: false }} ref={lenisRef} />
  )
}
```

## lenis/react in use

- [@darkroom.engineering/satus](https://github.com/darkroomengineering/satus) Our starter kit.

<br/>

## License

MIT © [darkroom.engineering](https://github.com/darkroomengineering)

---

# lenis/snap

## Introduction
lenis/snap provides a partial support for CSS scroll snap with [Lenis](https://github.com/darkroomengineering/lenis), see [Demo](https://lenis.darkroom.engineering/snap)

## Installation

```bash
npm i lenis
```

## Usage

### Basic

```jsx
    import Lenis from 'lenis'
    import Snap from 'lenis/snap'

    const lenis = new Lenis()

    function raf(time) {
        lenis.raf(time)
        requestAnimationFrame(raf)
    }

    requestAnimationFrame(raf)

    const snap = new Snap(lenis)

    // add snaps points
    snap.add(500) // snap at 500px
    snap.add(1000) // snap at 1000px
    snap.add(1500) // snap at 1500px

    // or add an element to snap to
    snap.addElement(document.querySelector('.element'), {
      align: ['start', 'end'], // 'start', 'center', 'end'
    })

    snap.addElement(document.querySelector('.element1'), {
      align: 'center', // 'start', 'center', 'end'
    })

    // or add elements at once
    snap.addElements(document.querySelectorAll('.section'), {
      align: ['start', 'end'], // 'start', 'center', 'end'
    })
    
    
```

### Slideshow

```jsx
    const snap = new Snap(lenis, {
      type: 'lock',
      distanceThreshold: '100%',
      debounce: 0,
    })
```

## Options

- `type`: `proximity` (default), `mandatory` see [scroll-snap-type](https://developer.mozilla.org/en-US/docs/Web/CSS/scroll-snap-type) or `lock`.
- `distanceThreshold`: `string | number` (default: '50%'). The distance threshold from the snap point to the scroll position. Ignored when `type` is `mandatory`. If a percentage, it is relative to the viewport size. If a number, it is absolute.
- `debounce`: `number` (default: 500). The debounce time for the snap.
- `onSnapStart`: `function`. Callback when snap starts.
- `onSnapComplete`: `function`. Callback when snap completes.
- `lerp`: `number` Lerp value for snapping. (default: lenis lerp). 
- `easing`: `function`. Easing function for snapping. (default: lenis easing).
- `duration`: `number`. Duration for snapping. (default: lenis duration).


## Methods

- `add(value: number)`: Add a snap point.
- `addElement(element: HTMLElement, options: SnapElementOptions = {})`: Add an element to snap to.
- `addElements(elements: HTMLElement[], options: SnapElementOptions = {})`: Add elements at once.
- `next()`: Go to the next snap point.
- `previous()`: Go to the previous snap point.
- `goTo(index: number)`: Go to a specific snap point.
- `start()`: Start the snap.
- `stop()`: Stop the snap.
- `resize()`: Force recalculate the snap points.