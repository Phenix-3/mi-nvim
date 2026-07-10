-- ========================================================================== --
--                  CONFIGURACIÓN DE MARKDOWN PREVIEW                         --
--          (Previsualización en navegador para archivos Markdown)            --
-- ========================================================================== --
return {
  "iamcco/markdown-preview.nvim",
  cmd = { "MarkdownPreviewToggle", "MarkdownPreview", "MarkdownPreviewStop" },
  ft = { "markdown" },
  build = function()
    vim.fn["mkdp#util#install"]()
  end,
  config = function()
    -- Mapeo de teclado para activar/desactivar la vista previa en el navegador
    vim.keymap.set("n", "<C-p>", "<cmd>MarkdownPreviewToggle<cr>", { 
      desc = "Markdown Preview (HTML)" 
    })
  end,
}
