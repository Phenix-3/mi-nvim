-- ========================================================================== --
--                        CONFIGURACIÓN DE COMENTARIOS                        --
-- ========================================================================== --
require('nvim_comment').setup({
  -- Atajo para comentar la línea actual
  line_mapping = ",c",
  
  -- Atajo de operador (para usar con movimientos de Vim)
  operator_mapping = "gc",
  
  -- Evita insertar símbolos de comentario en líneas que están vacías
  comment_empty = false,
})
