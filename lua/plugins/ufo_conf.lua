return {
  "kevinhwang91/nvim-ufo",           -- Nombre del plugin para que Lazy lo descargue
  dependencies = "kevinhwang91/promise-async",
  config = function()
    -- Ajustes de Neovim
    vim.o.foldcolumn = '1'
    vim.o.foldlevel = 99
    vim.o.foldlevelstart = 99
    vim.o.foldenable = true

    -- Mapeo
    vim.keymap.set('n', '<space>', 'za')

    -- Aquí SÍ usas require("ufo"), porque el módulo se llama así
    require('ufo').setup({
      provider_selector = function()
        return {'treesitter', 'indent'}
      end
    })
  end
}
