-- ========================================================================== --
--                CONFIGURACIÓN DE LSP (MASON) Y AUTOCOMPLETADO               --
-- ========================================================================== --

-- 1. Gestión de Servidores con Mason
local mason = require("mason")
mason.setup()

local mason_lspconfig = require("mason-lspconfig")
mason_lspconfig.setup({
  -- Servidores que se instalarán automáticamente al iniciar
  ensure_installed = { "ts_ls", "pyright", "lua_ls" }, 
  automatic_installation = true,
  
  -- Handlers para vincular Mason con lspconfig
  handlers = {
    -- Configuración genérica para cualquier servidor
    function (server_name)
      require("lspconfig")[server_name].setup({
        capabilities = require("cmp_nvim_lsp").default_capabilities(),
      })
    end,
    
    -- Configuración específica para Lua (evita avisos de 'vim' global)
    lua_ls = function ()
      require("lspconfig").lua_ls.setup({
        capabilities = require("cmp_nvim_lsp").default_capabilities(),
        settings = {
          Lua = {
            diagnostics = { globals = { "vim" } },
          },
        },
      })
    end,
  },
})

-- 2. Motor de Autocompletado (nvim-cmp)
local cmp = require("cmp")
local luasnip = require("luasnip")

cmp.setup({
  snippet = {
    -- Vincula el motor de autocompletado con el de snippets (LuaSnip)
    expand = function(args)
      luasnip.lsp_expand(args.body)
    end,
  },
  
  -- Atajos de teclado para el menú desplegable
  mapping = cmp.mapping.preset.insert({
    ["<C-b>"] = cmp.mapping.scroll_docs(-4),      -- Scroll documentación arriba
    ["<C-f>"] = cmp.mapping.scroll_docs(4),       -- Scroll documentación abajo
    ["<C-Space>"] = cmp.mapping.complete(),       -- Forzar apertura del menú
    ["<C-e>"] = cmp.mapping.abort(),              -- Cerrar el menú sin elegir
    ["<CR>"] = cmp.mapping.confirm({ select = true }), -- Confirmar selección
  }),
  
  -- Prioridad de las fuentes de sugerencias
  sources = cmp.config.sources({
    { name = "nvim_lsp" }, -- Servidores de lenguaje (IntelliSense)
    { name = "luasnip" },  -- Plantillas de código
    { name = "buffer" },   -- Palabras escritas en el archivo actual
  }),
})
