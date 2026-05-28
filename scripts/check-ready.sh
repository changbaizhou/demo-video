#!/usr/bin/env bash
set -euo pipefail

ROOT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
VIDEO_FILE="$ROOT_DIR/video/demo.mp4"

cd "$ROOT_DIR"

echo "Checking static site files..."

for required_file in index.html assets/site.css assets/app.js render.yaml; do
  if [ ! -f "$required_file" ]; then
    echo "Missing: $required_file"
    exit 1
  fi
done

echo "Required page files are present."

if [ -f "$VIDEO_FILE" ]; then
  SIZE_BYTES="$(wc -c < "$VIDEO_FILE" | tr -d ' ')"
  SIZE_MB="$(( (SIZE_BYTES + 1048575) / 1048576 ))"
  echo "Video found: video/demo.mp4 (${SIZE_MB} MB)"
else
  echo "Video not found yet: video/demo.mp4"
fi

echo "Ready for GitHub and Render deployment."
