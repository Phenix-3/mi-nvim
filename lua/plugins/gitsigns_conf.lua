-- ========================================================================== --
--                       INTEGRACIÓN DE GIT (GITSIGNS)                        --
-- ========================================================================== --
local gs = require('gitsigns')

-- Función interna para mapear atajos exclusivos de Git en cada buffer
local function map_gitsigns()
    local map = vim.keymap.set
    local opts = { noremap = true, silent = true }

    -- Navegación entre cambios (hunks)
    map('n', '<leader>gn', gs.next_hunk, opts)  -- Ir al siguiente cambio
    map('n', '<leader>gp', gs.prev_hunk, opts)  -- Ir al cambio anterior

    -- Gestión del cambio bajo el cursor
    map('n', '<leader>gs', gs.stage_hunk, opts) -- Añadir al index (stage)
    map('n', '<leader>gr', gs.reset_hunk, opts) -- Descartar cambio (reset)

    -- Información de autoría
    map('n', '<leader>gb', gs.blame_line, opts) -- Ver quién escribió esta línea
end

gs.setup({
    -- Iconos que aparecen en el margen izquierdo (signcolumn)
    signs = {
        add          = { text = '▎' },
        change       = { text = '▎' },
        delete       = { text = '契' },
        topdelete    = { text = '契' },
        changedelete = { text = '▎' },
    },
    signcolumn = true,
    
    -- Muestra información de 'git blame' automáticamente al final de la línea
    current_line_blame = true, 
    
    -- Ejecuta los atajos definidos arriba al abrir un archivo bajo Git
    on_attach = map_gitsigns, 
})
