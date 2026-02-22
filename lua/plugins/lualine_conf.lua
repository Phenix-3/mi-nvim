-- ========================================================================== --
--                    LUALINE: CONFIGURACIÓN SLANT FINAL                      --
-- ========================================================================== --

require("lualine").setup {
  options = {
    -- Sincroniza los colores de la barra con el tema duskfox
    theme = "duskfox",
    
    -- Separadores exteriores en ángulo (estilo Slant) para las secciones
    section_separators = { left = '', right = '' },
    
    -- Eliminamos separadores internos para evitar el caracter "/" no deseado
    component_separators = { left = '', right = '' }, 
    
    -- Lista negra: No muestra la barra en estos paneles para mantener la interfaz limpia
    disabled_filetypes = { 
      statusline = {
        'NvimTree',       -- Explorador de archivos
        'dbee-drawer',    -- Paneles laterales de DBee
        'dbee-result',    -- Panel de resultados SQL
        'dbee-call-log',  -- Panel de logs de base de datos
        'dbee-explorer',  -- Explorador de conexiones
        'help',		  -- Ventanas de ayuda de Vim
        'toggleterm'	  -- Ventanas de toggleterm (terminales temporales)
      },
      winbar = { 'toggleterm' },
    },
    
    -- Barra individual por ventana; permite que desaparezca en los paneles filtrados arriba
    globalstatus = false,
  },
  
  sections = {
    -- SECCIÓN A: Modo de edición (NORMAL, INSERT...) con el icono de Tux
    lualine_a = { 
      { 'mode', icon = '' } 
    },
    
    -- SECCIÓN B: Información del archivo y control de versiones
    lualine_b = { 
      -- Muestra ruta relativa (path = 1) e iconos de estado (modificado/lectura)
      { 'filename', file_status = true, path = 1 }, 
      'branch' -- Rama actual de Git
    },
    
    -- SECCIÓN C: Diagnósticos del servidor de lenguaje (LSP)
    lualine_c = { 
      { 'diagnostics', symbols = { error = ' ', warn = ' ' } } 
    },

    -- SECCIÓN X: Detalles técnicos del archivo
    lualine_x = {
      -- Codificación del buffer (ej: UTF-8) siempre en mayúsculas
      { 'encoding', fmt = string.upper, padding = { left = 1, right = 0 } },
      
      -- Separador visual fijo para dividir codificación y tipo de archivo
      { 
        function() return "│" end, 
        color = { fg = "#45475a" }, 
        padding = { left = 1, right = 1 } 
      },
      
      -- Tipo de archivo (ej: lua, python, sql) con su icono
      { 'filetype', padding = { left = 0, right = 1 } } 
    },
    
    -- SECCIÓN Y: Progreso de lectura del archivo
    lualine_y = { 
      { 'progress', padding = { left = 1, right = 1 } } -- Indica si estás en Top, Bot o el %
    },
    
    -- SECCIÓN Z: Coordenadas exactas del cursor
    lualine_z = { 
      { 'location', padding = { left = 1, right = 1 } } -- Formato Línea:Columna
    }
  }
}
