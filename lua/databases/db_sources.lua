-- Este archivo solo gestiona los datos de conexión
local sources = require("dbee.sources")

-- Retornamos la lista de fuentes que dbee necesita EN JSON
return {
  sources.MemorySource:new({
    {
      name = "coder",
      type = "mariadb",
      url = "mariadb://usuario:usuario@localhost:3306/usuario",
    }
  }),
}
