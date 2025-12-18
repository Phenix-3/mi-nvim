-- ~/.config/nvim/lua/config-telescope.lua
require('telescope').setup{
  defaults = {
    -- Aquí puedes poner toda tu personalización
    prompt_prefix = "🔍 ",
    selection_caret = "➜ ",
    layout_strategy = "horizontal",
  }
}
