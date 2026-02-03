return {
  'kristijanhusak/vim-dadbod-ui',
  dependencies = {
    { 'tpope/vim-dadbod', lazy = true },
    { 'kristijanhusak/vim-dadbod-completion', ft = { 'sql', 'mysql', 'plsql' }, lazy = true },
  },
  cmd = {
    'DBUI',
    'DBUIToggle',
    'DBUIAddConnection',
    'DBUIFindBuffer',
  },
  init = function()
    -- Prefijo para las tablas y configuración visual
    vim.g.db_ui_use_nerd_fonts = 1
    -- Opcional: donde se guardan tus queries guardadas
    vim.g.db_ui_save_location = vim.fn.stdpath("config") .. "/db_queries"
  end,
  config = function()
    -- Aquí puedes añadir mapeos específicos si lo deseas
    -- Por ejemplo, abrir el UI con un atajo:
    vim.keymap.set('n', '<leader>db', ':DBUIToggle<CR>', { desc = 'Toggle DBUI' })
  end,
}
