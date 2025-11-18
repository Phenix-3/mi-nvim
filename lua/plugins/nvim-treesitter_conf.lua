-- aqui los lenguajes que quiera
require('nvim-treesitter.configs').setup {
   ensure_installed = { -- que lenguajes entender, añadir mas si es necesario
      "lua",
      "python",
      "php",
      "html",
      "bash",
      "css"
   },
   highlight = {
      enable = true, -- resaltado de errores 
   },
}
