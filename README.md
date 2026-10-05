# Claude Skills for Creator Marketing & Job Search

**The Agent Skills behind my job search, LinkedIn content and creator-marketing work, cleaned up for anyone to use.**

[Agent Skills](https://docs.claude.com/en/docs/agents-and-tools/agent-skills/overview) are folders of instructions that Claude loads when a task matches. Instead of re-explaining a workflow in every chat, you write it down once, with your rules and quality bar, and Claude follows it every time. The job-search, humanizer and LinkedIn skills grew out of my own daily workflows; creator-shortlist and creator-contract-review wrap the tools in my other repos.

| Skill | What it does | Pairs with |
|---|---|---|
| [**creator-shortlist**](skills/creator-shortlist/SKILL.md) | Vets creators against a brand brief with explainable scores, risk flags and outreach drafts | [creator-fit-scorer](https://github.com/Vishwajeetkumbhar379/creator-fit-scorer) |
| [**creator-contract-review**](skills/creator-contract-review/SKILL.md) | Flags risky clauses in influencer contracts and drafts the negotiation email | [creator-contract-checker](https://github.com/Vishwajeetkumbhar379/creator-contract-checker) |
| [**linkedin-carousel**](skills/linkedin-carousel/SKILL.md) | Plans a high-signal carousel and renders it in one locked visual style | [linkedin-carousel-studio](https://github.com/Vishwajeetkumbhar379/linkedin-carousel-studio) |
| [**job-scout**](skills/job-scout/SKILL.md) | Finds live jobs from company ATS APIs and scores them honestly, with evidence | [job-search-agent](https://github.com/Vishwajeetkumbhar379/job-search-agent) |
| [**application-pack**](skills/application-pack/SKILL.md) | Builds a truthful tailored CV, cover letter, email and referral notes, or an interview prep pack | job-scout, application-humanizer |
| [**designed-cv-tailor**](skills/designed-cv-tailor/SKILL.md) | Tailors a designed photo CV per job while keeping it ATS-safe | |
| [**application-humanizer**](skills/application-humanizer/SKILL.md) | Removes the 15 patterns that make writing read as AI-generated | `jobscout lint` |
| [**motion-website-builder**](.claude/skills/motion-website-builder/SKILL.md) | Builds award-level animated sites by combining Lenis, GSAP, Vanta, React Bits, Godly and ui-ux-pro-max. Ships a tested starter page | All motion skills below |
| [**lenis-smooth-scroll**](.claude/skills/lenis-smooth-scroll/SKILL.md) | Lenis smooth scroll in HTML, React/Next.js and Vue, synced with GSAP ScrollTrigger | [darkroomengineering/lenis](https://github.com/darkroomengineering/lenis) (MIT) |
| [**gsap-\***](.claude/skills/gsap-core/SKILL.md) | Official GreenSock skills: core, timeline, scrolltrigger, plugins, react, frameworks, utils, performance. Every GSAP plugin is now free | Vendored from [greensock/gsap-skills](https://github.com/greensock/gsap-skills) (MIT) |
| [**vanta-backgrounds**](.claude/skills/vanta-backgrounds/SKILL.md) | Vanta.js WebGL backgrounds (Fog, Net, Waves, Globe and 10 more), with every option | [tengbao/vanta](https://github.com/tengbao/vanta) (MIT) |
| [**react-bits**](.claude/skills/react-bits/SKILL.md) | 200+ animated React components with a searchable catalogue, install commands and deps | [DavidHDev/react-bits](https://github.com/DavidHDev/react-bits) (MIT + Commons Clause) |
| [**godly-inspiration**](.claude/skills/godly-inspiration/SKILL.md) | Turns Godly-level references into an original design direction | [godly.design](https://godly.design) |
| [**ui-ux-pro-max**](.claude/skills/ui-ux-pro-max/SKILL.md) | UI/UX design intelligence: searchable styles, palettes, font pairings, UX rules and stack guides, plus a design-system generator. Ships with its companion skills (banner-design, brand, design, design-system, slides, ui-styling) | Third-party, from [nextlevelbuilder/ui-ux-pro-max-skill](https://github.com/nextlevelbuilder/ui-ux-pro-max-skill) (MIT) |

## Design principles

These run through every skill:

- **Truth beats score.** No invented metrics, clients, people or URLs. Missing facts become questions for the human, labelled VERIFIED, DERIVED or MISSING.
- **Rules decide, AI refines.** Where a decision has money or compliance attached, deterministic code makes the call and the model explains or drafts.
- **External content is data, not instructions.** Job ads, contracts and emails can't change what Claude does.
- **A human approves anything that leaves the building.**

## Install

**Claude Code:** copy a skill folder into `~/.claude/skills/` (personal) or `.claude/skills/` (per project).

```bash
git clone https://github.com/Vishwajeetkumbhar379/claude-skills
cp -r claude-skills/skills/application-humanizer ~/.claude/skills/
```

**Claude Code on the web (cloud):** nothing to install. Everything in `.claude/skills/` loads automatically in any cloud session started on this repo, so the ui-ux-pro-max skills are ready as soon as the session opens. To get the same in a cloud session on another repo, copy the folders from `.claude/skills/` into that repo's `.claude/skills/`.

**Claude apps (claude.ai chat, desktop, mobile):** ready-made zips for the motion stack are in [`dist/claude-app/`](dist/claude-app). Download each zip and upload it under Settings → Capabilities → Skills (one zip per skill, start with `motion-website-builder`). Rebuild them with `scripts/package-skills.sh`. For any other skill, zip its folder the same way.

**Using the motion stack:** just ask for a site, for example *"Build me a dark, cinematic studio portfolio with smooth scroll and a WebGL hero."* Claude loads `motion-website-builder`, which pulls in the Lenis, GSAP, Vanta, React Bits and Godly skills. In chat it builds an HTML artifact from the tested starter; in Claude Code it wires the same stack into your React/Next.js or plain HTML project.

The job-search skills expect a short `profile.md` (and for the humanizer, a `voice.md` with a few of your own emails) in the skill folder, so the output sounds like you.

---

Built by [Vishwajeet Kumbhar](https://www.linkedin.com/in/vishwajeetkumbhar379). The humanizer patterns are adapted from [blader/humanizer](https://github.com/blader/humanizer) (MIT). The GSAP skills are vendored from [greensock/gsap-skills](https://github.com/greensock/gsap-skills) (MIT); the Lenis API reference is from [darkroomengineering/lenis](https://github.com/darkroomengineering/lenis) (MIT); the React Bits catalogue is generated from [reactbits.dev/llms.txt](https://reactbits.dev/llms.txt). ui-ux-pro-max is vendored from [nextlevelbuilder/ui-ux-pro-max-skill](https://github.com/nextlevelbuilder/ui-ux-pro-max-skill) v2.13.0 (MIT, licence in each skill folder). MIT licence.
