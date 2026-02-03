--return {
--  "kndndrj/nvim-dbee",
--  dependencies = {
--    "MunifTanjim/nui.nvim",
--  },
--  build = "make",
--  lazy = true,
--  cmd = { "Dbee" },
--  config = function()
--    local dbee = require("dbee")
--    
--    -- Cargamos las fuentes desde el archivo que creamos antes
--    local my_sources = require("databases.db_sources")
--
--    dbee.setup({
--      sources = my_sources,
--      -- Opcional: añade iconos si usas Nerd Fonts
--      drawer = {
--        mappings = {
--          { key = "v", mode = "n", action = "visit" }, -- Ir a la tabla
--        },
--      },
--    })
--  end,
--}
--return {
--  "kndndrj/nvim-dbee",
--  dependencies = {
--    "MunifTanjim/nui.nvim",
--  },
--  build = "make", -- Necesario para compilar el core en Go
--  lazy = true,
--  cmd = { "Dbee" }, -- El plugin solo se activa cuando escribes :Dbee
--  init = function()
--    -- Este comando evita que Neovim ejecute el script interno de dbee 
--    -- antes de que Lazy haya cargado 'nui'
--    vim.g.loaded_dbee = 1 
--  end,
--  config = function()
--    local dbee = require("dbee")
--    
--    -- Cargamos tus conexiones del archivo que ya tienes bien
--    local status, my_sources = pcall(require, "databases.db_sources")
--    if not status then
--      my_sources = {}
--      print("Error cargando conexiones: databases.db_sources")
--    end
--
--    dbee.setup({
--      sources = my_sources,
--    })
--  end,
--}
return {
  "kndndrj/nvim-dbee",
  dependencies = {
    "MunifTanjim/nui.nvim",
  },
  build = "make",
  -- Forzamos a que no se cargue al inicio
  lazy = true,
  -- El plugin solo se cargará cuando uses estos comandos
  cmd = { "Dbee" },
  init = function()
    -- ESTO ES LO MÁS IMPORTANTE:
    -- Desactiva el script 'plugin/dbee.lua' que causa el error de nui.tree
    vim.g.loaded_dbee = 1
  end,
  config = function()
    local dbee = require("dbee")
    
    -- Carga segura de tus fuentes
    local ok, my_sources = pcall(require, "databases.db_sources")
    if not ok then
      my_sources = {}
    end

    dbee.setup({
      sources = my_sources,
    })
  end,
}
