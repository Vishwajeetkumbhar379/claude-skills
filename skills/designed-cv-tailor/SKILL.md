---
name: designed-cv-tailor
description: Tailor a designed, photo-style CV (an HTML template) to one job and export a sharp, ATS-safe 2-page PDF. Use when someone shares a job link and wants their designed CV customised for it.
---

# Designed CV tailor

Designed CVs (photo, sidebar, big name) impress humans but often break applicant tracking systems: text in the wrong reading order, text inside images, words glued together. This skill keeps the design and fixes the machine side. **Facts never change between jobs; only emphasis, wording and order do.**

## Inputs
- The job link or text (fetch it from the official ATS).
- `cv.html`: the CV as an HTML template with real text. Fonts installed locally (e.g. `npm i @fontsource/<font>`).
- `facts.md`: a table of roles, organisations and dates, plus education, proof points, tools and languages. This is the only source of facts.

## Tailoring
1. Pull 10-15 exact phrases from the job ad. Mark each as supported or not by `facts.md`.
2. Edit `cv.html`:
   - Kicker line under the name: mirror the job family.
   - Profile (max ~65 words): years, scope, one standout proof point, one AI line if true.
   - Skills: 12-13 items, job-ad terms first, only supported ones.
   - Bullets: reword toward the job's language using only verified facts; 3-4 bullets for recent roles, 1 for older ones.
   - Page 2 "Role fit" table: 5-6 rows mapping the job's main requirements to proof.
3. Never claim an unsupported phrase. List it in the reply as a gap instead.

## Build and check
1. Render with headless Chromium to A4 PDF. No section may overflow its box; exactly 2 pages.
2. `pdftotext -raw`: must read in order (header, profile, skills, experience, education, page 2). Never position text absolutely; it scrambles the reading order.
3. Look for words glued across line breaks (e.g. "problemsolving") and rephrase.
4. Render both pages to PNG and look at them: no orphan words, nothing touching the frame, photo crop shows the face.
5. Set PDF metadata: title, author, and the job's keywords.

## Deliver
The PDF, a short table of what changed, any requirement left unclaimed, and any fact that needs the person's confirmation.
