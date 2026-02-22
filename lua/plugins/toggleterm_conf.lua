-- ========================================================================== --
--                          CONFIGURACIÓN DE TOGGLETERM                       --
--                (Terminales integradas persistentes y flotantes)            --
-- ========================================================================== --
require("toggleterm").setup({
  -- Definición dinámica del tamaño según la orientación
  size = function(term)
    if term.direction == "horizontal" then
      return 15 -- Altura para terminales inferiores
    elseif term.direction == "vertical" then
      return vim.o.columns * 0.45 -- 45% del ancho para terminales laterales
    end
  end,
  
  open_mapping = [[<c-\>]],     -- Atajo global para abrir/cerrar la terminal
  shade_filetypes = {},         -- Tipos de archivo que no se deben oscurecer
  shade_terminals = true,       -- Oscurece el fondo de la terminal para contraste
  shading_factor = 2,           -- Nivel de oscuridad del fondo
  start_in_insert = true,       -- Inicia siempre en modo insertar al abrir
  
  -- IMPORTANTE: Mantenemos en false para que el DAP pueda definir su propio ancho
  persist_size = false,         -- No recuerda el tamaño anterior (evita bloqueos)
  
  direction = "float",          -- Comportamiento por defecto: Ventana flotante central
  close_on_exit = false,        -- Mantiene la ventana abierta si el proceso termina
  shell = vim.o.shell,          -- Usa el shell configurado en el sistema
})
