-- ========================================================================== --
--                        CONFIGURACIÓN DE BASE DE DATOS                      --
-- ========================================================================== --
return {
  "kndndrj/nvim-dbee",
  dependencies = { "MunifTanjim/nui.nvim" },
  build = function()
    require("dbee").install() -- Instala el binario necesario (Go)
  end,
  config = function()
    require("dbee").setup({
      sources = {
        -- Fuente en memoria con conexión MySQL predefinida
        require("dbee.sources").MemorySource:new({
          {
            name = "el_coder",
            type = "mysql",   
            url = "usuario:usuario@tcp(localhost:3306)/miscosas",
          },
        }),
      },
    })
  end,
}
