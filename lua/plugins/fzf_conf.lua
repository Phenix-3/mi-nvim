-- Saltar automáticamente al buffer seleccionado
vim.g.fzf_buffers_jump = 1

-- Usar ripgrep como buscador por defecto
vim.env.FZF_DEFAULT_COMMAND = 'rg --files --hidden --follow --glob "!.git/*"'

-- Configurar diseño de la ventana fzf
vim.g.fzf_layout = {
  window = {
    width = 0.9,
    height = 0.6,
    border = 'rounded'
  }
}

-- Vista previa en la derecha
vim.g.fzf_preview_window = 'right:50%'

