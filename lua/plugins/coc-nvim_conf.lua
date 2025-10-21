vim.o.updatetime = 100
vim.o.pumheight = 20

vim.api.nvim_set_keymap('i', '<TAB>', [[pumvisible() ? coc#_select_confirm() : coc#expandableOrJumpable() ? "\<C-r>=coc#rpc#request('doKeymap', ['snippets-expand-jump',''])\<CR>" : v:lua.check_back_space() ? "\<TAB>" : coc#refresh()]], {expr = true, silent = true})

-- La función check_back_space también tendría que estar en Lua.

