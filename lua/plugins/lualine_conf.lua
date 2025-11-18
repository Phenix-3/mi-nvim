require("lualine").setup {
  options = {
    theme = "codedark", -- tema de colores de letras
  },
  sections = {
    lualine_a = { "mode" }, -- modo actual (IMPORTANTE)
    lualine_b = { "filename" }, -- nombre de fichero
    lualine_c = {
      function()
        return vim.g.coc_status or "" -- espacio para posibles errores
      end
    },
    lualine_x = { "branch" }, -- clase o branch de git
    lualine_y = { "encoding" }, -- codificacion de caracteres (ascii, utf-8, ...)
    lualine_z = { "location" } -- ubicacion del cursor (linea:caracter)
  }
}

