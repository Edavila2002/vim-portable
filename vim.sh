#!/usr/bin/env bash

# Ruta absoluta del directorio del script
DIR="$(cd "$(dirname "$0")" && pwd)"

# Hace que Vim use este repo como HOME
# (evita escribir en ~/.vim y ~/.config)
export HOME="$DIR"

# Lanza Vim con configuración portable
# -u     -> usa este vimrc
# --cmd  -> añade esta ruta al runtimepath
# "$@"   -> pasa archivos como argumentos
vim \
  -u "$DIR/vimrc" \
  --cmd "set runtimepath^=$DIR/vim" \
  "$@"

