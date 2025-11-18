-- dependencias
local gs = require('gitsigns')
-- funcion de atajos de buffer
local function map_gitsigns()
    local map = vim.keymap.set
    local opts = { noremap = true, silent = true }

    -- navegacion hunks 
    map('n', '<leader>gn', gs.next_hunk, opts)  -- siguiente 
    map('n', '<leader>gp', gs.prev_hunk, opts)  -- anterior

    -- hunk actual
    map('n', '<leader>gs', gs.stage_hunk, opts) -- Stage (añadir)
    map('n', '<leader>gr', gs.reset_hunk, opts) -- Reset (deshacer)

    -- muestra el blame
    map('n', '<leader>gb', gs.blame_line, opts)
end


-- setup
gs.setup({
    signs = {
        add          = { text = '▎' },
        change       = { text = '▎' },
        delete       = { text = '契' },
        topdelete    = { text = '契' },
        changedelete = { text = '▎' },
    },
    signcolumn = true,
    numhl = false,
    linehl = false,
    
    -- keymaps se pasan a la función on_attach.
    on_attach = map_gitsigns, 
    current_line_blame = true, 
})
