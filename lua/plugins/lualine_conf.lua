---------- ========================================================================== --
----------                    LUALINE: CONFIGURACIÓN SLANT FINAL                      --
---------- ========================================================================== --
--------
--------require("lualine").setup {
--------  options = {
--------    -- Sincroniza los colores de la barra con el tema duskfox
--------    theme = "duskfox",
--------    
--------    -- Separadores exteriores en ángulo (estilo Slant) para las secciones
--------    section_separators = { left = '', right = '' },
--------    
--------    -- Eliminamos separadores internos para evitar el caracter "/" no deseado
--------    component_separators = { left = '', right = '' }, 
--------    
--------    -- Lista negra: No muestra la barra en estos paneles para mantener la interfaz limpia
--------    disabled_filetypes = { 
--------      statusline = {
--------        'NvimTree',       -- Explorador de archivos
--------        'dbee-drawer',    -- Paneles laterales de DBee
--------        'dbee-result',    -- Panel de resultados SQL
--------        'dbee-call-log',  -- Panel de logs de base de datos
--------        'dbee-explorer',  -- Explorador de conexiones
--------        'help',		  -- Ventanas de ayuda de Vim
--------        'toggleterm'	  -- Ventanas de toggleterm (terminales temporales)
--------      },
--------      winbar = { 'toggleterm' },
--------    },
--------    
--------    -- Barra individual por ventana; permite que desaparezca en los paneles filtrados arriba
--------    globalstatus = false,
--------  },
--------  
--------  sections = {
--------    -- SECCIÓN A: Modo de edición (NORMAL, INSERT...) con el icono de Tux
--------    lualine_a = { 
--------      { 'mode', icon = '' } 
--------    },
--------    
--------    -- SECCIÓN B: Información del archivo y control de versiones
--------    --lualine_b = { 
--------    --  -- Muestra ruta relativa (path = 1) e iconos de estado (modificado/lectura)
--------    --  { 'filename', file_status = true, path = 1 }, 
--------    --  'branch' -- Rama actual de Git
--------    --},
--------    
--------    -- SECCIÓN C: Diagnósticos del servidor de lenguaje (LSP)
--------    lualine_c = { 
--------      { 'diagnostics', symbols = { error = ' ', warn = ' ' } } 
--------    },
--------    lualine_d = {
--------      {
--------        function()
--------          -- Si el buffer es de tipo terminal, devolvemos un nombre limpio
--------          if vim.bo.buftype == 'terminal' then
--------            return "  Terminal"
--------          end
--------          -- Si no es terminal, devolvemos el nombre del archivo normal
--------          return vim.fn.expand('%:t') 
--------        end,
--------        color = { fg = '#00ff00', gui = 'bold' } -- Opcional: color para diferenciarlo
--------      }
--------    },
--------    -- SECCIÓN X: Detalles técnicos del archivo
--------    lualine_x = {
--------      -- Codificación del buffer (ej: UTF-8) siempre en mayúsculas
--------      { 'encoding', fmt = string.upper, padding = { left = 1, right = 0 } },
--------      
--------      -- Separador visual fijo para dividir codificación y tipo de archivo
--------      { 
--------        function() return "│" end, 
--------        color = { fg = "#45475a" }, 
--------        padding = { left = 1, right = 1 } 
--------      },
--------      
--------      -- Tipo de archivo (ej: lua, python, sql) con su icono
--------      { 'filetype', padding = { left = 0, right = 1 } } 
--------    },
--------    
--------    -- SECCIÓN Y: Progreso de lectura del archivo
--------    lualine_y = { 
--------      { 'progress', padding = { left = 1, right = 1 } } -- Indica si estás en Top, Bot o el %
--------    },
--------    
--------    -- SECCIÓN Z: Coordenadas exactas del cursor
--------    lualine_z = { 
--------      { 'location', padding = { left = 1, right = 1 } } -- Formato Línea:Columna
--------    }
--------  }
--------}
------require("lualine").setup {
------  options = {
------    theme = "duskfox",
------    section_separators = { left = '', right = '' },
------    component_separators = { left = '', right = '' }, 
------    disabled_filetypes = { 
------      statusline = {
------        'NvimTree', 'dbee-drawer', 'dbee-result', 
------        'dbee-call-log', 'dbee-explorer', 'help', 'toggleterm' 
------      },
------      winbar = { 'toggleterm' },
------    },
------    globalstatus = false,
------  },
------  
------  sections = {
------    lualine_a = { { 'mode', icon = '' } },
------    
------    -- SECCIÓN B: Aquí es donde estaba el problema
------    lualine_b = { 
------      {
------        function()
------          -- Si es terminal, nombre limpio
------          if vim.bo.buftype == 'terminal' then
------            return "  Terminal"
------          end
------          -- Si es archivo normal, mostramos la ruta relativa (como tenías antes)
------          -- El '1' es para path = 1 (ruta relativa)
------          return vim.fn.expand('%:f') 
------        end,
------        -- Añadimos iconos de estado (modificado/lectura) manualmente si quieres
------        fmt = function(str)
------            if vim.bo.modified then return str .. " ●" end
------            if vim.bo.readonly then return str .. " " end
------            return str
------        end
------      },
------      'branch' 
------    },
------    
------    lualine_c = { 
------      { 'diagnostics', symbols = { error = ' ', warn = ' ' } } 
------    },
------    
------    -- Eliminamos lualine_d porque no es una sección válida de lualine
------    
------    lualine_x = {
------      { 'encoding', fmt = string.upper, padding = { left = 1, right = 0 } },
------      { 
------        function() return "│" end, 
------        color = { fg = "#45475a" }, 
------        padding = { left = 1, right = 1 } 
------      },
------      { 'filetype', padding = { left = 0, right = 1 } } 
------    },
------    
------    lualine_y = { { 'progress', padding = { left = 1, right = 1 } } },
------    lualine_z = { { 'location', padding = { left = 1, right = 1 } } }
------  }
------}
------ Función auxiliar para saber si NO estamos en una terminal
----local function not_in_term()
----  return vim.bo.buftype ~= 'terminal'
----end
----
----require("lualine").setup {
----  options = {
----    theme = "duskfox",
----    section_separators = { left = '', right = '' },
----    component_separators = { left = '', right = '' }, 
----    disabled_filetypes = { 
----      statusline = {
----        'NvimTree', 'dbee-drawer', 'dbee-result', 
----        'dbee-call-log', 'dbee-explorer', 'help', 'toggleterm' 
----      },
----      winbar = { 'toggleterm' },
----    },
----    globalstatus = false,
----  },
----  
----  sections = {
----    lualine_a = { { 'mode', icon = '' } },
----    
----    lualine_b = { 
----      {
----        function()
----          if vim.bo.buftype == 'terminal' then
----            return "  Terminal"
----          end
----          return vim.fn.expand('%:f') 
----        end,
----      },
----      -- El branch de Git ahora solo aparece si NO es terminal
----      { 'branch', cond = not_in_term } 
----    },
----    
----    lualine_c = { 
----      { 'diagnostics', symbols = { error = ' ', warn = ' ' }, cond = not_in_term } 
----    },
----    
----    lualine_x = {
----      { 'encoding', fmt = string.upper, padding = { left = 1, right = 0 }, cond = not_in_term },
----      -- El separador "|" ahora solo aparece si NO es terminal
----      { 
----        function() return "│" end, 
----        color = { fg = "#45475a" }, 
----        padding = { left = 1, right = 1 },
----        cond = not_in_term 
----      },
----      { 'filetype', padding = { left = 0, right = 1 }, cond = not_in_term } 
----    },
----    
----    -- El progreso (Top/Bot/%) ahora solo aparece si NO es terminal
----    lualine_y = { { 'progress', padding = { left = 1, right = 1 }, cond = not_in_term } },
----    
----    -- La ubicación (Línea:Col) también se oculta en terminal para máxima limpieza
----    lualine_z = { { 'location', padding = { left = 1, right = 1 }, cond = not_in_term } }
----  }
----}
---- ========================================================================== --
----                LUALINE: CONFIGURACIÓN SLANT (VERSIÓN LIMPIA)               --
---- ========================================================================== --
--
---- Función auxiliar para detectar si NO estamos en una terminal
---- Esto permite ocultar componentes innecesarios cuando abres el shell
--local function not_in_term()
--  return vim.bo.buftype ~= 'terminal'
--end
--
--require("lualine").setup {
--  options = {
--    theme = "duskfox",
--    -- Separadores en ángulo estilo Slant
--    section_separators = { left = '', right = '' },
--    -- Quitamos separadores internos para evitar caracteres extraños
--    component_separators = { left = '', right = '' }, 
--    
--    disabled_filetypes = { 
--      statusline = {
--        'NvimTree', 'dbee-drawer', 'dbee-result', 
--        'dbee-call-log', 'dbee-explorer', 'help'
--        -- Eliminamos 'toggleterm' de aquí si quieres ver la barra en la terminal
--      },
--    },
--    -- Mantiene la barra en cada ventana individualmente
--    globalstatus = false,
--  },
--  
--  sections = {
--    -- SECCIÓN A: El modo actual (NORMAL, INSERT, TERMINAL...)
--    lualine_a = { 
--      { 'mode', icon = '' } 
--    },
--    
--    -- SECCIÓN B: Nombre del archivo / Terminal y Rama de Git
--    lualine_b = { 
--      {
--        function()
--          -- Si es terminal, muestra un nombre limpio y corto
--          if vim.bo.buftype == 'terminal' then
--            return "  Terminal"
--          end
--          -- Si es archivo, muestra el nombre (con icono de modificado si aplica)
--          local fname = vim.fn.expand('%:t')
--          if fname == "" then return "[Sin nombre]" end
--          return fname
--        end,
--      },
--      -- El componente 'branch' (Git) solo se muestra si NO es una terminal
--      { 'branch', cond = not_in_term } 
--    },
--    
--    -- SECCIÓN C: Iconos de errores y avisos (solo en archivos)
--    lualine_c = { 
--      { 'diagnostics', symbols = { error = ' ', warn = ' ' }, cond = not_in_term } 
--    },
--    
--    -- SECCIÓN X: Codificación y tipo de archivo (oculto en terminal)
--    lualine_x = {
--      { 
--        'encoding', 
--        fmt = string.upper, 
--        cond = not_in_term,
--        padding = { left = 1, right = 0 } 
--      },
--      -- El separador "|" solo se dibuja si no es terminal
--      { 
--        function() return "│" end, 
--        color = { fg = "#45475a" }, 
--        padding = { left = 1, right = 1 },
--        cond = not_in_term 
--      },
--      { 'filetype', cond = not_in_term, padding = { left = 0, right = 1 } } 
--    },
--    
--    -- SECCIÓN Y: Progreso (Top/Bot/%) - Oculto en terminal
--    lualine_y = { 
--      { 'progress', cond = not_in_term, padding = { left = 1,
-- ========================================================================== --
--                LUALINE: CONFIGURACIÓN SLANT (FINAL Y CORREGIDA)            --
-- ========================================================================== --

-- 1. Función para detectar si NO estamos en una terminal
-- Útil para ocultar componentes y limpiar la barra
local function not_in_term()
  return vim.bo.buftype ~= 'terminal'
end

require("lualine").setup {
  options = {
    theme = "duskfox",
    -- Estilo Slant (ángulos)
    section_separators = { left = '', right = '' },
    -- Desactivamos separadores internos para evitar el "/" o "|" automático
    component_separators = { left = '', right = '' }, 
    
    disabled_filetypes = { 
      statusline = {
        'NvimTree', 'dbee-drawer', 'dbee-result', 
        'dbee-call-log', 'dbee-explorer', 'help',
        -- 'toggleterm'  <-- No lo pongas aquí si quieres ver la barra en la terminal
      },
    },
    globalstatus = false,
  },
  
  sections = {
    -- SECCIÓN A: El modo actual (NORMAL, INSERT, etc.)
    lualine_a = { 
      { 'mode', icon = '' } 
    },
    
    -- SECCIÓN B: Nombre dinámico y rama Git
    lualine_b = { 
      {
        function()
          -- Si es terminal, nombre simplificado
          if vim.bo.buftype == 'terminal' then
            return "  Terminal"
          end
          -- Si es archivo, solo el nombre (sin rutas largas)
          local fname = vim.fn.expand('%:t')
          return fname ~= "" and fname or "[Sin nombre]"
        end,
      },
      -- Solo muestra la rama de Git si NO es una terminal
      { 'branch', cond = not_in_term } 
    },
    
    -- SECCIÓN C: Avisos de errores (solo en archivos)
    lualine_c = { 
      { 'diagnostics', symbols = { error = ' ', warn = ' ' }, cond = not_in_term } 
    },
    
    -- SECCIÓN X: Detalles técnicos (se ocultan en terminal)
    lualine_x = {
      { 
        'encoding', 
        fmt = string.upper, 
        cond = not_in_term, 
        padding = { left = 1, right = 0 } 
      },
      -- Separador personalizado que solo aparece si no es terminal
      { 
        function() return "│" end, 
        color = { fg = "#45475a" }, 
        padding = { left = 1, right = 1 },
        cond = not_in_term 
      },
      { 'filetype', cond = not_in_term, padding = { left = 0, right = 1 } } 
    },
    
    -- SECCIÓN Y: % de progreso (Oculto en terminal)
    lualine_y = { 
      { 'progress', cond = not_in_term, padding = { left = 1, right = 1 } } 
    },
    
    -- SECCIÓN Z: Línea y Columna (Oculto en terminal)
    lualine_z = { 
      { 'location', cond = not_in_term, padding = { left = 1, right = 1 } } 
    }
  }
}
