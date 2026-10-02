---
name: creator-contract-review
description: Review an influencer or creator agreement for risky clauses (usage rights, exclusivity, payment terms, revisions, ownership, kill fee, disclosure) and draft a friendly negotiation email. Use when someone shares a creator contract or asks if a deal is fair.
---

# Creator contract review

Clause detection is done by [creator-contract-checker](https://github.com/Vishwajeetkumbhar379/creator-contract-checker). This skill covers the review conversation.

## 1 · Get the text
Ask for the contract as text (copied out of the PDF) and which side the person is on: creator or brand.

## 2 · Run the checker
`contract-check contract.txt --side creator` (add `--ai` for rewrites and an email). Every finding quotes the exact sentence it came from.

## 3 · Prioritise
- **High**: perpetual usage, ownership transfer, unlimited revisions, payment over 60 days, broad exclusivity without a fee. Fix before signing.
- **Medium**: paid usage without a fee, a late payment trigger, no kill fee, raw footage, auto-renewal, no disclosure clause.
- **Low**: approval deadlines, one-sided morality clause, governing law.

## 4 · Propose fair wording
Fair to both sides and realistic for the deal size. Typical asks: 6-12 months of usage on named channels, a paid-usage fee per month, exclusivity limited to named competitors for the campaign plus 30-90 days with a fee, net 30 from posting or invoice, two revision rounds, a 50% kill fee after the brief is accepted, and an explicit disclosure label for the market (Germany: "Werbung" or "Anzeige").

## 5 · Draft the email
Under 150 words, friendly, listing the 3-5 changes that matter most. Apply the `application-humanizer` rules.

## Always
Say clearly that this is a commercial review, not legal advice, and suggest a lawyer for high-value or unusual agreements.
