vim.o.updatetime = 100 -- tiempo antes de comprobacion (para que no se quede tostado)
vim.o.pumheight = 20 -- maximo de altura de ventana emergente
-- keymap 
vim.api.nvim_set_keymap('i', '<TAB>', [[pumvisible() ? coc#_select_confirm() : coc#expandableOrJumpable() ? "\<C-r>=coc#rpc#request('doKeymap', ['snippets-expand-jump',''])\<CR>" : v:lua.check_back_space() ? "\<TAB>" : coc#refresh()]], {expr = true, silent = true})
