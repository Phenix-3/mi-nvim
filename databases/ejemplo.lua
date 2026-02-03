local sources = require("dbee.sources")

-- Retornamos la lista de fuentes que dbee necesita EN JSON
return {
  sources.MemorySource:new({
    {
      name = "coder",
      type = "nobre_de_base_de_datos", -- ej mariadb, mysql, oracle
      url = "type://user:passwd@machine:port/(database) opcional",
    }
  }),
}

