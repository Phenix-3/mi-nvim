-- ========================================================================== --
--                         CONFIGURACIÓN DE BARBAR (TABS)                     --
-- ========================================================================== --
require('barbar').setup({
  -- Habilita animaciones al abrir/cerrar/mover pestañas
  animation = true,

  -- Configuración estética de los iconos en la barra superior
  icons = {
    filetype = { enabled = true },  -- Muestra icono según extensión (requiere devicons)
    button = '×',                   -- Símbolo para cerrar el buffer
    modified = { button = '●' },     -- Indicador de archivo con cambios pendientes
    pinned = { button = '📌', filename = true }, -- Indicador de pestaña fijada
  },

  -- No oculta la barra aunque solo haya un buffer abierto
  auto_hide = false,
})
