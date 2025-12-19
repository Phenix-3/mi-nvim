-- lua/plugins/nvim-treesitter_conf.lua
local status, configs = pcall(require, "nvim-treesitter.configs")

if not status then
    -- Si llegamos aquí, es que el plugin realmente no está instalado físicamente
    return
end

configs.setup {
    ensure_installed = {
      "lua", "python", "php", "html", "bash", "css", "vim", "vimdoc", "javascript", "rust"
    },
    highlight = {
      enable = true,
      additional_vim_regex_highlighting = false,
    },
    indent = {
      enable = true
    }
}








------ aqui los lenguajes que quiera
----require('nvim-treesitter.configs').setup {
----   ensure_installed = { -- que lenguajes entender, añadir mas si es necesario
----      "lua",
----      "python",
----      "php",
----      "html",
----      "bash",
----      "css"
----   },
----   highlight = {
----      enable = true, -- resaltado de errores 
----   },
----}
-- ~/.config/nvim/lua/plugins/nvim-treesitter_conf.lua

-- Usamos pcall (protected call) para que si el plugin no carga, 
-- no bloquee el resto de Neovim
--local status, configs = pcall(require, "nvim-treesitter.configs")
--if not status then
--    print("Error: No se pudo cargar nvim-treesitter")
--    return
--end
--
--configs.setup {
--   ensure_installed = {
--      "lua", "python", "php", "html", "bash", "css", "vim", "vimdoc", "javascript", "rust"
--   },
--   highlight = {
--      enable = true,
--      additional_vim_regex_highlighting = false,
--   },
--   indent = {
--      enable = true -- Te recomiendo activar esto para que el auto-indentado sea mejor
--   }
--}
--Borra el pcall y el if status
--local configs = require("nvim-treesitter.configs")
--
--configs.setup {
--    ensure_installed = { 
--      "lua", "python", "php", "html", "bash", "css", "vim", "vimdoc", "javascript", "rust"
--    },
--    highlight = {
--      enable = true,
--      additional_vim_regex_highlighting = false,
--    },
--    indent = {
--      enable = true
--    }
--}
--#region
--
--..
--..
--..-- lua/plugins/nvim-treesitter_conf.lua
--..local ok, configs = pcall(require, "nvim-treesitter.configs")
--..
--..if not ok then
--..    -- En lugar de un error, intentamos refrescar el runtimepath
--..    vim.cmd([[packadd nvim-treesitter]])
--..    ok, configs = pcall(require, "nvim-treesitter.configs")
--..end
--..
--..if ok then
--..    configs.setup {
--..        ensure_installed = { 
--..          "lua", "python", "php", "html", "bash", "css", "vim", "vimdoc", "javascript", "rust"
--..        },
--..        highlight = {
--..          enable = true,
--..          additional_vim_regex_highlighting = false,
--..        },
--..        indent = {
--..          enable = true
--..        }
--..    }
--..else
--..    -- Si sigue fallando, al menos no bloquea el inicio
--..    print("Aviso: Treesitter no está listo aún. Ejecuta :PlugInstall")
--..end
--..
--..
--..
-- lua/plugins/nvim-treesitter_conf.lua
--local status, configs = pcall(require, "nvim-treesitter.configs")
--
--if not status then
--    -- Si no carga, simplemente imprimimos un aviso discreto y salimos
--    print("Aviso: nvim-treesitter no se detectó en el runtimepath")
--    return
--end
--
--configs.setup {
--    ensure_installed = { 
--      "lua", "python", "php", "html", "bash", "css", "vim", "vimdoc", "javascript", "rust"
--    },
--    highlight = {
--      enable = true,
--      additional_vim_regex_highlighting = false,
--    },
--    indent = {
--      enable = true
--    }
--}



-- lua/plugins/nvim-treesitter_conf.lua

-- Intentamos cargar el setup
--local status, configs = pcall(require, "nvim-treesitter.configs")
--
--if not status then
--    -- Si falla, intentamos refrescar los paths de nuevo desde Lua
--    vim.opt.runtimepath:append("~/.local/share/nvim/plugged/nvim-treesitter")
--    configs = require("nvim-treesitter.configs")
--end
--
--configs.setup {
--    ensure_installed = { 
--      "lua", "python", "php", "html", "bash", "css", "vim", "vimdoc", "javascript", "rust"
--    },
--    highlight = {
--      enable = true,
--      additional_vim_regex_highlighting = false,
--    },
--    indent = {
--      enable = true
--    }
--}
