---
name: linkedin-carousel
description: Plan and produce a high-signal LinkedIn carousel in one locked visual style, rendered to PNG slides and a PDF. Use when asked for a LinkedIn post, carousel, or content ideas on AI, marketing, creators or growth.
---

# LinkedIn carousel

Rendering is handled by [linkedin-carousel-studio](https://github.com/Vishwajeetkumbhar379/linkedin-carousel-studio). This skill covers the thinking: topic, structure, words.

## 1 · Topic
If no topic is given, offer 5 options across: AI tools for marketers, creator-marketing truths, career and growth, brand strategy, and one opinion. Prefer **rare, high-signal knowledge** from the person's own experience over generic advice. Check `topic-history.md` to avoid repeats.

## 2 · Structure (6-9 slides)
1. **Cover**: a hook under 10 words with one accent word.
2. **Setup**: why it matters, two or three lines.
3. **One idea per slide**: a label, a title and at most 45 words.
4. Optionally a **compare** slide (red flag vs fair, before vs after) or a **stat** slide using a real number.
5. **CTA**: save and follow.

## 3 · Words
- Real numbers only, from the person's notes. Never invent statistics.
- Small emojis as visual anchors, used sparingly (two per deck at most).
- Run the `application-humanizer` tells list on all copy: no not-X-but-Y, no dramatic one-liners, no stock AI words.

## 4 · Caption
A punchy first line, a short arrow list (→), a save CTA and one open question.

## 5 · Render
Write the deck JSON and run `carousel render deck.json`. The renderer enforces the style rules and fails loudly if a deck breaks them. Upload the PDF to LinkedIn as a document post.

## Visual system (locked)
Light Claude-style UI · tinted cards (purple #F5F4FF, teal #F0FBF6, coral #FEF6F3) · accent #7F77DD · 0.5px borders · badge labels · pill counter · name and handle top-left · 1080×1350.
