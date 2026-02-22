-- ========================================================================== --
--                           CONFIGURACIÓN DE NVIM-TREE                       --
--                      (Explorador de archivos lateral)                      --
-- ========================================================================== --
require("nvim-tree").setup({
    sync_root_with_cwd = true, -- Sincroniza el árbol si cambias de directorio en la terminal
    
    view = {
        width = 30,            -- Ancho fijo del panel izquierdo
        side = "left",         -- Posición en el lado izquierdo
    },
    
    renderer = {
        icons = {
            git_placement = "after", -- Iconos de estado de Git después del nombre
        }
    },
    
    filesystem_watchers = {
        enable = true,         -- Actualiza el árbol automáticamente al detectar cambios
    },
    
    update_focused_file = {
        enable = true,         -- Enfoca el archivo actual en el árbol al abrirlo
        update_root = true,    -- Cambia la raíz del árbol al proyecto actual
    },
    
    actions = {
        open_file = {
            quit_on_open = false, -- Mantiene el árbol abierto tras abrir un archivo
        },
        change_dir = {
            enable = true,        -- Permite cambiar el directorio de trabajo desde el árbol
            global = true,
        },
    },
})

-- Atajo de teclado: F1 para mostrar/ocultar el explorador
vim.api.nvim_set_keymap('n', '<F1>', ':NvimTreeToggle<CR>', { noremap = true, silent = true, desc = 'Toggle NvimTree' })
