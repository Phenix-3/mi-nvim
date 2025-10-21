-- "mi config"
require("lualine").setup {
  options = {
    theme = "codedark",
  },
  sections = {
    lualine_a = { "mode" },
    lualine_b = { "filename" },
    lualine_c = {
      function()
        return vim.g.coc_status or ""
      end
    },
    lualine_x = { "branch" },
    lualine_y = { "encoding" },
    lualine_z = { "location" }
  }
}

