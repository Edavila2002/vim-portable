# Vim Portable 🚀

![Vim portable – vista general](assets/vim-imagen1.png)

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
- Usar Vim como editor principal para desarrollo de software
- Incorporar herramientas de IDE sin perder la filosofía de edición de Vim.
- Poder usar Vim en cualquier equipo con solo clonar el repo
- Mantener un entorno limpio y controlado
- Extender el entorno progresivamente según los lenguajes y tecnologías utilizadas

---

## 🧩 ¿Qué incluye esta configuración?

### Editor y apariencia
- 🎨 Tema principal **Code Dark**.
- 🎨 Tema alternativo **Monokai**.
- ✨ Barra de estado con **vim-airline**.
- 🌈 Iconos mediante **vim-devicons**.
- 🔢 Números de línea absolutos y relativos.
- 🎯 Resaltado de la línea actual.

### Herramientas de desarrollo

- 🧠 Autocompletado y soporte LSP mediante **coc.nvim**.
- ⚙️ Soporte para C/C++ mediante **clangd**.
- 📁 Explorador de archivos con **NERDTree**.
- 🔍 Búsqueda rápida mediante **fzf** y **fzf.vim**.
- 💬 Terminal integrada con **vim-floaterm**.
- 🧭 Integración con Git mediante **vim-fugitive**.
- 💬 Comentado rápido de código con **NERDCommenter**.

---

## 📂 Estructura del proyecto
La estructura principal del proyecto es:

```text
vim-portable/
├── vim.sh                 # Script para lanzar Vim portable
├── vimrc                  # Configuración principal de Vim
├── coc-settings.json      # Configuración de CoC / LSP
├── .gitignore
├── README.md
├── assets/                # Imágenes y recursos del repositorio
└── vim/
    ├── autoload/
    │   └── plug.vim       # Gestor de plugins vim-plug
    └── plugged/           # Plugins instalados localmente

```
Algunas herramientas opcionales pueden generar directorios locales adicionales. Estos archivos no forman parte necesariamente de la configuración que debe versionarse en Git.

---
## 🖥️ Sistemas operativos compatibles


La configuración está orientada principalmente a sistemas **Unix-like**.

Ha sido diseñada para trabajar en:

- ✅ Linux (Ubuntu, Arch, Fedora, etc.)


- ✅ macOS


El script vim.sh detecta automáticamente el sistema y resuelve correctamente

la ruta del proyecto, incluso cuando se ejecuta mediante enlaces simbólicos.

---

##  📝 Requisitos 

- Vim 8 o superior.

- Git

- Node.js(requerido para coc.nvim)

- Nerd font (para iconos en el terminal)

- clangd (para soporte LSP de C/C++)

---


## ⚙️  Instalación

Clona el repositorio:

```bash
git clone https://github.com/Edavila2002/vim-portable.git
```

Entra en la carpeta:

```bash
cd vim-portable
```

Ejecuta Vim:

```bash
./vim.sh
```

Dentro de Vim instala los plugins:

```vim
:PlugInstall
```


---
## 🧠 Soporte LSP con CoC

Este proyecto utiliza **coc.nvim** como cliente LSP.

Esto permite incorporar funcionalidades como:

- Autocompletado.
- Navegación hacia definiciones.
- Referencias.
- Implementaciones.
- Información de tipos.
- Diagnósticos.
- Renombrado de símbolos.
- Documentación contextual.

Cada lenguaje puede necesitar su propia extensión o servidor LSP.

### C y C++

Para C/C++ se utiliza:

```text
Vim
 └── coc.nvim
      └── coc-clangd
           └── clangd
```

La extensión puede instalarse desde Vim con:

```vim
:CocInstall coc-clangd
```

---

## ⌨️ Autocompletado

CoC muestra automáticamente un menú cuando existen sugerencias disponibles.

El flujo configurado actualmente es:

```text
Escribir código
      ↓
Aparece el menú de sugerencias
      ↓
↑ / ↓ para seleccionar
      ↓
Enter para aceptar
```

### Controles

| Tecla | Acción |
|---|---|
| `↑` | Opción anterior |
| `↓` | Opción siguiente |
| `Enter` | Aceptar sugerencia |
| `Tab` | Indentación normal |

Las flechas permanecen disponibles en **modo Insert** para interactuar cómodamente con el menú de autocompletado.

---

## 🧭 Navegación LSP

La configuración incluye los siguientes comandos:

| Comando | Acción |
|---|---|
| `gd` | Ir a la definición |
| `gy` | Ir a la definición del tipo |
| `gi` | Ir a la implementación |
| `gr` | Mostrar referencias |
| `K` | Mostrar documentación |
| `[g` | Ir al diagnóstico anterior |
| `]g` | Ir al diagnóstico siguiente |
| `<leader>rn` | Renombrar símbolo |

Por ejemplo, colocando el cursor sobre una función:

```text
gd
```

permite saltar directamente a su definición.

---

## ↩️ Navegación entre saltos

Vim mantiene un historial de los lugares visitados.

Después de utilizar comandos como `gd` puedes regresar con:

```text
Ctrl + o
```

y avanzar nuevamente con:

```text
Ctrl + i
```

Flujo típico:

```text
main.c
  │
  │ gd
  ▼
definición
  │
  │ Ctrl+o
  ▼
main.c
```

---

## 🔢 Números de línea relativos

La configuración utiliza:

```vim
set number
set relativenumber
```

La línea actual muestra su número real, mientras que las demás indican su distancia respecto al cursor.

Esto facilita movimientos propios de Vim como:

```text
5j
```

para bajar cinco líneas, o:

```text
8k
```

para subir ocho líneas.

---

## 🚫 Movimiento con H J K L

Las flechas están desactivadas en los modos **Normal** y **Visual** con el objetivo de fomentar el aprendizaje de los movimientos de Vim:

```text
h → izquierda
j → abajo
k → arriba
l → derecha
```

En modo **Insert** las flechas permanecen habilitadas para utilizar el menú de autocompletado.

---

## 🧠 Uso diario

Puedes abrir un archivo directamente:

```bash
./vim.sh archivo.c
```

También puedes iniciar Vim sin especificar un archivo:

```bash
./vim.sh
```

Desde allí puedes utilizar NERDTree, fzf y las demás herramientas instaladas para navegar por el proyecto.

---

## 🌍 Uso global opcional

Por defecto puedes ejecutar:

```bash
./vim.sh archivo.c
```

desde la carpeta del repositorio.

Si deseas acceder a Vim Portable desde cualquier ubicación, puedes crear un enlace simbólico.

Primero asegúrate de tener:

```bash
mkdir -p ~/.local/bin
```

Después crea el enlace utilizando la ruta donde clonaste el repositorio:

```bash
ln -s /ruta/al/repositorio/vim-portable/vim.sh ~/.local/bin/vim.sh
```

Después podrás ejecutar:

```bash
vim.sh archivo.c
```

o:

```bash
vim.sh .
```

desde otras carpetas del sistema.

---

## 🧭 Git dentro de Vim

La configuración incluye **vim-fugitive**, lo que permite ejecutar operaciones Git directamente desde Vim.

Por ejemplo:

```vim
:Git status
```

```vim
:Git add archivo
```

```vim
:Git commit
```

```vim
:Git push
```

Git también puede seguir utilizándose normalmente desde la terminal.

---

## 🤖 Inteligencia Artificial opcional

El proyecto contempla integración con **Codeium/Windsurf**, pero actualmente se encuentra desactivada por defecto.

Esto permite utilizar el entorno con:

```text
Vim
+
CoC
+
LSP
+
herramientas de desarrollo
```

sin generación automática de código mediante IA.

La integración puede habilitarse posteriormente desde el archivo `vimrc` cuando sea necesaria.

De esta manera, la IA funciona como una herramienta adicional del entorno y no como una dependencia obligatoria.

---

## 🌐 Otros lenguajes

La arquitectura basada en CoC permite ampliar el entorno progresivamente.

Dependiendo del lenguaje utilizado, pueden instalarse extensiones LSP adicionales.

Actualmente el entorno tiene soporte LSP configurado para C/C++ mediante:

```vim
:CocInstall coc-clangd
```

El soporte para nuevos lenguajes puede incorporarse según las necesidades de cada proyecto.

---

## 🔌 Plugins utilizados

Este proyecto utiliza los siguientes plugins y herramientas open-source:

- **vim-plug** — Gestor de plugins
  https://github.com/junegunn/vim-plug

- **coc.nvim** — LSP y autocompletado
  https://github.com/neoclide/coc.nvim

- **NERDTree** — Explorador de archivos
  https://github.com/preservim/nerdtree

- **fzf** — Motor de búsqueda fuzzy
  https://github.com/junegunn/fzf

- **fzf.vim** — Integración de fzf con Vim
  https://github.com/junegunn/fzf.vim

- **vim-airline** — Barra de estado
  https://github.com/vim-airline/vim-airline

- **vim-code-dark** — Tema visual Code Dark
  https://github.com/tomasiser/vim-code-dark

- **vim-monokai** — Tema visual Monokai
  https://github.com/ku1ik/vim-monokai

- **NERDCommenter** — Comentado rápido de código
  https://github.com/preservim/nerdcommenter

- **vim-polyglot** — Resaltado de sintaxis para múltiples lenguajes
  https://github.com/sheerun/vim-polyglot

- **vim-devicons** — Iconos para archivos
  https://github.com/ryanoasis/vim-devicons

- **vim-fugitive** — Integración con Git
  https://github.com/tpope/vim-fugitive

- **vim-floaterm** — Terminal flotante
  https://github.com/voldikss/vim-floaterm

### Integración opcional

- **Codeium/Windsurf** — Asistencia mediante Inteligencia Artificial.
  Actualmente desactivada por defecto.

---

## 🚧 Evolución del proyecto

Esta configuración se desarrolla progresivamente.

La idea no es instalar herramientas innecesarias, sino incorporar nuevas capacidades a medida que sean requeridas para el desarrollo de software.

Entre las áreas que pueden ampliarse posteriormente se encuentran:

- Desarrollo web.
- Desarrollo con C y C++.
- Desarrollo de videojuegos.
- Debugging.
- Testing.
- Formateo de código.
- Sistemas de compilación.
- Soporte LSP para nuevos lenguajes.
- Integración opcional con herramientas de Inteligencia Artificial.

---

## 📄 Licencia

Este proyecto contiene una configuración personal de Vim construida utilizando diferentes proyectos open-source.

Consulta las licencias individuales de cada plugin para conocer sus respectivos términos de uso.
