--return {
--  {
--    "epwalsh/obsidian.nvim",
--    version = "*",
--    lazy = true,
--    ft = { "markdown" }, -- Se activa única y estrictamente al abrir un archivo .md
--    dependencies = {
--      "nvim-lua/plenary.nvim",
--    },
--    config = function()
--      -- Forzamos la carga manual del setup
--      require("obsidian").setup({
--        workspaces = {
--          {
--            name = "Zettelkasten",
--            path = "/home/phenix/apuntes", -- Esto traduce la ruta perfectamente
--          },
--        },
--        notes_subdir = "entradas",
--        new_notes_location = "notes_subdir",
--        
--        -- Generador de IDs Zettelkasten
--        note_id_func = function(title)
--          local suffix = ""
--          if title ~= nil then
--            suffix = title:gsub(" ", "-"):gsub("[^%w%-_]", ""):lower()
--          else
--            for _ = 1, 4 do
--              suffix = suffix .. string.char(math.random(65, 90))
--            end
--          end
--          return tostring(os.date("%Y%m%d%H%M")) .. "-" .. suffix
--        end,
--      })
--    end,
--  },
--
--  {
--    "MeanderingProgrammer/render-markdown.nvim",
--    dependencies = { "nvim-treesitter/nvim-treesitter", "echasnovski/mini.icons" },
--    ft = { "markdown" },
--    config = function()
--      require("render-markdown").setup({
--        heading = { sign = true, icons = { "󰲡 ", "󰲣 ", "󰲥 ", "󰲧 ", "󰲩 ", "󰲫 " } },
--        checkbox = { unchecked = { icon = "󰄱 " }, checked = { icon = " " } },
--      })
--    end,
--  },
--}
-- ========================================================================== --
--                     CONFIGURACIÓN DE OBSIDIAN Y MARKDOWN                   --
--           (Gestión de notas Zettelkasten y renderizado visual)             --
-- ========================================================================== --
return {
  {
    "epwalsh/obsidian.nvim",
    version = "*",
    lazy = true,
    ft = { "markdown" }, -- Se activa única y estrictamente al abrir un archivo .md
    dependencies = {
      "nvim-lua/plenary.nvim",
    },
    config = function()
      -- Forzamos la carga manual del setup
      require("obsidian").setup({
        workspaces = {
          {
            name = "Zettelkasten",
            path = "/home/phenix/apuntes", -- Esto traduce la ruta perfectamente
          },
        },
        notes_subdir = "entradas",
        new_notes_location = "notes_subdir",
        
        -- Generador de IDs Zettelkasten
        note_id_func = function(title)
          local suffix = ""
          if title ~= nil then
            suffix = title:gsub(" ", "-"):gsub("[^%w%-_]", ""):lower()
          else
            for _ = 1, 4 do
              suffix = suffix .. string.char(math.random(65, 90))
            end
          end
          return tostring(os.date("%Y%m%d%H%M")) .. "-" .. suffix
        end,
      })
    end,
  },

  {
    "MeanderingProgrammer/render-markdown.nvim",
    dependencies = { "nvim-treesitter/nvim-treesitter", "echasnovski/mini.icons" },
    ft = { "markdown" },
    config = function()
      require("render-markdown").setup({
        -- Configuración de cabeceras e iconos
        heading = { sign = true, icons = { "󰲡 ", "󰲣 ", "󰲥 ", "󰲧 ", "󰲩 ", "󰲫 " } },
        -- Configuración de checkboxes
        checkbox = { unchecked = { icon = "󰄱 " }, checked = { icon = " " } },
      })
    end,
  },
}
