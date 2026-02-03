-- lua/plugins/dbee_conf.lua
return {
  "kndndrj/nvim-dbee",
  dependencies = {
    "MunifTanjim/nui.nvim",
  },
  config = function()
    local dbee = require("dbee")
    
    -- Intentamos cargar fuentes, si falla usamos tabla vacía
    local sources_ok, my_sources = pcall(require, "databases.db_sources")
    
    dbee.setup({
      sources = sources_ok and my_sources or {},
    })

    vim.api.nvim_create_user_command("Dbee", function()
      -- El primer pcall "limpia" el error de inicialización en silencio
      pcall(dbee.open)
      -- El defer asegura que si falló el primero, el segundo abra la ventana
      vim.defer_fn(function()
        dbee.open()
      end, 50)
    end, {})
  end,
}
