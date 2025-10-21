-- ~/.config/nvim/lua/plugins/cmp_conf.lua

local mason = require("mason")
mason.setup()

local mason_lspconfig = require("mason-lspconfig")
mason_lspconfig.setup({
  ensure_installed = { "ts_ls", "pyright", "lua_ls" },
  automatic_installation = true,
})

local cmp = require("cmp")
local luasnip = require("luasnip")
local lspconfig = require("lspconfig")
local cmp_nvim_lsp = require("cmp_nvim_lsp")

local capabilities = cmp_nvim_lsp.default_capabilities()

cmp.setup({
  snippet = {
    expand = function(args)
      luasnip.lsp_expand(args.body)
    end,
  },
  mapping = cmp.mapping.preset.insert({
    ["<C-b>"] = cmp.mapping.scroll_docs(-4),
    ["<C-f>"] = cmp.mapping.scroll_docs(4),
    ["<C-Space>"] = cmp.mapping.complete(),
    ["<C-e>"] = cmp.mapping.abort(),
    ["<CR>"] = cmp.mapping.confirm({ select = true }),
  }),
  sources = cmp.config.sources({
    { name = "nvim_lsp" },
    { name = "luasnip" },
    { name = "buffer" },
  }),
})

-- Para evitar el warning deprecated, usar esta línea antes de configurar lspconfig:
vim.lsp.set_log_level("error")  -- Opcional: oculta warnings en el log

local servers = { "ts_ls", "pyright", "lua_ls" }

for _, server in ipairs(servers) do
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

