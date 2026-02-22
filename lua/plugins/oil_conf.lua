-- ========================================================================== --
--                          CONFIGURACIÓN DE OIL.NVIM                         --
--                (Edita tu sistema de archivos como un buffer)               --
-- ========================================================================== --
require("oil").setup({
  -- Establece Oil como el explorador por defecto (sustituye a Netrw)
  default_file_explorer = true,
  -- Desactiva avisos molestos al usar protocolos SCP
  silence_scp_warning = true,
  
  -- Soporte para edición de archivos remotos vía SSH
  adapters = {
    ["oil-ssh"] = "oil.adapters.ssh",
  },
  
  -- Columnas que se muestran en el explorador
  columns = {
    "icon",        -- Icono del tipo de archivo
    "permissions", -- Permisos de lectura/escritura (rwx)
    -- "size",     -- (Opcional) Tamaño del archivo
    "mtime",       -- Última fecha de modificación
  },
  
  -- Opciones de visualización
  view_options = {
    show_hidden = true, -- Mostrar archivos ocultos (dotfiles) por defecto
  },
})
