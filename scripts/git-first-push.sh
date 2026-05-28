#!/usr/bin/env bash
set -euo pipefail

ROOT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
REMOTE_URL="${1:-}"

if [ -z "$REMOTE_URL" ]; then
  echo "Usage: scripts/git-first-push.sh https://github.com/USER/REPO.git"
  exit 1
fi

cd "$ROOT_DIR"

if [ ! -d .git ]; then
  git init
fi

git add .

if ! git diff --cached --quiet; then
  git commit -m "Prepare demo video static site"
else
  echo "No staged changes to commit."
fi

git branch -M main

if git remote get-url origin >/dev/null 2>&1; then
  git remote set-url origin "$REMOTE_URL"
else
  git remote add origin "$REMOTE_URL"
fi

git push -u origin main
