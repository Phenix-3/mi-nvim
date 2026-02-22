-- ========================================================================== --
--                          CONFIGURACIÓN DEL TEMA                            --
-- ========================================================================== --
require('nightfox').setup({
  options = {
    compile_path = vim.fn.stdpath("cache") .. "/nightfox",
    compile_file_suffix = "_compiled",
    transparent = false,     -- Fondo sólido
    terminal_colors = false, 
    dim_inactive = false,    -- No oscurecer ventanas sin foco
    module_default = true,   -- Activar soporte para la mayoría de plugins
    
    styles = {               -- Personalización de estilos de sintaxis
      comments = "italic",   -- Comentarios en cursiva
      keywords = "bold",     -- Palabras clave (if, return...) en negrita
      -- Resto de elementos en estilo normal (NONE)
      conditionals = "NONE", constants = "NONE", functions = "NONE",
      numbers = "NONE", operators = "NONE", strings = "NONE",
      types = "NONE", variables = "NONE",
    },
    
    modules = {              -- Soporte específico para resaltado de plugins
      ["nvim-cmp"] = true,
      ["nvim-tree"] = true,
      ["treesitter"] = true,
    },
  },
})

-- Aplicar la variante específica 'duskfox'
vim.cmd("colorscheme duskfox")
