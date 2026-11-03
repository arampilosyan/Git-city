#!/usr/bin/env bash
# Օգտագործում․ ./collect.sh /ճանապարհ/դեպի/նախագծերի/թղթապանակ
# Տպում է «անուն,commit-ների քանակ» ցանկը, որը կարող ես տեղադրել index.html-ի տեքստային դաշտում։
dir="${1:-.}"
for d in "$dir"/*/; do
  [ -d "$d/.git" ] || continue
  n=$(git -C "$d" rev-list --count HEAD 2>/dev/null) || continue
  echo "$(basename "$d"),$n"
done
