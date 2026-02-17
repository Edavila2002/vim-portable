" ============================================================================
" VIM PORTABLE - CONFIGURACIÓN PROFESIONAL (CoC + Codeium)
" ============================================================================
" Autor: Estedev
" Descripción: Configuración optimizada para transformar Vim en un IDE ligero
" con soporte para Inteligencia Artificial y autocompletado LSP.

set nocompatible

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
Plug 'sheerun/vim-polyglot'       " Resaltado de sintaxis para +100 lenguajes
Plug 'voldikss/vim-floaterm'      " Terminal flotante
Plug 'tpope/vim-fugitive'         " Cliente Git integrado

" --- Inteligencia Artificial ---
Plug 'Exafunction/codeium.vim'    " Autocompletado con IA (Gratuito)

call plug#end()


" ==========================================================
" 🤖 CONFIGURACIÓN DE PORTABILIDAD (IA)
" ==========================================================
" Estas líneas fuerzan a la IA a instalarse DENTRO de la carpeta portable.
" Así no deja residuos en el sistema operativo anfitrión.

let g:codeium_manager_path = '/home/estedev/vim-portable/.codeium'
let g:codeium_bin_path = '/home/estedev/vim-portable/bin/codeium_language_server'


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
set wrap                        " Ajuste de línea visual (no corta palabras)
set number                      " Muestra números de línea
set cursorline                  " Resalta la línea actual
set encoding=utf8               " Codificación universal
syntax on                       " Activar colores de sintaxis

" Búsqueda
set ignorecase                  " Ignorar mayúsculas al buscar...
set smartcase                   " ...a menos que escribas una mayúscula
set incsearch                   " Buscar mientras escribes
set hlsearch                    " Resaltar resultados


" ==========================================================
" 🎨 APARIENCIA Y TEMA
" ==========================================================
colorscheme codedark            " Activar tema oscuro
set background=dark

" --- TRANSPARENCIA  ---
" Descomenta las siguientes 4 líneas si quieres fondo transparente:
" hi Normal ctermbg=NONE guibg=NONE
 "hi LineNr ctermbg=NONE guibg=NONE
 "hi SignColumn ctermbg=NONE guibg=NONE
 "hi EndOfBuffer ctermbg=NONE guibg=NONE


" ==========================================================
" 🚫 MODO HARDCORE (Desactivar Flechas)
" ==========================================================
" Obliga a usar h, j, k, l para moverse.
nnoremap <up> <nop>
nnoremap <down> <nop>
nnoremap <left> <nop>
nnoremap <right> <nop>
inoremap <up> <nop>
inoremap <down> <nop>
inoremap <left> <nop>
inoremap <right> <nop>
vnoremap <up> <nop>
vnoremap <down> <nop>
vnoremap <left> <nop>
vnoremap <right> <nop>


" ==========================================================
" 🧠 COC.NVIM - NAVEGACIÓN Y LSP
" ==========================================================
" Ir a definición (gd), tipo (gy), implementación (gi), referencias (gr)
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Mostrar documentación flotante (Shift + K)
nnoremap <silent> K :call CocActionAsync('doHover')<CR>

" Renombrar variables en todo el archivo (<leader>rn)
nmap <leader>rn <Plug>(coc-rename)

" Diagnósticos (Errores y Warnings)
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)


" ==========================================================
" 🚀 CONFIGURACIÓN DE AUTOCOMPLETADO E IA (RECARGADA)
" ==========================================================

" 1. DESACTIVAR EL TAB NATIVO DE CODEIUM 
" (Esto evita que Codeium se robe el Tab que usa CoC)
let g:codeium_no_map_tab = 1

" 2. MAPPING PARA ACEPTAR IA CON CTRL + L
" Usamos 'expr' para asegurar que Codeium reciba la orden correctamente
imap <script><silent><nowait><expr> <C-l> codeium#Accept()

" 3. TECLA TABULADOR (Ahora solo para CoC)
inoremap <silent><expr> <Tab>
      \ coc#pum#visible() ? coc#pum#next(1) :
      \ CheckBackspace() ? "\<Tab>" :
      \ coc#refresh()

" 4. OTROS CONTROLES DE IA
imap <C-j> <Cmd>call codeium#CycleCompletions(1)<CR>
imap <C-k> <Cmd>call codeium#CycleCompletions(-1)<CR>
imap <C-x> <Cmd>call codeium#Clear()
