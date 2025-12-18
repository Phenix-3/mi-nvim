require("oil").setup({
  default_file_explorer = true,
  silence_scp_warning = true,
  -- Adaptadores para protocolos remotos
  adapters = {
    ["oil-ssh"] = "oil.adapters.ssh",
  },
  columns = {
    "icon",
    "permissions",
    -- "size",
    "mtime",
  },
  view_options = {
    show_hidden = true,
  },
})
