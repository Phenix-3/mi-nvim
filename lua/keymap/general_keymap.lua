local opts = { noremap = true, silent = true }
vim.keymap.set('n', '<leader>t', ':terminal<CR>', opts) -- 'n' = Modo Normal, 't' = Modo Terminal
vim.keymap.set('t', '<Esc>', [[<C-\><C-n>]], opts)
vim.keymap.set('t', '<leader>tc', [[<C-\><C-n>:q<CR>]], opts) -- Extra: Atajo para cerrar la terminal rápidamente si estás en modo terminal
