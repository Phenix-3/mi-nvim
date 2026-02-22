-- ========================================================================== --
--                         CONFIGURACIÓN DE TELESCOPE                         --
--                 (Buscador de archivos, texto y comandos)                   --
-- ========================================================================== --
require('telescope').setup{
  defaults = {
    -- Iconos y prefijos de la interfaz
    prompt_prefix = "🔍 ",    -- Icono en la barra de búsqueda
    selection_caret = "➜ ",  -- Icono que indica el elemento seleccionado
    
    -- Configuración visual de la ventana de búsqueda
    layout_strategy = "horizontal", -- El buscador se expande horizontalmente
  }
}
