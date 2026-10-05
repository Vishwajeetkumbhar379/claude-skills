# Instructions for Claude

## Building websites: use the motion stack skills

This repo ships skills in `.claude/skills/` that load automatically. For any website, landing page, portfolio, hero section or web UI work, use them instead of writing animation code from memory:

1. **`motion-website-builder`** first. It picks the stack and links to the rest.
2. **`godly-inspiration`** + **`ui-ux-pro-max`** for direction: references, palette, fonts, UX rules.
3. **`lenis-smooth-scroll`** for smooth scroll.
4. **`gsap-*`** (official GreenSock skills: core, timeline, scrolltrigger, plugins, react, frameworks, utils, performance) for every animation. All GSAP plugins (SplitText, MorphSVG, Flip, ScrollSmoother...) are free from the public `gsap` package. No Club licence, no token.
5. **`vanta-backgrounds`** for WebGL hero backgrounds (pin three r134).
6. **`react-bits`** for ready-made animated React components (text, backgrounds, cursors, galleries).

Quick start for a static page or claude.ai artifact: copy `.claude/skills/motion-website-builder/templates/starter.html` (Lenis + GSAP + SplitText + Vanta, tested together) and restyle it.

When one of these skills is used, tell the user in one line which ones you used (e.g. "Built with Lenis + GSAP ScrollTrigger + Vanta Fog").

## Repo conventions

- Own skills live in `skills/`; vendored third-party skills live in `.claude/skills/` with their upstream LICENSE kept in each folder.
- Run `scripts/package-skills.sh` after changing a skill to rebuild the claude.ai upload zips in `dist/claude-app/`.
