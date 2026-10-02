---
name: creator-shortlist
description: Build and defend an influencer shortlist for a brand brief, with explainable scores, risk flags and outreach drafts. Use when someone asks to vet creators, pick influencers, or shortlist creators for a campaign.
---

# Creator shortlist

Scoring is done by [creator-fit-scorer](https://github.com/Vishwajeetkumbhar379/creator-fit-scorer). This skill covers the workflow around it.

## 1 · Pin down the brief
Brand, product, goal (awareness, consideration or sales), target markets and age bands, topics, platforms, total budget, maximum cost per 1,000 reached, and blocked topics. Ask for anything missing; don't guess the budget.

## 2 · Collect creator data
One row per creator: handle, platform, followers, average reach, engagement rate, top audience country and age band, topics, estimated fee, recent flags. Mark any number that is an estimate.

## 3 · Score
Run `creator-fit creators.csv brief.toml`. Five pillars: audience fit 30%, content fit 25%, engagement health 25%, cost efficiency 10%, brand safety 10%.

## 4 · Sanity-check the outliers
- Engagement far above the tier's normal band: check for engagement pods or bought engagement.
- Reach far below followers: an inactive audience.
- One creator taking more than 40% of the budget: concentration risk.

## 5 · Present it
Shortlist / maybe / pass / reject, each with the reasons in plain language, so the client can see why. For the top creators, add one content angle and a short first outreach message (with `--ai`, or written by hand using the `application-humanizer` rules).

## Always
Never invent creator statistics. Brand-safety blocks are not negotiable by score.
