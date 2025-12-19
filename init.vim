" tecla leader
let mapleader = ","

" ruta de plugins (compilados)
call plug#begin('~/.local/share/nvim/plugged')

Plug 'nvim-lualine/lualine.nvim' " barra inferior
Plug 'nvim-tree/nvim-web-devicons' " iconos del arbol de directorios derecho
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'} " autocompletado, me cae mal
Plug 'windwp/nvim-autopairs' " emparejamiento de todo lo cerrable
Plug 'terrortylor/nvim-comment' " comentarios automaticos
Plug 'mfussenegger/nvim-dap' " ejecucion loopback
Plug 'nvim-neotest/nvim-nio' " librerias extra
Plug 'rcarriga/nvim-dap-ui' " parecido al otro dap
Plug 'akinsho/nvim-toggleterm.lua' " terminal flotante
Plug 'neovim/nvim-lspconfig' " recomendaciones de autocompletado
Plug 'williamboman/mason.nvim' " gestor de servidores lsp
Plug 'williamboman/mason-lspconfig.nvim' " config de mason
Plug 'hrsh7th/nvim-cmp' " motor autocompletado
Plug 'hrsh7th/cmp-nvim-lsp' " lsp para cmp
Plug 'hrsh7th/cmp-buffer' " buffer para cmp
Plug 'hrsh7th/cmp-path' " añadir cmp al path de nvim
Plug 'hrsh7th/cmp-cmdline' " añadir tabulaciones a cmp
Plug 'L3MON4D3/LuaSnip' " descripcion automatica de funciones
Plug 'saadparwaiz1/cmp_luasnip' " descripcion de funciones para cmp
Plug 'nvim-tree/nvim-tree.lua' " arbol de directorios derecho
Plug 'lewis6991/gitsigns.nvim' " plugin para git
Plug 'lukas-reineke/indent-blankline.nvim' " ayuda de identacion
Plug 'nvim-lua/plenary.nvim' " dependencia telescope
Plug 'nvim-telescope/telescope.nvim', { 'tag': 'v0.2.0' } " busqueda de ficheros
Plug 'nvim-telescope/telescope-fzf-native.nvim', { 'do': 'make' } " dependencia de telescope
Plug 'stevearc/oil.nvim' " conexion a maquina externa
Plug 'romgrk/barbar.nvim' " pestañas superiores
Plug 'EdenEast/nightfox.nvim' " tema actual

" Fin Plugins 
call plug#end() 

" ruta Treesitter antes de los require
let &runtimepath.=',~/.local/share/nvim/plugged/nvim-treesitter'

" Opciones de Interfaz (VimScript)
set termguicolors
set showtabline=2
filetype plugin indent on
syntax on

" 4. Lua para funciones de ayuda
lua << EOF
-- carga módulos de forma segura
function safe_require(module)
    local success, res = pcall(require, module)
    if not success then
        -- si falla intenta recargarse
        vim.cmd('packloadall')
        success, res = pcall(require, module)
    end
    if not success then
	-- ya la hemos liado
        print("Error cargando: " .. module)
    end
    return success
end

-- configuraciones:
-- Primero Treesitter y Tema IMPORTANTE MANTENERLO DE ESTA MANERA
safe_require('plugins.nvim-treesitter_conf')
safe_require('plugins.nightfox_conf')

-- Resto de plugins
safe_require('plugins.lualine_conf')
safe_require('plugins.autopairs_conf')
safe_require('plugins.comment_conf')
safe_require('plugins.dap_conf')
safe_require('plugins.toggleterm_conf')
safe_require('plugins.cmp_conf')
safe_require('plugins.tree_conf')
safe_require('plugins.gitsigns_conf')
safe_require('plugins.identline_conf')
safe_require('plugins.telescope_conf')
safe_require('plugins.barbar_conf')
safe_require('plugins.oil_conf')

-- Keymaps
safe_require('keymap.toggleterm_keymap')
safe_require('keymap.copiar_keymap')
safe_require('keymap.telescope_keymap')
safe_require('keymap.general_keymap')
safe_require('keymap.barbar_keymap')
