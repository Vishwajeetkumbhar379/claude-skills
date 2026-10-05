#!/usr/bin/env bash
# Zips each skill folder for upload to the Claude apps (Settings → Capabilities → Skills).
# Output: dist/claude-app/<skill>.zip, with the skill folder at the zip root.
set -euo pipefail

root="$(cd "$(dirname "$0")/.." && pwd)"
out="$root/dist/claude-app"
rm -rf "$out"
mkdir -p "$out"

# The motion stack skills; pass skill names as arguments to package others.
skills=("$@")
if [ ${#skills[@]} -eq 0 ]; then
  skills=(motion-website-builder lenis-smooth-scroll vanta-backgrounds react-bits godly-inspiration
          gsap-core gsap-timeline gsap-scrolltrigger gsap-plugins gsap-react gsap-frameworks gsap-utils gsap-performance)
fi

for name in "${skills[@]}"; do
  dir=""
  for base in "$root/.claude/skills" "$root/skills"; do
    [ -f "$base/$name/SKILL.md" ] && dir="$base" && break
  done
  if [ -z "$dir" ]; then echo "skip: $name (no SKILL.md)" >&2; continue; fi
  (cd "$dir" && zip -qrX "$out/$name.zip" "$name" -x '*/.DS_Store' '*/__pycache__/*')
  echo "packed $name"
done
