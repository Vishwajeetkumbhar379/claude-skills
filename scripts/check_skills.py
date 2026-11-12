#!/usr/bin/env python3
"""Check every skill: valid SKILL.md, listed in the README, and the bundled files it names exist."""
import re
import sys
from pathlib import Path

ROOT = Path(__file__).resolve().parent.parent
readme = (ROOT / "README.md").read_text(encoding="utf-8")
errs = []
skills = sorted(p for d in ("skills", ".claude/skills") for p in (ROOT / d).iterdir() if p.is_dir())
for d in skills:
    f = d / "SKILL.md"
    if not f.exists():
        errs.append(f"{d.name}: no SKILL.md")
        continue
    text = f.read_text(encoding="utf-8")
    m = re.match(r"---\n(.*?)\n---\n", text, re.S)
    front = m.group(1) if m else ""
    name = re.search(r"^name:\s*\"?([\w-]+)", front, re.M)
    desc = re.search(r"^description:\s*(.+)", front, re.M)
    if not name or name.group(1) != d.name:
        errs.append(f"{d.name}: frontmatter name missing or not the folder name")
    if not desc:
        errs.append(f"{d.name}: no description")
    elif len(desc.group(1)) > 1024:
        errs.append(f"{d.name}: description over 1024 characters")
    if d.name not in readme:
        errs.append(f"{d.name}: not in README")
    for ref in set(re.findall(r"`((?:references|scripts|templates|data)/[\w./-]+\.\w+)`", text)):
        if not (d / ref).exists():
            errs.append(f"{d.name}: names {ref}, which is missing")
print("\n".join(errs) or f"OK: {len(skills)} skills")
sys.exit(1 if errs else 0)
