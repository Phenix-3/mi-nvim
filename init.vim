" leader tecla
let mapleader = ","

" Directorio de plugins
call plug#begin('~/.local/share/nvim/plugged')

" Aquí irán los plugins a instalar
" barra inferior
Plug 'nvim-lualine/lualine.nvim' " barra inferior
Plug 'nvim-tree/nvim-web-devicons' " dependencia barra inferior

" fzf, buscador de ficheros
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'

" nvim-treesitter, es un estructurador y coloreador de código, poner nuevo
" lenguaje si se usa otro no añadido en su .lua
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}

" autopairs, cerrado automatico de elementos como '' o ()
Plug 'windwp/nvim-autopairs'

" comment, comentarios rapidos en codigo
Plug 'terrortylor/nvim-comment'

" nvim-dap, compila programas sin necesidad de salirse
Plug 'mfussenegger/nvim-dap'
Plug 'nvim-neotest/nvim-nio' " mejora interfaz
Plug 'rcarriga/nvim-dap-ui' " dependencia de los dos anteriores

" toggleterm, terminal flotante
Plug 'akinsho/nvim-toggleterm.lua'

"nvim-cpm, autocompletado
" Autocompletado moderno con LSP
Plug 'neovim/nvim-lspconfig'               " Configuración de LSP
Plug 'williamboman/mason.nvim'             " Instalador de LSPs
Plug 'williamboman/mason-lspconfig.nvim'   " Bridge entre Mason y lspconfig

Plug 'hrsh7th/nvim-cmp'                     " Autocompletado principal
Plug 'hrsh7th/cmp-nvim-lsp'                 " Fuente: LSP
Plug 'hrsh7th/cmp-buffer'                   " Fuente: buffer
Plug 'hrsh7th/cmp-path'                     " Fuente: sistema de archivos
Plug 'hrsh7th/cmp-cmdline'                  " Fuente: línea de comandos
Plug 'L3MON4D3/LuaSnip'                     " Motor de snippets
Plug 'saadparwaiz1/cmp_luasnip'             " Integración LuaSnip + nvim-cmp

" colores
Plug 'folke/tokyonight.nvim'

lua << EOF
local home = os.getenv("HOME")
package.path = package.path .. ";" .. home .. "/.config/nvim/lua/?.lua" .. ";" .. home .. "/.config/nvim/lua/?/init.lua"
EOF

call plug#end()

" Luego de esta línea puedes agregar tus configuraciones y mappings
lua require('plugins.lualine_conf')
lua require('plugins.fzf_conf')
lua require('plugins.nvim-treesitter_conf')
lua require('plugins.autopairs_conf')
lua require('plugins.comment_conf')
lua require('plugins.dap_conf')
lua require('plugins.toggleterm_conf')
lua require('plugins.cmp_conf')
lua require("plugins.tokyonight_conf")

" keymaps
"lua require('keymap.dap_keymap')
lua require('keymap.toggleterm_keymap')
lua require('keymap.copiar_keymap')
