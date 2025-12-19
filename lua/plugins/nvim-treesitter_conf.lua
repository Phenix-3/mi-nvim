-- lua/plugins/nvim-treesitter_conf.lua
local status, configs = pcall(require, "nvim-treesitter.configs")

if not status then
    -- Si llegamos aquí, es que el plugin realmente no está instalado físicamente
    return
end

configs.setup {
    ensure_installed = {
      "lua", "python", "php", "html", "bash", "css", "vim", "vimdoc", "javascript", "rust"
    },
    highlight = {
      enable = true,
      additional_vim_regex_highlighting = false,
    },
    indent = {
      enable = true
    }
}
