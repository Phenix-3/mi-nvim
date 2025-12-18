-- ~/.config/nvim/lua/keymaps.lua
local map = vim.keymap.set
local opts = { noremap = true, silent = true }

-----------------------------------------------------------
-- BARBAR (Gestión de Pestañas/Buffers)
-----------------------------------------------------------

-- Moverse entre pestañas (Alt + , y Alt + .)
map('n', '<A-,>', '<Cmd>BufferPrevious<CR>', opts)
map('n', '<A-.>', '<Cmd>BufferNext<CR>', opts)

-- Reordenar pestañas (Mover la pestaña a izq o der)
map('n', '<A-<>', '<Cmd>BufferMovePrevious<CR>', opts)
map('n', '<A->>', '<Cmd>BufferMoveNext<CR>', opts)

-- Ir a una pestaña específica (Alt + número)
map('n', '<A-1>', '<Cmd>BufferGoto 1<CR>', opts)
map('n', '<A-2>', '<Cmd>BufferGoto 2<CR>', opts)
map('n', '<A-3>', '<Cmd>BufferGoto 3<CR>', opts)
map('n', '<A-4>', '<Cmd>BufferGoto 4<CR>', opts)
map('n', '<A-5>', '<Cmd>BufferGoto 5<CR>', opts)

-- Cerrar pestaña actual (Alt + c)
map('n', '<A-c>', '<Cmd>BufferClose<CR>', opts)
