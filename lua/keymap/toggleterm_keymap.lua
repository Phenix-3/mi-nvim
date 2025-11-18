-- comprobacion dependencias
local Terminal  = require('toggleterm.terminal').Terminal
local dap = require('dap')

local Terminal  = require('toggleterm.terminal').Terminal

-- subterminal para debugpy (se encesita instalar con pip)
local debugpy_term = Terminal:new({
  cmd = "python -m debugpy --listen 5678 --wait-for-client " .. vim.fn.expand("%"),
  hidden = true,
  direction = "horizontal",
  close_on_exit = false,
})

function _G.toggle_debugpy()
  debugpy_term:toggle()
end

-- keymap para sacar debugpy (`,dt`) [no lo uso, quitar]
vim.api.nvim_set_keymap('n', '<leader>dt', ':lua toggle_debugpy()<CR>', { noremap = true, silent = true })

