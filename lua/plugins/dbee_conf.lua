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
            name = "mioracle1",
            type = "oracle",
            url = "sys:Airis2025@192.168.1.50:1521/xe",
          },
        }),
      },
    })
  end,
}
