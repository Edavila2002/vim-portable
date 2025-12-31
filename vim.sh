#!/usr/bin/env bash

# Resolver ruta real del script (Linux y macOS)
if command -v greadlink >/dev/null 2>&1; then
  SCRIPT_PATH="$(greadlink -f "${BASH_SOURCE[0]}")"
elif command -v readlink >/dev/null 2>&1; then
  SCRIPT_PATH="$(readlink "${BASH_SOURCE[0]}")"
else
  SCRIPT_PATH="${BASH_SOURCE[0]}"
fi

DIR="$(cd "$(dirname "$SCRIPT_PATH")" && pwd)"

# Aislar Vim dentro del repo
export HOME="$DIR"

vim \
  -u "$DIR/vimrc" \
  --cmd "set runtimepath^=$DIR/vim" \
  "$@"
