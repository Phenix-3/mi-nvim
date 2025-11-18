require("toggleterm").setup{
  size = 20, -- tamaño (altura + anchura)
  open_mapping = [[<c-\>]],  -- habilita el mapeo de atajos
  shade_filetypes = {}, -- si se habre algun fichero se oscurece la terminal para mallor constraste
  shade_terminals = true, -- oscurece el fondo de la terminal
  shading_factor = 2, -- intensidad de oscuridad
  start_in_insert = true, -- modo inicial cuando se habre la terminal insert
  persist_size = true, -- no se cierra con el tiempo
  direction = "float",  -- sale en todo el medio con float
  close_on_exit = false, -- si se finaliza la que la ha invocado no se cierra (porque no es su proceso padre)
  shell = vim.o.shell, -- mantiene las demas opciones activas en esta terminal
}

