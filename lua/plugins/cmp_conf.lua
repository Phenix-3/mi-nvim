-- ~/.config/nvim/lua/plugins/cmp_conf.lua
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

local capabilities = cmp_nvim_lsp.default_capabilities() -- configuracion estandar recomendada de lsp

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

-- para evitar warning usar esta línea antes de configurar lspconfig
vim.lsp.set_log_level("error")  -- oculta warnings en el log, no se como solucionarlo

local servers = { "ts_ls", "pyright", "lua_ls" } -- autoconfiguracion

for _, server in ipairs(servers) do -- bucle que busca entre los tres servers que puede autocompletar (chupa ram)
  lspconfig[server].setup({
    capabilities = capabilities,
    settings = server == "lua_ls" and {
      Lua = {
        diagnostics = {
          globals = { "vim" },
        },
      },
    } or nil,
  })
end

