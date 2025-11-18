require('nvim-autopairs').setup{
  check_ts = true,  -- usa treesitter para detectar contexto, bien
  enable_check_bracket_line = false, -- IMPORTANTE, si lo activas solo te cierra si no hay otros corchetes o comillas
  fast_wrap = {}, -- si seleccionas un texto se contendra, usando los atajos de teclado presstablecidos {}
}

