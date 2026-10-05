---
name: godly-inspiration
description: Design research and reference-gathering using Godly (godly.design / godly.website), a curated gallery of the best web, app, UI and visual design — websites, heroes, CTAs, footers, logos, app icons, OG images, tools and resources. Use before designing or building a landing page, portfolio, agency/studio site or any "award-winning", "premium", "Awwwards-style" website; when the user asks for design inspiration, references, a moodboard, or "make it look like the best sites"; or when choosing layout, type and motion direction for a site.
---

# Godly inspiration

Godly is a hand-picked gallery of standout web and app design (the video's "the best" design inspiration site). Use it to anchor a design in what top studios actually ship, not generic AI-template looks.

- **godly.design** — current gallery with sections: Trending, Websites, Tools, Resources, Apps, App Icons, Logos, OG Images, Hero, CTA, Footer, Posts, Search.
- **godly.website** — the long-running website gallery, browsable by type and style.
- Companions worth checking for the same brief: awwwards.com (Sites of the Day), siteinspire.com, land-book.com, mobbin.com (app UI), lapa.ninja.

## Workflow

1. **Brief in one line.** Industry, audience, mood words (e.g. "dark, editorial, cinematic"), must-have sections.
2. **Collect 3 to 6 references.** If web search/fetch is available, search `site:godly.website <industry or style>` and browse godly.design sections that match the job (Hero for headers, CTA, Footer, Websites for full pages). Godly pages are image/video heavy and may not fetch as text; if a fetch fails, use web search results, ask the user to share screenshots or links of picks they like, or proceed from the pattern library below and say you did so.
3. **Extract, don't copy.** For each reference note: layout grid, type pairing and scale, color palette (3 to 5 hex), motion moments (intro, scroll, hover), and one signature detail. Never reproduce a site's copy, logo, imagery or exact layout; take principles.
4. **Write a design direction** (5 to 10 lines): palette, fonts, grid, motion plan, signature interaction. Run it past the user if they're in the loop.
5. **Build** with the motion-website-builder skill (Lenis + GSAP + Vanta/React Bits) and ui-ux-pro-max for palette, font pairing and UX checks.

## Patterns that show up across Godly-level sites

- **Oversized type hero**: 12 to 20vw display headline, tight tracking, split-text reveal on load (GSAP SplitText or React Bits SplitText).
- **Dark canvas + one accent**: near-black `#0a0a0a`, off-white text, one saturated accent used sparingly.
- **Smooth scroll + pinned storytelling**: Lenis, ScrollTrigger pins with scrubbed image scale/clip-path reveals.
- **Living background**: subtle WebGL (Vanta Fog/Net, React Bits Aurora/Silk/Grainient) under the hero only.
- **Custom cursor and magnetic buttons** on desktop only.
- **Grid/list view toggle** for work indexes (as in the Podium studio site in the video), with Flip transitions between views.
- **Marquee / scroll-velocity text** for clients or services.
- **Grain/noise overlay** and generous whitespace for an editorial feel.
- **Footer as a moment**: giant wordmark, big contact CTA.

## Rules

- References inform; the output must be original.
- Keep performance and accessibility (contrast, reduced motion, keyboard focus) even when the reference ignores them.
- Cite which references shaped the direction so the user can check them.
