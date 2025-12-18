---- aqui los lenguajes que quiera
--require('nvim-treesitter.configs').setup {
--   ensure_installed = { -- que lenguajes entender, añadir mas si es necesario
--      "lua",
--      "python",
--      "php",
--      "html",
--      "bash",
--      "css"
--   },
--   highlight = {
--      enable = true, -- resaltado de errores 
--   },
--}
-- ~/.config/nvim/lua/plugins/nvim-treesitter_conf.lua

-- Usamos pcall (protected call) para que si el plugin no carga, 
-- no bloquee el resto de Neovim
local status, configs = pcall(require, "nvim-treesitter.configs")
if not status then 
    print("Error: No se pudo cargar nvim-treesitter")
    return 
end

configs.setup {
   ensure_installed = { 
      "lua", "python", "php", "html", "bash", "css", "vim", "vimdoc" 
   },
   highlight = {
      enable = true,
      additional_vim_regex_highlighting = false,
   },
   indent = {
      enable = true -- Te recomiendo activar esto para que el auto-indentado sea mejor
   }
}
