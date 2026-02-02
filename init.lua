-- 1. Tecla Leader
vim.g.mapleader = ","

-- 2. Instalación automática de Lazy.nvim (Bootstrap)
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git", "clone", "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git", "--branch=stable",
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

-- 3. Configuración de Plugins (Equivalente a tu PlugBegin/End)
require("lazy").setup({
  -- UI y Temas
  { 'EdenEast/nightfox.nvim', priority = 1000 }, -- priority para que cargue primero
  'nvim-lualine/lualine.nvim',
  'nvim-tree/nvim-web-devicons',
  'romgrk/barbar.nvim',
  'lukas-reineke/indent-blankline.nvim',

  -- Treesitter
  { 'nvim-treesitter/nvim-treesitter', build = ':TSUpdate' },

  -- Funcionalidad
  'windwp/nvim-autopairs',
  'terrortylor/nvim-comment',
  'akinsho/nvim-toggleterm.lua',
  'lewis6991/gitsigns.nvim',
  'nvim-lua/plenary.nvim',
  'stevearc/oil.nvim',
  'lambdalisue/suda.vim',
  'miversen33/netman.nvim',

  -- Telescope
  { 'nvim-telescope/telescope.nvim', tag = '0.1.5' },
  { 'nvim-telescope/telescope-fzf-native.nvim', build = 'make' },

  -- LSP y Autocompletado
  'neovim/nvim-lspconfig',
  'williamboman/mason.nvim',
  'williamboman/mason-lspconfig.nvim',
  'hrsh7th/nvim-cmp',
  'hrsh7th/cmp-nvim-lsp',
  'hrsh7th/cmp-buffer',
  'hrsh7th/cmp-path',
  'hrsh7th/cmp-cmdline',
  'L3MON4D3/LuaSnip',
  'saadparwaiz1/cmp_luasnip',

  -- Debugger y Test
  'mfussenegger/nvim-dap',
  'nvim-neotest/nvim-nio',
  'rcarriga/nvim-dap-ui',
  
  -- File Explorer
  'nvim-tree/nvim-tree.lua',
})

-- 4. Opciones de Interfaz (VimScript a Lua)
vim.opt.termguicolors = true
vim.opt.showtabline = 2
vim.cmd('filetype plugin indent on')
vim.cmd('syntax on')
vim.opt.splitbelow = true
vim.opt.splitright = true

-- 5. Navegación estilo "Videojuego" (WASD)
vim.keymap.set('n', '<C-w>', '<C-w>k', { desc = 'Mover Arriba' })
vim.keymap.set('n', '<C-a>', '<C-w>h', { desc = 'Mover Izquierda' })
vim.keymap.set('n', '<C-s>', '<C-w>j', { desc = 'Mover Abajo' })
vim.keymap.set('n', '<C-d>', '<C-w>l', { desc = 'Mover Derecha' })
vim.keymap.set('n', '<C-q>', '<C-w>', { desc = 'Prefijo de ventana' })

-- Redimensionar con Alt + WASD
vim.keymap.set('n', '<A-w>', ':resize -2<CR>', { silent = true })
vim.keymap.set('n', '<A-s>', ':resize +2<CR>', { silent = true })
vim.keymap.set('n', '<A-a>', ':vertical resize -2<CR>', { silent = true })
vim.keymap.set('n', '<A-d>', ':vertical resize +2<CR>', { silent = true })

-- 6. Carga de tus configuraciones externas (Tus archivos actuales)
-- Ya no necesitas la función safe_require porque Lazy gestiona errores mejor, 
-- pero puedes seguir usándola si prefieres. Aquí la forma estándar:

local function load_config(mod)
    local status_ok, _ = pcall(require, mod)
    if not status_ok then
        print("Error cargando: " .. mod)
    end
end

-- Cargar tus archivos de configuración
load_config('plugins.nvim-treesitter_conf')
load_config('plugins.nightfox_conf')
load_config('plugins.lualine_conf')
load_config('plugins.autopairs_conf')
load_config('plugins.comment_conf')
load_config('plugins.dap_conf')
load_config('plugins.toggleterm_conf')
load_config('plugins.cmp_conf')
load_config('plugins.tree_conf')
load_config('plugins.gitsigns_conf')
load_config('plugins.identline_conf')
load_config('plugins.telescope_conf')
load_config('plugins.barbar_conf')
load_config('plugins.oil_conf')

-- Keymaps externos
load_config('keymap.toggleterm_keymap')
load_config('keymap.copiar_keymap')
load_config('keymap.telescope_keymap')
load_config('keymap.general_keymap')
load_config('keymap.barbar_keymap')
load_config('keymap.tree_keymap')
