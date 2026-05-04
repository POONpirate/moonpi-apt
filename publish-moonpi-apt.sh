#!/usr/bin/env bash
set -euo pipefail
# publish-moonpi-apt.sh
# Adds a .deb to the reprepro apt repo and pushes to GitHub Pages.
# Usage:
#   ./publish-moonpi-apt.sh /path/to/moonpi_1.0-1_armhf.deb

REPO_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

if [[ -z "${1:-}" ]]; then
  echo "Usage: $0 <path-to-.deb>" >&2
  exit 1
fi

DEB="$1"

if [[ ! -f "$DEB" ]]; then
  echo "ERROR: file not found: $DEB" >&2
  exit 1
fi

echo "📦 Adding $(basename "$DEB") to repo…"
reprepro -b "$REPO_DIR" includedeb bookworm "$DEB"

echo "📤 Committing and pushing to GitHub…"
cd "$REPO_DIR"
git add -A
git commit -m "publish: $(basename "$DEB")"
git push

echo "✅ Done — package live at https://poonpirate.github.io/moonpi-apt"
