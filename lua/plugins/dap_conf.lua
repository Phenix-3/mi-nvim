-- compruebo dependencias
local dap = require("dap")
local Terminal = require("toggleterm.terminal").Terminal

-- envio a mi por mi puerto
dap.adapters.python = {
  type = "server", -- mi yo server
  host = "127.0.0.1", -- me lo envio a yo
  port = 5678, -- puerto que uso para enviar y recibir (se puede cambiar su este ya está en uso)
}

-- conf debugpy
dap.configurations.python = {
  {
    type = "python", -- lo que te llegue será python
    request = "attach", -- enchufate a mi python
    name = "Attach to debugpy", -- nombre (da igual como se llame)
    connect = {
      host = "127.0.0.1", -- me conecto a mi mismo
      port = 5678, -- puerto por el que me enchufo
    },
    mode = "remote", -- opcional
    pathMappings = { 
      {
        localRoot = vim.fn.getcwd(), -- raiz acutal (fichero py)
        remoteRoot = ".", -- ruta donde se ejecuta el script 
      },
    },
    pythonPath = function() -- ruta absoluta ejecutable de python
      return "/home/phenix/.venvs/nvim-debug/bin/python" -- mi entorno virtual (venvs)
    end,
  },
}

-- ejecuta el script actual modo debug 
function RunAndAttachDebugpy()
  local file = vim.fn.expand("%:p") -- ruta absoluta fichero actual

  local debugpy_term = Terminal:new({
    cmd = string.format(
      "source /home/phenix/.venvs/nvim-debug/bin/activate && python -m debugpy --listen 5678 --wait-for-client '%s'", -- activa el entorno virtual
      file
    ),
    -- ya definido en otro fichero
    hidden = true,
    direction = "horizontal",
    close_on_exit = false,
    on_open = function()
      vim.defer_fn(function() -- segundos a que todo este bien
        vim.cmd("wincmd p")
        require('dap').continue()
      end, 500)
    end,
  })

  debugpy_term:toggle()
end

-- si sale mal reiniciar dap (cosa muy comun)
function RestartDAP()
  dap.terminate()
  dap.disconnect()
  print("DAP reiniciado.")
end

-- keymap
vim.api.nvim_set_keymap("n", "<F5>", ":lua RunAndAttachDebugpy()<CR>", { noremap = true, silent = true }) -- f5 salta la termianl
vim.api.nvim_set_keymap("n", "<F6>", ":lua RestartDAP()<CR>", { noremap = true, silent = true }) -- f6 restart de dap

