-- buffer seleccionado (query)
vim.g.fzf_buffers_jump = 1

-- ripgrep lista solo archivos
vim.env.FZF_DEFAULT_COMMAND = 'rg --files --hidden --follow --glob "!.git/*"'

-- tamaño de ventana emergente
vim.g.fzf_layout = {
  window = {
    width = 0.9, -- ancho
    height = 0.6, -- alto
    border = 'rounded' -- bordes redondeados
  }
}

-- vista previa derecha (no me funciona)
vim.g.fzf_preview_window = 'right:50%'

