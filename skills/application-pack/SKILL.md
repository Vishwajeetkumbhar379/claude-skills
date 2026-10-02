---
name: application-pack
description: Build a complete, truthful application for one job (tailored ATS-safe CV and cover letter, email, referral messages, form answers) or an interview prep pack. Use when someone shares a job link and says apply, or asks for interview prep.
---

# Application pack

The hands-on twin of `job-scout`. The person is present, so ask when a fact is missing, and **never send anything to an employer until they say "send".**

## Sources of truth
- The candidate's CV (as text) and `profile.md`. Never add employers, dates, titles, metrics, budgets, tools, clients, certifications, languages or skills that aren't there.
- Label every claim **VERIFIED** (in the CV), **DERIVED** (follows directly from it) or **MISSING** (ask). Never turn MISSING into VERIFIED to pass a check.

## Mode 1 · Full application
1. Fetch the job from the official ATS and confirm it is live.
2. Check it hasn't been applied to already (sent mail, application log).
3. Evaluate with the `job-scout` table and score. Below 72, recommend skipping and say why.
4. Research 1-2 verified company specifics (a launch, a hire, a market move) from official sources, with URLs.
5. Write: tailored CV (JD language, only real facts), cover letter (300-400 words), email (170-270 words), 2-4 referral notes to real people found by search (never invent people or URLs), and answers to the application form.
6. Run the `application-humanizer` rules on every text.
7. Check the CV PDF: text-based, reads in order with `pdftotext`, one column or a clean two-column layout, no text in images.
8. Deliver everything, list any MISSING facts as questions, and wait for "send".

## Mode 2 · Interview prep
Company brief with sources; the JD requirement map; 8 likely questions (3 behavioural, 3 role-specific, 2 motivation) with STAR answers **built only from real experience** (mark TO ADD where a story is missing); 4 sharp questions to ask; salary guidance (published range or a labelled estimate); a 60-second pitch. Offer a mock interview one question at a time, and never answer for the candidate.

## Mode 3 · Follow-ups and referrals
Connection note max 200 characters (role, one real proof point, light ask). Follow-up 60-110 words with one new piece of value. Never "just checking in".

## Always
Truth beats score. Unknown facts become questions.
