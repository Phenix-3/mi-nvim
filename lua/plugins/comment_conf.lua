require('nvim_comment').setup({
  line_mapping = ",c",   -- mapeo para comentar línea con ,c
  operator_mapping = "gc", -- para usar gc como operador de comentario (opcional)
  comment_empty = false, -- no comentar líneas vacías (opcional)
})

