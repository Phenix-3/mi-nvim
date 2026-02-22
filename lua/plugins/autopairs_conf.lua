-- ========================================================================== --
--                       CONFIGURACIÓN DE NVIM-AUTOPAIRS                      --
-- ========================================================================== --
require('nvim-autopairs').setup({
  -- Usa Tree-sitter para comprobar el contexto (evita cerrar en comentarios o strings)
  check_ts = true,
  
  -- Si es false, permite cerrar paréntesis/comillas incluso si hay otros en la línea
  enable_check_bracket_line = false,
  
  -- Permite envolver texto seleccionado con atajos rápidos {}
  fast_wrap = {},
})
