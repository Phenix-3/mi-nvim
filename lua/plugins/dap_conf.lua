-- ========================================================================== --
--                       CONFIGURACIÓN DE DEBUGGER (DAP)                      --
-- ========================================================================== --
local dap = require("dap")
local Terminal = require("toggleterm.terminal").Terminal

local home = os.getenv("HOME")
local venv_path = home .. "/.venvs/nvim-debug/bin/"

-- 1. ADAPTADOR
dap.adapters.python = {
  type = "server",
  host = "127.0.0.1",
  port = 5678,
}

-- 2. CONFIGURACIÓN
dap.configurations.python = {
  {
    type = "python",
    request = "attach",
    name = "Attach to debugpy",
    connect = { host = "127.0.0.1", port = 5678 },
    mode = "remote",
    pathMappings = { { localRoot = vim.fn.getcwd(), remoteRoot = "." } },
    pythonPath = function() return venv_path .. "python" end,
  },
}

-- 3. FUNCIÓN DE EJECUCIÓN
function RunAndAttachDebugpy()
  vim.cmd("silent! write")
  
  local file = vim.fn.expand("%:p")
  local cmd = string.format(
    "export PYDEVD_DISABLE_FILE_VALIDATION=1 && " ..
    "source %sactivate && " ..
    "python -Xfrozen_modules=off -m debugpy --listen 5678 --wait-for-client '%s'; " ..
    "echo -e '\\n---------------------------------------'; " ..
    "echo -e '      EJECUCIÓN FINALIZADA'; " ..
    "echo -e '  Presiona [q] para cerrar el panel'; " ..
    "echo -e '---------------------------------------'; " ..
    "read", 
    venv_path, 
    file
  )

  -- Tamaño ajustado al 38%
  local ancho_ajustado = math.floor(vim.o.columns * 0.38)

  local debugpy_term = Terminal:new({
    cmd = cmd,
    direction = "vertical",
    size = ancho_ajustado, 
    close_on_exit = false,
    on_open = function(term)
      -- Mapeos y Modo Normal
      vim.api.nvim_buf_set_keymap(term.bufnr, "n", "q", "<cmd>close<CR>", {noremap = true, silent = true})
      
      -- Forzamos Modo Normal al abrir
      vim.cmd("stopinsert")

      -- Ejecutar DAP forzando la configuración de Python
      vim.defer_fn(function()
        if dap.configurations.python and dap.configurations.python[1] then
          dap.run(dap.configurations.python[1])
        end
      end, 500)
    end,
  })
  
  debugpy_term:toggle()
end

-- 4. KEYMAPS
vim.keymap.set("n", "<F5>", RunAndAttachDebugpy, { desc = "DAP: Run Python" })
vim.keymap.set("n", "<F6>", function() 
  dap.terminate()
  dap.disconnect()
  print("DAP: Reset")
end, { desc = "DAP: Reset" })
