return {
"kndndrj/nvim-dbee",
  dependencies = {
    "MunifTanjim/nui.nvim",
  },
  build = function()
    require("dbee").install()
  end,
  config = function()
    require("dbee").setup({
      sources = {
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
