-- ========================================================================== --
--                               LEADER KEY                                   --
-- ========================================================================== --
-- La tecla 'Leader' es el prefijo para la mayoría de tus atajos personalizados.
-- IMPORTANTE se define antes de Lazy para que los plugins lo reconozcan.
vim.g.mapleader = ","

vim.opt.swapfile = false  -- Desactiva el swap para evitar los avisos de tu imagen
vim.opt.undofile = true   -- Mantiene el historial de "deshacer" incluso después de cerrar Neovim

vim.opt.clipboard = "unnamedplus" -- Sincroniza el portapapeles de Neovim con el del sistema

vim.o.timeoutlen = 200 	  -- Reduce a 0,2 milisegundos el tiempo de comando

vim.opt.conceallevel = 2   -- Permite a Obsidian y Render-Markdown ocultar caracteres feos


-- ========================================================================== --
--                           GESTIÓN DE PAQUETES                              --
-- ========================================================================== --
-- Bootstrap de Lazy.nvim: descarga automáticamente el gestor si no está instalado.
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git", "clone", "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git", "--branch=stable",
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

-- ========================================================================== --
--                               FUNCIONES                                    --
-- ========================================================================== --
-- Compila el md a html con el mismo estilo
--require("funciones.compilador_md").setup()



-- ========================================================================== --
--                          CONFIGURACIÓN DE PLUGINS                          --
-- ========================================================================== --
-- Aquí se encuentran listados todos los plugin instalados, organizados por las funciones que cumplen.
require("lazy").setup({
  -- [ INTERFAZ Y ESTÉTICA ] ---------------------------------------------------
  { 'EdenEast/nightfox.nvim', priority = 1000 }, -- Tema principal, priority para que cargue primero
  'nvim-lualine/lualine.nvim',			 -- Barra de estado inferior
  'nvim-tree/nvim-web-devicons',                 -- Iconos para archivos
  'romgrk/barbar.nvim',                          -- Barra de pestañas (Tabs/Buffers)
  'lukas-reineke/indent-blankline.nvim',         -- Guías visuales de indentación

  -- [ SINTAXIS Y PARSING ] ----------------------------------------------------
  { 'nvim-treesitter/nvim-treesitter', build = ':TSUpdate' }, -- Resaltado inteligente

  -- [ UTILIDADES Y FUNCIONALIDAD ] --------------------------------------------
  'windwp/nvim-autopairs',           -- Cierra paréntesis/comillas automáticamente
  'terrortylor/nvim-comment',        -- Atajos para comentar líneas (gcc)
  'akinsho/nvim-toggleterm.lua',     -- Terminal integrada persistente
  'lewis6991/gitsigns.nvim',         -- Indicadores de cambios de Git en el margen
  'nvim-lua/plenary.nvim',           -- Librería de funciones para muchos plugins
  'stevearc/oil.nvim',               -- Editar el sistema de archivos como un buffer
  'lambdalisue/suda.vim',            -- Guardar con privilegios de sudo (:SudaWrite)
  'miversen33/netman.nvim',          -- Gestor de conexiones remotas/red
  require('plugins.ufo_conf'),       -- Configuración de plegado de código (Folds)

  -- [ BÚSQUEDA Y NAVEGACIÓN ] -------------------------------------------------
  { 'nvim-telescope/telescope.nvim', tag = '0.1.5' }, -- Buscador difuso (Fuzzy Finder)
  { 'nvim-telescope/telescope-fzf-native.nvim', build = 'make' }, -- Mejora velocidad de búsqueda

  -- [ LSP: LENGUAJE Y AUTOCOMPLETADO ] ----------------------------------------
  'neovim/nvim-lspconfig',           -- Configuración base del servidor de lenguaje
  'williamboman/mason.nvim',         -- Instalador de LSPs, Linters y Formatters
  'williamboman/mason-lspconfig.nvim',-- Puente entre Mason y lspconfig
  'hrsh7th/nvim-cmp',                -- Motor de autocompletado
  'hrsh7th/cmp-nvim-lsp',            -- Fuente: LSP para nvim-cmp
  'hrsh7th/cmp-buffer',              -- Fuente: Palabras del archivo actual
  'hrsh7th/cmp-path',                -- Fuente: Rutas de archivos del sistema
  'hrsh7th/cmp-cmdline',             -- Fuente: Línea de comandos de nvim
  'L3MON4D3/LuaSnip',                -- Motor de snippets
  'saadparwaiz1/cmp_luasnip',        -- Fuente: Snippets para nvim-cmp

  -- [ DEBUGGING Y TESTING ] ---------------------------------------------------
  'mfussenegger/nvim-dap',           -- Protocolo de depuración (Debug Adapter Protocol)
  'nvim-neotest/nvim-nio',           -- Dependencia asíncrona para UI de debug
  'rcarriga/nvim-dap-ui',            -- Interfaz gráfica para el debugger
  
  -- [ EXPLORACIÓN DE ARCHIVOS ] -----------------------------------------------
  'nvim-tree/nvim-tree.lua',	     -- Explorador de archivos lateral

  -- [ APUNTES EN MARKDOWN ] -----------------------------------------------
  require('plugins.obsidian_conf'),
  'iamcco/markdown-preview.nvim',

  -- [ BASES DE DATOS ] --------------------------------------------------------
  require("plugins.dbee_conf")	     -- Cliente de base de datos integrado
})

-- ========================================================================== --
--                           OPCIONES DE INTERFAZ                             --
-- ========================================================================== --
vim.opt.termguicolors = true    -- Soporte para colores de 24 bits (TrueColor)
vim.opt.showtabline = 2         -- Mostrar siempre la barra de pestañas superior
vim.opt.splitbelow = true       -- Los nuevos splits horizontales se abren debajo
vim.opt.splitright = true       -- Los nuevos splits verticales se abren a la derecha

vim.cmd('filetype plugin indent on') -- Detecta tipo de archivo y carga indentación
vim.cmd('syntax on')                 -- Habilita el resaltado de sintaxis base

-- ========================================================================== --
--                       KEYMAPS: NAVEGACIÓN Y VENTANAS                       --
-- ========================================================================== --

-- Navegación estilo (WASD) para saltar entre ventanas divididas
vim.keymap.set('n', '<C-w>', '<C-w>k', { desc = 'Ventana: Ir arriba' })
vim.keymap.set('n', '<C-a>', '<C-w>h', { desc = 'Ventana: Ir izquierda' })
vim.keymap.set('n', '<C-s>', '<C-w>j', { desc = 'Ventana: Ir abajo' })
vim.keymap.set('n', '<C-d>', '<C-w>l', { desc = 'Ventana: Ir derecha' })

-- Redimensionar ventanas de forma rápida con Alt + WASD
vim.keymap.set('n', '<A-w>', ':resize -2<CR>', { silent = true, desc = 'Ventana: Reducir altura' })
vim.keymap.set('n', '<A-s>', ':resize +2<CR>', { silent = true, desc = 'Ventana: Aumentar altura' })
vim.keymap.set('n', '<A-a>', ':vertical resize -2<CR>', { silent = true, desc = 'Ventana: Reducir ancho' })
vim.keymap.set('n', '<A-d>', ':vertical resize +2<CR>', { silent = true, desc = 'Ventana: Aumentar ancho' })

-- Atajo para prefijo de ventana (útil para comandos <C-w> nativos)
vim.keymap.set('n', '<C-q>', '<C-w>', { desc = 'Prefijo de gestión de ventanas' })

-- ========================================================================== --
--                        CARGA DE MÓDULOS EXTERNOS                           --
-- ========================================================================== --
-- Función auxiliar para cargar archivos en lua/ de forma segura (evita cierres por error)
local function load_config(mod)
    local status_ok, _ = pcall(require, mod)
    if not status_ok then
        print("Error cargando el módulo: " .. mod)
    end
end

-- [ Carga de Configuraciones de Plugins ]
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
load_config('plugins.markdown_conf')

-- [ Carga de Keymaps Específicos ]
load_config('keymap.toggleterm_keymap')
load_config('keymap.copiar_keymap')
load_config('keymap.telescope_keymap')
load_config('keymap.general_keymap')
load_config('keymap.barbar_keymap')
load_config('keymap.tree_keymap')
load_config('keymap.dbee_keymap')

