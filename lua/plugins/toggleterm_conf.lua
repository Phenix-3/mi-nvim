require("toggleterm").setup{
  size = 20,
  open_mapping = [[<c-\>]],  -- Ctrl + \ para abrir o cerrar
  shade_filetypes = {},
  shade_terminals = true,
  shading_factor = 2,
  start_in_insert = true,
  persist_size = true,
  direction = "float",  -- terminal flotante
  close_on_exit = false,
  shell = vim.o.shell,
}

