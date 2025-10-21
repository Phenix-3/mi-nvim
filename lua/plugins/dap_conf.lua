local dap = require("dap")
local Terminal = require("toggleterm.terminal").Terminal

-- 🔌 Adaptador para debugpy
dap.adapters.python = {
  type = "server",
  host = "127.0.0.1",
  port = 5678,
}

-- 🧠 Configuración para adjuntar debugpy a scripts Python
dap.configurations.python = {
  {
    type = "python",
    request = "attach",
    name = "Attach to debugpy",
    connect = {
      host = "127.0.0.1",
      port = 5678,
    },
    mode = "remote",
    pathMappings = {
      {
        localRoot = vim.fn.getcwd(),
        remoteRoot = ".",
      },
    },
    pythonPath = function()
      -- Cambia esta ruta si tu entorno virtual cambia
      return "/home/phenix/.venvs/nvim-debug/bin/python"
    end,
  },
}

-- 🚀 Función para ejecutar el script actual en modo debug y hacer attach automáticamente
function RunAndAttachDebugpy()
  local file = vim.fn.expand("%:p") -- Ruta completa del archivo actual

  local debugpy_term = Terminal:new({
    cmd = string.format(
      "source /home/phenix/.venvs/nvim-debug/bin/activate && python -m debugpy --listen 5678 --wait-for-client '%s'",
      file
    ),
    hidden = true,
    direction = "horizontal",
    close_on_exit = false,
    on_open = function()
      vim.defer_fn(function()
        vim.cmd("wincmd p") -- ⬅️ Vuelve al buffer anterior (el archivo .py)
        require('dap').continue()
      end, 500)
    end,
  })

  debugpy_term:toggle()
end

-- 🔄 Función para reiniciar el cliente DAP si algo se cuelga
function RestartDAP()
  dap.terminate()
  dap.disconnect()
  print("DAP reiniciado.")
end

-- ⌨️ Mapas de tecla para lanzar y reiniciar debug
vim.api.nvim_set_keymap("n", "<F5>", ":lua RunAndAttachDebugpy()<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<F6>", ":lua RestartDAP()<CR>", { noremap = true, silent = true })

