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
| [**ui-ux-pro-max**](skills/ui-ux-pro-max/SKILL.md) | UI/UX design intelligence: searchable styles, palettes, font pairings, UX rules and stack guides, plus a design-system generator | Third-party, from [nextlevelbuilder/ui-ux-pro-max-skill](https://github.com/nextlevelbuilder/ui-ux-pro-max-skill) (MIT) |

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

**Claude apps:** zip a skill folder and upload it under Settings → Capabilities → Skills.

The job-search skills expect a short `profile.md` (and for the humanizer, a `voice.md` with a few of your own emails) in the skill folder, so the output sounds like you.

---

Built by [Vishwajeet Kumbhar](https://www.linkedin.com/in/vishwajeetkumbhar379). The humanizer patterns are adapted from [blader/humanizer](https://github.com/blader/humanizer) (MIT). ui-ux-pro-max is vendored from [nextlevelbuilder/ui-ux-pro-max-skill](https://github.com/nextlevelbuilder/ui-ux-pro-max-skill) v2.13.0 (MIT, licence in its folder). MIT licence.
