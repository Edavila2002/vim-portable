set nocompatible

" ===============================
" Hacer que Vim vea Node instalado con nvm
" ===============================
"let $NVM_DIR = expand('~/.nvm')                  " Define la ruta donde se encuentra NVM
"if filereadable($NVM_DIR . '/nvm.sh')            " Comprueba si el archivo nvm.sh existe
  " Carga nvm
  "execute 'silent !. ' . $NVM_DIR . '/nvm.sh'    " Ejecuta el script de NVM en silencio
  " Agrega Node al PATH
  "let $PATH = $NVM_DIR . '/versions/node/' . trim(system('nvm version')) . '/bin:' . $PATH
"endif

"==========================================================
" 🧩 GESTIÓN DE PLUGINS
"==========================================================
" Usamos vim-plug para instalar y manejar los plugins de Vim.
" Los plugins se guardarán en ~/.vim/plugged/

call plug#begin(expand('$HOME/vim/plugged'))

" 🎨 Temas de color
Plug 'tomasiser/vim-code-dark'    " Tema inspirado en Visual Studio Code Dark+
Plug 'ku1ik/vim-monokai'          " Tema Monokai clásico (por si quieres alternar)

" 📁 Explorador de archivos tipo árbol
Plug 'preservim/nerdtree'         " Permite navegar entre carpetas y archivos fácilmente

" 🔍 Búsqueda avanzada y fuzzy finder
Plug 'junegunn/fzf'               " Motor de búsqueda rápida (en terminal)
Plug 'junegunn/fzf.vim'           " Integración de FZF dentro de Vim

" 🧠 Autocompletado y LSP (para desarrollo en múltiples lenguajes)
Plug 'neoclide/coc.nvim', {'branch': 'release'} " Autocompletado inteligente y soporte LSP

" 🧾 Soporte para comentarios y resaltado de sintaxis
Plug 'preservim/nerdcommenter'    " Comenta y descomenta fácilmente bloques de código
Plug 'sheerun/vim-polyglot'       " Soporte extendido de sintaxis para múltiples lenguajes

" 💬 Terminal flotante dentro de Vim
Plug 'voldikss/vim-floaterm'      " Permite abrir una terminal dentro de Vim (ideal para ejecutar comandos)

" ✨ Barra de estado elegante y funcional
Plug 'vim-airline/vim-airline'    " Muestra información del archivo, modo y más en la parte inferior

" 🌈 Iconos para Airline y NERDTree
Plug 'ryanoasis/vim-devicons'     " Añade iconos NerdFont a los menús y la barra de estado

" 🧭 Git desde Vim
Plug 'tpope/vim-fugitive'         " Permite ejecutar comandos Git directamente dentro de Vim

call plug#end()                    " Finaliza la declaración de plugins y carga los instalados

"==========================================================
" ⚙️ CONFIGURACIÓN GENERAL DEL EDITOR
"==========================================================
" Ajustes que mejoran la experiencia general al escribir código.

" 🔹 Indentación y tabulación
set autoindent                    " Copia el nivel de indentación de la línea anterior
set smartindent                   " Detecta estructuras de código y ajusta la indentación automáticamente
set smarttab                      " Inserta espacios en lugar de tabulaciones según el shiftwidth
set shiftwidth=2                  " Cantidad de espacios por nivel de indentación
set softtabstop=2                 " Cantidad de espacios que representa un tabulador al borrar
set tabstop=2                     " Cantidad de espacios visibles por tabulador
set expandtab                     " Convierte los tabuladores en espacios

" 🔹 Ajustes de visualización
set wrap                          " Permite que las líneas largas se partan visualmente
set number                        " Muestra el número de línea en el margen
"set relativenumber                " Muestra números relativos (mejor para moverse con j/k)
set cursorline                    " Resalta la línea actual para mejor visibilidad

" 🔹 Resaltado de sintaxis
syntax on                         " Activa el coloreado de sintaxis

" 🔹 Codificación
set encoding=utf8                 " Usa UTF-8 como codificación por defecto

" 🔹 Búsqueda
set ignorecase                    " Ignora mayúsculas/minúsculas al buscar
set smartcase                     " Pero respeta mayúsculas si la búsqueda las contiene
set incsearch                     " Muestra coincidencias mientras escribes
set hlsearch                      " Resalta todas las coincidencias encontradas

" 🔹 Portapapeles del sistema
"set clipboard=unnamedplus         " Permite copiar y pegar directamente con el portapapeles del sistema


"==========================================================
" 🧹 FORMATEO AUTOMÁTICO
"==========================================================
" Ejecuta el formateador del lenguaje al guardar archivos comunes.
" Soporta: JavaScript, TypeScript, Python, JSON, CSS, HTML, C y C++.
" Requiere tener instaladas las extensiones de CoC correspondientes.
" Ejemplo: :CocInstall coc-pyright coc-tsserver coc-clangd

"autocmd BufWritePre *.js,*.ts,*.py,*.json,*.css,*.html,*.c,*.cpp :CocCommand editor.action.format
" Ejecuta automáticamente el comando de formateo de CoC antes de guardar archivos de estos tipos


"==========================================================
" 🎨 TEMA DE COLOR
"==========================================================
" Puedes cambiar entre monokai o codedark simplemente comentando uno u otro.

"colorscheme monokai               " Tema alternativo Monokai
colorscheme codedark              " Tema actual basado en Visual Studio Code Dark+

"==========================================================
" 🚫 DESHABILITAR FLECHAS (para fomentar el uso del modo normal)
"==========================================================
" Estas líneas desactivan las flechas para obligarte a usar h, j, k, l.
" Mejora la productividad y la memoria muscular en Vim.

" --- En modo normal ---
nnoremap <up> <nop>               " Desactiva flecha arriba
nnoremap <down> <nop>             " Desactiva flecha abajo
nnoremap <left> <nop>             " Desactiva flecha izquierda
nnoremap <right> <nop>            " Desactiva flecha derecha


" --- En modo inserción ---
inoremap <up> <nop>               " Desactiva flecha arriba
inoremap <down> <nop>             " Desactiva flecha abajo
inoremap <left> <nop>             " Desactiva flecha izquierda
inoremap <right> <nop>            " Desactiva flecha derecha

" --- En modo visual ---
vnoremap <up> <nop>               " Desactiva flecha arriba
vnoremap <down> <nop>             " Desactiva flecha abajo
vnoremap <left> <nop>             " Desactiva flecha izquierda
vnoremap <right> <nop>            " Desactiva flecha derecha

"==========================================================
" ✅ NOTAS EXTRA (Opcional)
"==========================================================
" Puedes abrir NERDTree con :NERDTreeToggle
" Para cambiar de tema rápidamente, usa por ejemplo:
"   :colorscheme monokai
"   :colorscheme codedark
"==========================================================


" ============================================================
" 🧠 COC.NVIM - MAPEOS DE TECLAS PARA NAVEGACIÓN Y AUTOCOMPLETADO
" ============================================================
" Estos atajos permiten usar las funciones LSP (como ir a definición,
" ver referencias, mostrar documentación y autocompletar código)
" de forma fluida dentro de Vim.


" ============================================================
" 🧠 COC.NVIM - CONFIGURACIÓN Y MAPEOS DE TECLAS
" ============================================================
" Este bloque integra los atajos esenciales para usar el sistema LSP
" (Language Server Protocol) mediante el plugin coc.nvim.
" Incluye navegación, documentación, autocompletado y diagnóstico.
" ------------------------------------------------------------

" ==============================
" 📦 NAVEGACIÓN ENTRE SÍMBOLOS
" ==============================

" Ir a la definición del símbolo bajo el cursor.
nmap <silent> gd <Plug>(coc-definition)

" Ir a la definición de tipo (por ejemplo, el tipo de una variable).
nmap <silent> gy <Plug>(coc-type-definition)

" Ir a la implementación de una función o método.
nmap <silent> gi <Plug>(coc-implementation)

" Ver todas las referencias (dónde se usa) del símbolo bajo el cursor.
nmap <silent> gr <Plug>(coc-references)


" ==============================
" 📘 DOCUMENTACIÓN Y AYUDA
" ==============================

" Mostrar documentación flotante del símbolo bajo el cursor.
" (usa la función 'doHover' del LSP, similar a pasar el mouse en VS Code)
nnoremap <silent> K :call CocActionAsync('doHover')<CR>


" ==============================
" ✨ AUTOCOMPLETADO INTELIGENTE
" ==============================

" Si el menú de autocompletado está visible, TAB selecciona el siguiente ítem.
" Si no hay menú, TAB funciona como siempre.
inoremap <silent><expr> <TAB> pumvisible() ? "\<C-n>" : "\<TAB>"

" Si el menú de autocompletado está visible, Shift+TAB selecciona el ítem anterior.
" Si no hay menú, actúa como retroceso (Ctrl+h).
inoremap <silent><expr> <S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"


" ==============================
" 🧩 DIAGNÓSTICO Y CORRECCIÓN
" ==============================

" Mostrar lista de errores y advertencias del archivo actual.
nnoremap <silent> <leader>d :CocDiagnostics<CR>

" Ir al siguiente diagnóstico (error o warning).
nmap <silent> [g <Plug>(coc-diagnostic-prev)

" Ir al diagnóstico anterior.
nmap <silent> ]g <Plug>(coc-diagnostic-next)

" Formatear el archivo actual con el servidor LSP.
nmap <silent> <leader>f :call CocAction('format')<CR>

" Renombrar el símbolo bajo el cursor (variable, función, etc.).
nmap <leader>rn <Plug>(coc-rename)


" ==============================
" ⚙️ COMANDOS Y LISTAS
" ==============================

" Mostrar todas las listas de Coc (buffers, extensiones, símbolos, etc.)
nnoremap <leader>cl :CocList<CR>

" Mostrar el panel de extensiones Coc (instalar, actualizar, borrar).
nnoremap <leader>ce :CocList extensions<CR>

" Abrir el archivo de configuración de Coc (coc-settings.json).
nnoremap <leader>cc :CocConfig<CR>

" Mostrar los comandos disponibles de Coc.
nnoremap <leader>cm :CocCommand<CR>

