" leader tecla
let mapleader = ","

" directorio de plugins
call plug#begin('~/.local/share/nvim/plugged')

" plugins a instalar:
" barra inferior
Plug 'nvim-lualine/lualine.nvim' " barra inferior
Plug 'nvim-tree/nvim-web-devicons' " dependencia barra inferior

" fzf, buscador de ficheros
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'

" nvim-treesitter, es un estructurador y coloreador de código, poner nuevo lenguaje si se usa otro no añadido en su .lua
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}

" autopairs, cerrado automatico de elementos como '' o ()
Plug 'windwp/nvim-autopairs'

" comment, comentarios rapidos en codigo
Plug 'terrortylor/nvim-comment'

" nvim-dap, compila o ejecuta programas sin necesidad de salirse, de momento
" solo python
Plug 'mfussenegger/nvim-dap' " interprete/compilador
Plug 'nvim-neotest/nvim-nio' " mejora interfaz
Plug 'rcarriga/nvim-dap-ui' " dependencia de los dos anteriores

" toggleterm, terminal flotante
Plug 'akinsho/nvim-toggleterm.lua' "abre una terminal independiente

"nvim-cpm, autocompletado
Plug 'neovim/nvim-lspconfig'               " autocompletado
Plug 'williamboman/mason.nvim'             " instalador LSP
Plug 'williamboman/mason-lspconfig.nvim'   " dependencia para hablar entre mason y lspconfig

Plug 'hrsh7th/nvim-cmp'                     " autocompletado principal
Plug 'hrsh7th/cmp-nvim-lsp'                 "fuente: LSP
Plug 'hrsh7th/cmp-buffer'                   " fuente: buffer
Plug 'hrsh7th/cmp-path'                     " fuente: sistema de archivos
Plug 'hrsh7th/cmp-cmdline'                  " fuente: línea de comandos
Plug 'L3MON4D3/LuaSnip'                     " motor de snippets
Plug 'saadparwaiz1/cmp_luasnip'             " luaSnip + nvim-cmp

"nvim-tree, arbol de directórios
Plug 'nvim-tree/nvim-tree.lua' "para directorios
Plug 'nvim-tree/nvim-web-devicons' " iconos

" git
Plug 'lewis6991/gitsigns.nvim' " ver los cambios git 

" identacion
Plug 'lukas-reineke/indent-blankline.nvim' " guía de indentación (|)

" colores, pudes cambiar el tema
Plug 'folke/tokyonight.nvim' "cambia tema
" donde se encuentra la configuracion en el path nvim
lua << EOF
local home = os.getenv("HOME")
package.path = package.path .. ";" .. home .. "/.config/nvim/lua/?.lua" .. ";" .. home .. "/.config/nvim/lua/?/init.lua"
EOF

call plug#end() " fin de plugins

" lugar de configuracion de plugins (todo lua)
lua require('plugins.lualine_conf')
lua require('plugins.fzf_conf')
lua require('plugins.nvim-treesitter_conf')
lua require('plugins.autopairs_conf')
lua require('plugins.comment_conf')
lua require('plugins.dap_conf')
lua require('plugins.toggleterm_conf')
lua require('plugins.cmp_conf')
lua require("plugins.tokyonight_conf")
lua require('plugins.tree_conf')
lua require("plugins.gitsigns_conf")
lua require("plugins.identline_conf")


" keymaps
"lua require('keymap.dap_keymap')
lua require('keymap.toggleterm_keymap')
lua require('keymap.copiar_keymap')
