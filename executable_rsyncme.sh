#!/bin/bash

# This script synchronizes files from a source directory to a destination directory using rsync.
# It accepts two arguments: the source directory and the destination directory.
# Usage: ./rsyncme.sh [-n|--dry-run]
set -euo pipefail

DRY_RUN=0
BASE_DIR="$HOME/Documents/"
SRC="ERROR-UNDEFINED-SOURCE-PATH"
DST_USER="yehudat"
DST_HOST="aifdev"
DST_PATH="/proj/a1/dv/yehudat/rsync_macos/"

while [[ $# -gt 0 ]]; do
    case "$1" in
        -n|--dry-run)
            DRY_RUN=1
            shift
            ;;
        --src=*)
            SRC="${1#--src=}"
            shift
            ;;
        --src)
            SRC="$BASE_DIR/$2"
            DST_PATH="$DST_PATH/$(basename "$2")"
            shift 2
            ;;
        --)
            shift
            break
            ;;
        *)
            break
            ;;
    esac
done

validate_src() {
  local base_real src_real
  base_real="$(realpath "$BASE_DIR")"

  if [[ ! -e "$SRC" ]]; then
      echo "Error: Source path does not exist: $SRC" >&2
      exit 1
  fi

  src_real="$(realpath "$SRC")"

  if [[ "$src_real" != "$base_real" && "$src_real" != "$base_real"/* ]]; then
      echo "Error: Source '$src_real' is not under authorized directory '$base_real'" >&2
      exit 1
  fi

  # Use resolved path with trailing slash for rsync
  SRC="${src_real}/"
}

validate_src

RSYNC_OPTS=(
    -a
    --delete
    --progress
    -e "ssh"
    --filter=':- .gitignore'
    --exclude ".DS_Store"
)

if [[ $DRY_RUN -eq 1 ]]; then
    RSYNC_OPTS+=(--dry-run --itemize-changes)
fi

rsync "${RSYNC_OPTS[@]}" "$SRC" "${DST_USER}@${DST_HOST}:${DST_PATH}"

