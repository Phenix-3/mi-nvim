-- ========================================================================== --
--                     GUÍAS VISUALES DE INDENTACIÓN (IBL)                    --
-- ========================================================================== --
require('ibl').setup {
    indent = {
        char = '┊', -- Carácter discreto para las líneas verticales
    },
    scope = { 
        -- Resalta el bloque de código donde se encuentra el cursor (vía Treesitter)
        enabled = true,
        show_start = true,
        show_end = true,
        highlight = "IblScope",
        -- Definición del color personalizado para el ámbito activo
        vim.api.nvim_set_hl(0, "IblScope", { fg = "#607C9A", nocombine = true }) 
    },
    -- Deshabilita las líneas en ventanas donde no tienen sentido
    exclude = {
        filetypes = {'terminal', 'help', 'lspinfo', 'TelescopePrompt', 'packer', 'NvimTree'}
    },
}
