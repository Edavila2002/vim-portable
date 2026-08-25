" ============================================================================
" VIM PORTABLE - CONFIGURACIÓN PROFESIONAL (CoC + LSP)
" ============================================================================
" Autor: Estedev
" Descripción: Entorno de Vim portable orientado al desarrollo de software,
" con soporte LSP, autocompletado y navegación semántica de código.

set nocompatible

" ==========================================================
" 🧠 CONFIGURACIÓN PORTABLE DE COC
" ==========================================================

" Usa el coc-settings.json del entorno HOME portable como configuración de CoC"
let g:coc_config_home = expand('$HOME')

" ==========================================================
" 🧩 GESTIÓN DE PLUGINS
" ==========================================================
call plug#begin(expand('$HOME/vim/plugged'))

" --- Estética y Temas ---
Plug 'tomasiser/vim-code-dark'    " Tema principal (estilo VS Code)
Plug 'ku1ik/vim-monokai'          " Tema alternativo
Plug 'vim-airline/vim-airline'    " Barra de estado inferior
Plug 'ryanoasis/vim-devicons'     " Iconos para archivos (requiere NerdFonts)

" --- Funcionalidad IDE ---
Plug 'preservim/nerdtree'         " Explorador de archivos (árbol lateral)
Plug 'junegunn/fzf'               " Motor de búsqueda fzf
Plug 'junegunn/fzf.vim'           " Integración de búsqueda rápida en Vim
Plug 'neoclide/coc.nvim', {'branch': 'release'} " Motor LSP (Autocompletado y Errores)
Plug 'preservim/nerdcommenter'    " Comentar código rápido
"Plug 'sheerun/vim-polyglot'       " Resaltado de sintaxis para +100 lenguajes
Plug 'voldikss/vim-floaterm'      " Terminal flotante
Plug 'tpope/vim-fugitive'         " Cliente Git integrado

" --- Inteligencia Artificial ---
"Plug 'Exafunction/codeium.vim'   " IA desactivada temporalmente

call plug#end()

" ==========================================================
" 🤖 CODEIUM / WINDSURF
" ==========================================================

"let g:codeium_manager_path = '/home/estedev/vim-portable/.codeium'
"let g:codeium_bin_path = '/home/estedev/vim-portable/bin/codeium_language_server'

" No mostrar sugerencias de IA como texto gris
"let g:codeium_render = v:false

" ==========================================================
" ⚙️ CONFIGURACIÓN GENERAL
" ==========================================================

" Indentación y Tabs
set autoindent                  " Mantiene la indentación de la línea anterior
set smartindent                 " Indentación inteligente para código
set expandtab                   " Usa espacios en lugar de tabs reales
set shiftwidth=2                " Tamaño de la indentación (2 espacios)
set softtabstop=2               " Simula tabs de 2 espacios
set tabstop=2                   " Visualización de tabs

" Visualización
set wrap                        " Ajusta líneas largas visualmente
set number                      " Muestra el número real de la línea actual
set relativenumber              " Muestra líneas relativas a la posición del cursor
set cursorline                  " Resalta la línea actual
set encoding=utf8               " Codificación UTF-8
syntax on                       " Activa resaltado de sintaxis

" Búsqueda
set ignorecase                  " Ignorar mayúsculas al buscar...
set smartcase                   " ...a menos que escribas una mayúscula
set incsearch                   " Buscar mientras escribes
set hlsearch                    " Resaltar resultados

" ==========================================================
" 🎨 APARIENCIA Y TEMA
" ==========================================================

set termguicolors              " Activa colores RGB reales en terminal
set background=dark            " Define fondo oscuro
colorscheme codedark           " Activa tema Code Dark

" ==========================================================
" 🎨 RESALTADO SEMÁNTICO - COC + CLANGD + CODEDARK
" ==========================================================

" Variables y parámetros -> Light Blue #9CDCFE
highlight! link CocSemTypeVariable Identifier
highlight! link CocSemTypeParameter Identifier
highlight! link CocSemTypeProperty Identifier

" Funciones -> Yellow #DCDCAA
highlight! link CocSemTypeFunction Function

" Macros -> Pink #C586C0
highlight! link CocSemTypeMacro Macro

" Tipos definidos por el usuario -> Blue Green #4EC9B0
highlight CodedarkUserType guifg=#4EC9B0 ctermfg=43
highlight! link CocSemTypeClass CodedarkUserType
highlight! link CocSemTypeEnum CodedarkUserType
highlight! link CocSemTypeType CodedarkUserType

" Miembros de enum -> Constant
highlight! link CocSemTypeEnumMember Constant
" --- TRANSPARENCIA  ---
" Descomenta las siguientes 4 líneas si quieres fondo transparente:
"hi Normal ctermbg=NONE guibg=NONE
"hi LineNr ctermbg=NONE guibg=NONE
"hi SignColumn ctermbg=NONE guibg=NONE
"hi EndOfBuffer ctermbg=NONE guibg=NONE

" ==========================================================
" 🚫 MODO HARDCORE - MOVIMIENTO CON H J K L
" ==========================================================

" --- Modo NORMAL ---
nnoremap <up> <nop>     " Desactiva ↑
nnoremap <down> <nop>   " Desactiva ↓
nnoremap <left> <nop>   " Desactiva ←
nnoremap <right> <nop>  " Desactiva →

" --- Modo INSERT ---
" Las flechas quedan habilitadas para usar el autocompletado.
"inoremap <up> <nop>     " Desactivaría ↑
"inoremap <down> <nop>   " Desactivaría ↓
"inoremap <left> <nop>   " Desactivaría ←
"inoremap <right> <nop>  " Desactivaría →

" --- Modo VISUAL ---
vnoremap <up> <nop>     " Desactiva ↑
vnoremap <down> <nop>   " Desactiva ↓
vnoremap <left> <nop>   " Desactiva ←
vnoremap <right> <nop>  " Desactiva →

" ==========================================================
" 🧠 COC.NVIM - NAVEGACIÓN Y LSP
" ==========================================================

" Ir a definición
nmap <silent> gd <Plug>(coc-definition)

" Ir a definición de tipo
nmap <silent> gy <Plug>(coc-type-definition)

" Ir a implementación
nmap <silent> gi <Plug>(coc-implementation)

" Mostrar referencias
nmap <silent> gr <Plug>(coc-references)

" Mostrar documentación
nnoremap <silent> K :call CocActionAsync('doHover')<CR>

" Renombrar símbolo
nmap <leader>rn <Plug>(coc-rename)

" Ir al diagnóstico anterior
nmap <silent> [g <Plug>(coc-diagnostic-prev)

" Ir al diagnóstico siguiente
nmap <silent> ]g <Plug>(coc-diagnostic-next)


" ==========================================================
" 🧠 COC.NVIM - AUTOCOMPLETADO
" ==========================================================

" ENTER:
" Si aparece el menú -> acepta la opción seleccionada
" Si no hay menú -> inserta una nueva línea normalmente
inoremap <silent><expr> <CR>
      \ coc#pum#visible()
      \ ? coc#pum#confirm()
      \ : "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"
