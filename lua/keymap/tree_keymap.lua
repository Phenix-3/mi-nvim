vim.keymap.set('n', '<space>', function()
    local api = require("nvim-tree.api")
    local node = api.tree.get_node_under_cursor()

    if vim.bo.filetype == "NvimTree" then
        api.tree.change_root_to_node()
    else
        return "<space>"
    end
end, { desc = 'NvimTree: Cambiar raíz con Espacio', expr = false })
