require("nvim-tree").setup({
    view = {
        -- anchura del arbol
        width = 30,
        -- arbol en el lado izquierdo
        side = "left",
        -- bordes redondeados
        --win_opts = {
	--border = 'rounded'
	--},
    },
    renderer = {
        -- nvim-web-devicons muestra iconos bonitos.
        icons = {
            -- iconos de directorio de git
            git_placement = "after",
        }
    },
    filesystem_watchers = {
        -- actualiza el árbol automáticamente cada poco tiempo
        enable = true,
    },
    update_focused_file = {
        enable = true, -- cada vez que se invoca mirar donde tengo la raiz nvim
        update_cwd = true, -- actualizar cada vez que invoco
    },
    actions = {
        open_file = {
            -- permite habrir archivos
            quit_on_open = false,
        },
    },
})

-- keymap abrir y cerrar
vim.api.nvim_set_keymap('n', '<F1>', ':NvimTreeToggle<CR>', { noremap = true, silent = true, desc = 'Toggle NvimTree' })
