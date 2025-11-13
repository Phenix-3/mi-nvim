require('nvim-treesitter.configs').setup {
   ensure_installed = {
      "lua",
      "python",
      "php",
      "html",
      "bash",
      "css"
   },
   highlight = {
      enable = true,
      -- use_languagetree = true, -- esta opción está deprecada en versiones recientes
   },
}
