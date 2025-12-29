# Vim Portable Configuration 🚀

Configuración **portable y reproducible** de Vim, pensada para usar la **misma experiencia de edición** en cualquier computadora sin modificar el Vim del sistema.

Este repositorio permite clonar, ejecutar y trabajar con Vim usando:
- configuración propia
- plugins gestionados con vim-plug
- soporte LSP/autocompletado con CoC
- integración con Git desde Vim

---

## 🎯 Objetivo del proyecto

El objetivo de este repositorio es:

- Tener una configuración de Vim **portable**
- No depender de `~/.vim` ni `~/.vimrc`
- Poder usar Vim en cualquier equipo con solo clonar el repo
- Mantener un entorno limpio y controlado

---

## 🧩 ¿Qué incluye esta configuración?

- 🎨 Temas de color (Code Dark, Monokai)
- 📁 Explorador de archivos (NERDTree)
- 🔍 Búsqueda avanzada (fzf)
- 🧠 Autocompletado y LSP (coc.nvim)
- 💬 Terminal integrada (floaterm)
- 🧭 Git dentro de Vim (vim-fugitive)
- ✨ Barra de estado (vim-airline)
- 🌈 Iconos (vim-devicons)

---

## 📂 Estructura del proyecto
```text
vim-portable/
├── vim.sh                 # Script para lanzar Vim portable
├── vimrc                  # Configuración principal de Vim
├── coc-settings.json      # Configuración de CoC (LSP)
├── .gitignore
├── README.md
├── vim/
│   ├── autoload/
│   │   └── plug.vim       # Gestor de plugins (vim-plug)
│   └── plugged/           # Plugins instalados (ignorado por Git)


##  📝 Requisitos 

- Vim 8+
- Git
- Node.js(requerido para coc.nvim)
- Nerd font (para iconos en el terminal)


## ⚙️  Instalación

Clona el repositorio y luego entra al proyecto:

```bash
git clone https://github.com/Edavila2002/vim-portable.git
cd vim-portable
```

Lanza Vim portable:

```bash
./vim.sh 
```

Dentro de Vim instala los Plugins:

```vim
:PlugInstall
```


## 🧠  Uso diario

Puedes abrir archivos o carpetas directamente:

```bash
./vim.sh archivo.js
./vim.sh 
```

## 🧭 Comandos Git dentro de Vim

Esta configuración incluye **vim-fugitive**, por lo que puedes usar:

```vim
:Git status
:Git add archivo
:Git commit
:Git push
```

