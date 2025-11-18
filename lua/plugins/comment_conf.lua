require('nvim_comment').setup({
  line_mapping = ",c",   -- keymap comenta línea [,c]
  operator_mapping = "gc", -- integracion de [,c] con otros comandos (ej, documento no de programacion o que no existan comment)
  comment_empty = false, -- no comentar líneas vacías, no me gusta
})

