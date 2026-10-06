# LinkedIn positioning and cover: Vishwajeet Kumbhar

Prepared 6 October 2026. Everything here was checked against your CV, portfolio, Build with Vish source and the 12 public repositories on github.com/Vishwajeetkumbhar379. Where a claim couldn't be traced to a source, it's marked and left out of the copy.

| File | What it is |
|---|---|
| `vish-linkedin-cover-1584x396.png` | The cover to upload. 1584 × 396 PNG, 0.24 MB |
| `banner/banner.html` | Editable source (three.js scene + HTML type). Words are in `COPY`, colours in `:root` and `P`, artefacts in `ARTEFACTS` |
| `banner/export.mjs` | `node banner/export.mjs` re-renders the PNG at exactly 1584 × 396 |
| `directions/direction-A/B/C.png` | The three compositions that were compared |
| `mockups/desktop.png`, `mobile.png`, `mobile-crop.png` | Profile mockups for crop and photo overlap |
| `mockups/mobile-*-actual-pixels.png` | The same at real phone size (390 px wide, 1× pixels) |
| `mockups/cover-with-crop-guides.png` | Cover with photo-overlap circles and the 3:1 crop line |

---

## 1. Evidence map

### Established professional experience (CV, matched by portfolio)

| Claim | Source | Status |
|---|---|---|
| ~5 years in marketing: FashionTV India 01/2021, then influencer roles from 07/2021 to 07/2025 | CV | Verified |
| Senior Account Manager, Team & Client Servicing Lead, Illuminati Media, 01/2024–07/2025, remote | CV | Verified |
| Main point of contact for 20+ brand accounts (fashion, lifestyle, fintech, D2C) incl. HUL, Philips, Lakmé | CV | Verified |
| Led a 12-person team of account executives and coordinators | CV | Verified |
| Owned campaigns end to end: briefs, creator discovery and negotiation, approvals, QC, reporting | CV | Verified |
| Manager, Influencer Marketing & Client Servicing, Pollen (Zoo Media); promoted from Senior Executive; Tata | CV | Verified |
| Reporting on engagement, reach, CPR, conversion; tracked ROI with Sheets, creator CRMs, dashboards | CV | Verified |
| "P&L view on every campaign", "cross-sell and upsell" | Portfolio + your brief, **not in the CV** | Used softly; add it to the CV too so the sources agree |
| Working Student, Marketing Analytics & Content, Hochschule Offenburg, since 01/2026; *supports* Meta, Google and LinkedIn Ads | CV | Verified. This is support work, not paid-acquisition ownership |
| MBA International Business Consulting (to early 2027); thesis on AI marketing automation | CV | Verified |

### Numbers that need care

| Claim | What the sources actually say | Decision |
|---|---|---|
| **"850+ creator deals"** | CV: "850+ creators" managed. Portfolio uses both "creator deals" and "creators managed". Creator Fit Scorer README and Build with Vish say "deals". No underlying count is published anywhere | **Not used.** A creator isn't a deal. If you can back "850+ creators worked with" from a CRM export, it can go back into the About. Fix the "deals" wording in the portfolio globe, BWV issue 1, the BWV about page and the creator-fit-scorer README |
| **"10+ / 11 / 12 open-source AI tools"** | 10 tool repos + `claude-skills` = 11 project repos (plus the profile repo and the BWV site). CV and portfolio meta say 12. All 10 tool repos went public in one "Initial release" commit on 2 Oct 2026; most have 1 commit. Each has tests and CI. Six state their data is fictional | **No count on the cover or headline.** Described as "small, tested tools on sample data". Pick one number (11) everywhere |
| Brands L'Oréal, Bumble, Vans, Raymond, Universal Pictures | Portfolio roster only; the CV ties no role to them | **Not used.** HUL, Philips, Lakmé (Illuminati) and Tata (Pollen) are the CV-backed names |
| "Job Search Agent runs daily" | Public repo's scheduled scan only runs if `config.toml` exists, and it doesn't in the public repo. The daily run is your private setup | Fine to say in a post; not used here |
| 8.8k LinkedIn followers (GitHub badge) | Couldn't check; LinkedIn is blocked from this environment | Not used |

### Demonstrated independent projects (Build with Vish)

- **Creator workflow tools** (creator-fit-scorer, creator-contract-checker, campaign-report-autopilot, client-health-score, creator-brief-mcp): each turns one step of your agency job into code. 236–516 lines of Python each, with tests. Campaign Report Autopilot ran its weekly GitHub Action on 5 Oct 2026 (on fictional data).
- **Growth tools** (growth-experiment-lab, a live app; marketing-attribution-lab; ad-performance-copilot): learning projects on sample data. They show you understand experiments and attribution. They aren't evidence of running growth or paid acquisition for a company.
- **buildwithvish.netlify.app**: a real, live publication with 56 guides and projects, 6 newsletter issues and a MailerLite double-opt-in signup. This is your strongest proof of independent go-to-market: you positioned it, built it and launched it yourself. It's still an independent project, not professional GTM leadership.

### Interests and developing capabilities

Growth experimentation, attribution, marketing ops and automation, AI agents (Claude API, MCP), German (B1).

### What an employer can trust you to own

**A book of brand accounts, and the creator programmes inside them, from brief to report, with a team.** That's the established core. Building tools is the second half of the same story: you automate the steps you did by hand. Growth and GTM are the direction you're heading, shown through independent work, so they're stated as that and nothing more.

---

## 2. Research synthesis

LinkedIn pages were read in full (through a fetch service; linkedin.com is blocked from this sandbox). Observations come first; my decision follows each one.

| Source | Observation | Decision it informs |
|---|---|---|
| [LinkedIn Help: cover image](https://www.linkedin.com/help/linkedin/answer/a568217) | Spec: "JPG or PNG", "Lesser than 8MB", "1584 (w) x 396 (h) pixels (recommended)". "How your image appears may change based on the size of your web browser window and screen resolution." "Photos will also look better than images with logos." | Exported at exactly 1584 × 396, PNG, 0.24 MB. The message sits away from the photo zones and was tested in three crops. No brand logos (they're also not yours to use); the scene shows work artefacts instead |
| [LinkedIn Help: Featured FAQ](https://www.linkedin.com/help/linkedin/answer/a552452) | Newest items show first by default, but you can reorder. Featured content "will not be discoverable through search". Viewers "must have a LinkedIn account and must be logged in" to see it | Featured order is set deliberately below. The key proof also lives in the headline and About, because logged-out visitors won't see Featured |
| [LinkedIn Talent Blog: headlines](https://www.linkedin.com/business/talent/blog/product-tips/recruiters-with-eye-catching-linkedin-profile-headlines) | The headline is "your own personal ad", better than a "just-the-facts" job title. Strategy 2: "connect the dots between your employer and corporate brands". "You get 220 characters" | Headlines open with the role, then name what you do for which brands, then the builder thread. All three are under 220 characters |
| [LinkedIn Talent Blog: summaries](https://www.linkedin.com/business/talent/blog/product-tips/linkedin-profile-summaries-that-we-love-and-how-to-boost-your-own) | "Your first words really matter… no 'Hi, I'm Jane Smith'". Write in first person, "if you wouldn't say it, don't write it". "Connect the dots" for non-linear paths. Avoid "results-oriented professional with a proven track record". Use bullets that flow. End with what you want the reader to do | About opens on the job itself, connects agency work to building in one line of logic, uses a short "what you can hand me" list, and ends with role types, availability and email |
| [amandanat.com](https://amandanat.com/) | "Marketer, writer, and former test kitchen cook. Marketing is my third career." Then a short "Currently" list where each item is a concrete role or output (the consultancy, the book, the podcast) | Breadth reads as credible when every thread names a concrete output. About uses a "right now" paragraph that names the part-time role, the thesis and BWV by what they are |
| [demandcurve.com/services](https://www.demandcurve.com/services) | Six services, each a one-line outcome plus specifics ("Creative earns the click; the landing page earns the conversion"). "The person you talk to is the person doing the work." The page also leans on big aggregate stats ("$3B+ revenue generated") | Breadth is shown as one owned sequence (brief → shortlist → contract → approval → report → tools), not a list of disciplines. I didn't borrow the big-number pattern: you don't have verified aggregates of that kind |
| [Bruno Simon portfolio on Awwwards](https://www.awwwards.com/sites/bruno-simon-portfolio) | Site of the Day, 11 Nov 2019, 8.04/10. The portfolio is a drivable 3D world where projects and social links are objects in the scene. The jury rated creativity 8.95 and usability 7.55 | Put the real work in the 3D scene, so the depth carries meaning. Keep the message as flat, crisp type, because a static cover can't rely on interaction, and usability was where the 3D site lost points |
| [impeccable.style](https://impeccable.style/) and [pbakaus/impeccable](https://github.com/pbakaus/impeccable) | Lists the defaults every model reaches for: "purple-to-blue gradients", "Inter for everything", cards nested in cards, gray text on coloured backgrounds. Ships a deterministic detector | The previous purple-glass cover matches those defaults. The new one uses your site's palette and Syne. I ran the real `npx impeccable detect` CLI on the cover source: 0 findings. Limits: the detector reads HTML/CSS, not WebGL pixels, and the Impeccable *skill* isn't installed here, so I applied its principles by hand |
| [Anthropic frontend-design SKILL.md](https://github.com/anthropics/skills/blob/main/skills/frontend-design/SKILL.md) | "Ground your designs in the subject matter… materials, and vernacular." "Spend your boldness in one place." Lists tells including "near-black background with a single bright… accent", mono data labels and "meta strings joined with middle dots" | Artefacts come from creator-marketing vernacular (creator brief, agreement with a usage clause, the German "Werbung" label, Monday report, your real CLI commands). Boldness goes into the 3D arc; the type stays calm. Middle-dot strings were removed from the cover copy. One conscious tension: your site *is* dark green + gold, and the brief says match it, so I kept it |
| `banner-design` skill (installed in this repo; used) | LinkedIn personal 1584 × 396; key content in the central 70–80%; ≥ 4.5:1 text contrast; at most 2 fonts | Followed. The overlay uses 2 families (Syne, Public Sans). IBM Plex Mono only appears inside the terminal artefact, as your site does |

I don't have evidence that any cover design improves hiring outcomes, and none of these sources provides it. The goal here is accuracy and legibility.

### Your website, inspected

- **vishkumbhar.netlify.app (hiring portfolio).** Night theme `#101918` background, `#16211F` panels, `#E8E3D7` cream ink, `#9AA7A2` muted, `#0C3B39`/`#0E4B48` teal, `#E8B03F` gold signal. Day theme `#ECE7DC` bone with `#142220` ink. Type: **Syne** 600–800 (very wide display, set huge in the hero), **Public Sans** body, **IBM Plex Mono** labels. Materials are matte and flat. The 3D element is a rotating dot globe. No glass. Character: warm, dark, editorial, confident wide type, gold used sparingly as a signal.
- **buildwithvish.netlify.app (learning site).** A separate system: Geist, black/lavender, iris violet `#7F77DD`, a WebGL particle journey, glass panels. The old purple-glass cover matched this site, not the hiring one.
- **Decision.** The cover follows the hiring portfolio, because that's where LinkedIn visitors go next. Build with Vish is named in the copy.

---

## 3. Headline

**Recommended (166 characters)**
> Influencer marketing & account lead | I run creator campaigns from brief to report for brands like HUL, Philips and Tata | Building marketing tools at Build with Vish

**Alternative A, account-management-led (162)**
> Senior Account Manager, creator partnerships | 20+ brand accounts and a 12-person team, from brief to report | Building open-source marketing tools | MBA, Germany

**Alternative B, growth-direction-led (161)**
> Influencer marketer moving into growth | 5 years running creator campaigns end to end, now building experiment, attribution and reporting tools | Build with Vish

All three use only CV-backed facts. B says "moving into" on purpose: the growth work is independent so far.

---

## 4. About (about 2,180 characters; LinkedIn allows 2,600)

> For five years my job has been to take a brand's ask and turn it into creator content that goes live on time and gets reported honestly.
>
> At Illuminati Media I was the main contact for 20+ brand accounts, including HUL, Philips and Lakmé, and led a 12-person team of account executives and coordinators. We owned campaigns end to end: the brief, creator discovery and negotiation, approvals, quality control and the report. I kept a P&L view on every campaign and looked for where each account could grow next. Before that, at Pollen (Zoo Media), I ran influencer campaigns for Tata and other consumer brands and was promoted to lead the team. My first creator work was at White Rivers Media, after social media at FashionTV India.
>
> What you can hand me:
> • a set of brand accounts and the client relationships behind them
> • creator programmes from brief to report: selection, rates, usage rights, approvals and ad disclosure
> • a team delivering several live campaigns at the same time
> • reporting a client can act on: reach, engagement, CPR, conversion, and what to change next
>
> Since moving to Germany for an MBA at Hochschule Offenburg, I've been building tools for the slow parts of that job. Under Build with Vish I've open-sourced a creator scorer that explains every ranking, a contract checker that flags risky clauses, a Monday client report that writes itself from the numbers, and a client health score. They're small, tested and run on sample data. Two more, an A/B test reader and an attribution comparison, are how I'm learning growth work. Build with Vish is also a free site and weekly newsletter that teaches marketers who don't code how to build with AI. I planned, built and launched it myself.
>
> Right now I'm a part-time marketing analytics and content working student at the university's business school, and my thesis studies how AI marketing automation changes the work of marketers in Germany.
>
> I'm looking for influencer marketing, partnerships or account management roles in teams that welcome better tools and processes. Remote first, Berlin from December 2026, full-time from January 2027. English fluent, German B1.
>
> vishwajeetkumbhar379@gmail.com

Optional line, only if you can back it with a CRM count: after the Pollen sentence, "Across these roles I've worked with more than 850 creators."

---

## 5. Featured section (in this order)

Every link was fetched live on 6 Oct 2026 (HTTP 200) through a fetch service. The GitHub repos were cloned and inspected.

| # | Title | Description | Link |
|---|---|---|---|
| 1 | Portfolio and CV | Five years of creator and account work, how I run a creator programme, and my two-page CV. | https://vishkumbhar.netlify.app/ |
| 2 | Creator Fit Scorer | Ranks creators against a brand brief and explains every score, with risk flags. Built from how I shortlisted creators at agencies. | https://github.com/Vishwajeetkumbhar379/creator-fit-scorer |
| 3 | Campaign Report Autopilot | The Monday client report, built by a GitHub Action, with a scale, keep, test or cut call per creator. Runs on sample data. | https://github.com/Vishwajeetkumbhar379/campaign-report-autopilot |
| 4 | Build with Vish | Free guides, projects and a Monday newsletter on building with AI, for marketers who don't code. Planned, built and launched by me. | https://buildwithvish.netlify.app/ |
| 5 | Growth Experiment Lab | Reads an A/B test (z-test, confidence interval), plans how long a test must run and ranks ideas with ICE. A live app from my growth learning. | https://vishwajeetkumbhar379.github.io/growth-experiment-lab/ |

Why this order: the first two cards are what shows without scrolling, so they cover the established core (accounts, then creators). Cards 3–5 show the building and growth direction. LinkedIn puts the newest item first by default, so add them in reverse order (5 → 1), or reorder after adding. When you have a strong carousel post about creator briefs or shortlisting, pin it as #2 and drop #5.

---

## 6. Cover design

### Three directions (`directions/`)

| | Composition | Strength | Weakness |
|---|---|---|---|
| **A · Panorama arc** | The six campaign artefacts stand in a curve that wraps around the message: the brief floats upper left, then shortlist, agreement, approval and report stand on a lit floor below the type, and the terminal with your tools floats upper right. A gold thread connects them | The scene surrounds the message. Reads left to right in campaign order. Both ends of the story (brief, tools) sit at eye level | The middle artefacts are small. Needs careful clearance below the copy |
| **B · Corridor** | The artefacts stand in a line running from the right edge into depth, with the copy on clean space at left | Deepest perspective, cleanest text area | Reads right to left (brief is nearest), the brief gets cut by mobile crops, and the far half shrinks into the horizon |
| **C · Workbench** | Orthographic top-down view of the artefacts laid flat on one table | Most legible artefacts | At 4:1 the table runs off the bottom edge, and the flat projection loses the depth you asked for |

**Chosen: A.** It's the only one where the scene extends around the message and the campaign order reads in the same direction as the sentence. Rejected on the way: an earlier A where the middle artefacts collided with the proof line (fixed by moving the camera target), and a version with the brief card inside the mobile photo zone (lifted).

### Copy on the cover

> **I take creator campaigns from brief to report,**
> and build the tools for every step.
> 20+ brand accounts. A 12-person team. Building at Build with Vish.

This changes your suggested line, "I take marketing from brief to built", in two ways. "Creator campaigns" keeps influencer marketing visible. "Brief to report" is concrete, where "built" can mean either the campaign or a tool. The tools half then says the building part plainly. "Every step" is literal: each artefact in the scene maps to a real repo (brief → creator-brief-mcp, shortlist → creator-fit-scorer, agreement → creator-contract-checker, approval/disclosure → creator-brief-mcp's disclosure check, report → campaign-report-autopilot). The terminal shows your real commands (`creator-fit`, `contract-check`, `campaign-report`) and output wording taken from the repos ("negotiate before signing", "scale / keep / test / cut"). Swap in another person's name and the cover stops being true, which was the test.

### Quality check (done on the exported PNG)

- **Dimensions and size:** 1584 × 396, PNG, 254,258 bytes (0.24 MB, limit 8 MB).
- **Contrast,** measured from the PNG's pixels against the local background: main line 16.1:1, second line 10.8:1, proof line 17.6:1 (white parts) and 7.2:1 (muted `#9AA7A2` part). All exceed 4.5:1.
- **Spelling:** every visible string, including the artefact textures, was listed and checked by hand. "Werbung" is the correct German disclosure label.
- **Clipping:** artefact titles are auto-fitted to their card width (the first render clipped "Creator brief"; fixed). Nothing in the message crosses the photo circles or the 3:1 crop line (`mockups/cover-with-crop-guides.png`).
- **Photo overlap:** desktop, the photo covers the brief card's lower corner and the shortlist; mobile 4:1, the same; mobile 3:1 crop, the shortlist. The message is clear in all three.
- **Small mobile size** (`mockups/mobile-actual-pixels.png`, 390 px wide): the main line reads at roughly 13 px. The second line is small but legible. **The proof line and artefact text don't read at phone size.** That's accepted: they're desktop detail, and your headline below the photo carries the same facts on mobile.
- **Factual claims on the cover:** 20+ brand accounts and the 12-person team (CV). Brand names, 850+ and tool counts are deliberately absent.
- **Mockup caveat:** the mockups are an approximation of LinkedIn's layout (804 px desktop card with a 152 px photo; 390 px mobile with a 104 px photo; a 3:1 centre crop as a worst case), not LinkedIn's own UI. Upload the PNG and check it on your phone and laptop before you leave it up.

### Editing

Change the words in `COPY` at the top of the script in `banner/banner.html`, then run `node banner/export.mjs` (needs Playwright with Chromium). `?guides=1` shows the photo and crop guides; `?dir=B` or `?dir=C` renders the other directions.

---

## 7. Fix elsewhere so every source agrees

1. "850+ creator deals" → "850+ creators" (or remove) in: portfolio hero globe and "One marketer, five jobs", BWV issue 1 and about page, BWV carousel cover, creator-fit-scorer README, linkedin-carousel-studio README example.
2. Tool count: CV and portfolio meta say 12, profile README says 11. 11 matches the repos.
3. Add the P&L view and account-growth work to the CV, or drop it from the portfolio.
4. Brand roster: the CV ties HUL, Philips, Lakmé and Tata to roles. Either add where L'Oréal, Bumble, Vans, Raymond and Universal Pictures came from, or keep them off the profile.
5. Portfolio "Performance marketing… judged on CPA and ROAS" overstates working-student ad support. Consider "support Meta, Google and LinkedIn Ads".
