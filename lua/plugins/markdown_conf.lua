return {
  "iamcco/markdown-preview.nvim",
  cmd = { "MarkdownPreviewToggle", "MarkdownPreview", "MarkdownPreviewStop" },
  ft = { "markdown" },
  build = function()
    vim.fn["mkdp#util#install"]()
  end,
  config = function()
    -- Aquí puedes añadir configuraciones específicas si lo deseas
    -- Por ejemplo, mapear el atajo de teclado SOLO cuando se cargue este plugin:
    vim.keymap.set("n", "<C-p>", "<cmd>MarkdownPreviewToggle<cr>", { 
      desc = "Markdown Preview (HTML)" 
    })
  end,
}
