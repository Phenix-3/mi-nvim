-- lua/plugins/barbar_conf.lua
require('barbar').setup({
  -- Habilita o deshabilita animaciones
  animation = true,

  -- Configura los iconos de los archivos (requiere nvim-web-devicons)
  icons = {
    filetype = { enabled = true },
    button = '×', -- El botón de cerrar
    modified = { button = '●' }, -- Icono cuando hay cambios sin guardar
    pinned = { button = '📌', filename = true },
  },

  -- Si quieres que las pestañas se ordenen por lenguaje, nombre, etc.
  auto_hide = false, -- Si es true, oculta la barra si solo hay 1 buffer
})
