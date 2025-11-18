-- repasar los comentarios
-- utilizare mason (gestor de paquetes de lsp)
local mason = require("mason")
mason.setup()
-- configuracion mason
local mason_lspconfig = require("mason-lspconfig")
mason_lspconfig.setup({
  ensure_installed = { "ts_ls", "pyright", "lua_ls" }, -- paquetes a instalar (automatico)
  automatic_installation = true, -- hacer automatico
})
-- comprobaciones de dependencias para no liarla
local cmp = require("cmp")
local luasnip = require("luasnip")
local lspconfig = require("lspconfig")
local cmp_nvim_lsp = require("cmp_nvim_lsp")

local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = cmp_nvim_lsp.default_capabilities(capabilities)

-- dependencias mason
local mason = require("mason")
mason.setup()

local mason_lspconfig = require("mason-lspconfig")
mason_lspconfig.setup({
    ensure_installed = { "ts_ls", "pyright", "lua_ls" }, 
    automatic_installation = true,
--handlers para delegar la configuración.
    handlers = {
        -- handler por defecto para todos los servidores no especificados.
        function (server_name)
            lspconfig[server_name].setup({
                capabilities = capabilities,
            })
        end,
        
        -- handler para lua_ls
        lua_ls = function ()
            lspconfig.lua_ls.setup({
                capabilities = capabilities,
                settings = {
                    Lua = {
                        diagnostics = {
                            globals = { "vim" },
                        },
                    },
                },
            })
        end,
    },
})
-- motor principal de autocompletado
cmp.setup({
  snippet = {
    expand = function(args) -- si cree que puede autocompletar usar esta funcion
      luasnip.lsp_expand(args.body)
    end,
  },
  mapping = cmp.mapping.preset.insert({ -- keymaps documentacion (recomendado)
    ["<C-b>"] = cmp.mapping.scroll_docs(-4), -- arriba
    ["<C-f>"] = cmp.mapping.scroll_docs(4), -- abajo
    ["<C-Space>"] = cmp.mapping.complete(), -- abrir ventana autocompletado
    ["<C-e>"] = cmp.mapping.abort(), -- abortar mision autocompletar
    ["<CR>"] = cmp.mapping.confirm({ select = true }), -- confirma autocompletado
  }),
  sources = cmp.config.sources({ -- fuentes de palabras
    { name = "nvim_lsp" }, -- las mejores
    { name = "luasnip" }, -- sugerencias personalizadas
    { name = "buffer" }, -- lo que ya he escrito
  }),
})
