require('ibl').setup {
    indent = {
	char = '┊', -- carácter usado para la guía
    },
    scope = { -- supuestamente detecta treesitter
        enabled = true,
        show_start = true,
        show_end = true,
	highlight = "IblScope",
	vim.api.nvim_set_hl(0, "IblScope", { fg = "#607C9A", nocombine = true }) -- color linea
    },
    -- no se dibujaran lineas en:
    exclude = {
	    filetypes = {'terminal', 'help', 'lspinfo', 'TelescopePrompt', 'packer', 'NvimTree'}
    },
}

