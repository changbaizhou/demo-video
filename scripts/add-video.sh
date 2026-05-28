#!/usr/bin/env bash
set -euo pipefail

ROOT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
SOURCE_FILE="${1:-}"
TARGET_FILE="$ROOT_DIR/video/demo.mp4"

if [ -z "$SOURCE_FILE" ]; then
  echo "Usage: scripts/add-video.sh /path/to/video.mp4"
  exit 1
fi

if [ ! -f "$SOURCE_FILE" ]; then
  echo "Video file not found: $SOURCE_FILE"
  exit 1
fi

case "${SOURCE_FILE##*.}" in
  mp4|MP4)
    ;;
  *)
    echo "Expected an MP4 file. Please export your edited video as .mp4 first."
    exit 1
    ;;
esac

mkdir -p "$ROOT_DIR/video"
cp "$SOURCE_FILE" "$TARGET_FILE"

SIZE_BYTES="$(wc -c < "$TARGET_FILE" | tr -d ' ')"
SIZE_MB="$(( (SIZE_BYTES + 1048575) / 1048576 ))"

echo "Copied video to: video/demo.mp4"
echo "Size: ${SIZE_MB} MB"

if [ "$SIZE_MB" -gt 100 ]; then
  echo "Warning: this video is larger than 100 MB. It may load slowly after QR scanning."
fi
