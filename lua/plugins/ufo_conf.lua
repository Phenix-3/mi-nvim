-- ========================================================================== --
--                             CONFIGURACIÓN DE UFO                           --
--                        (Plegado de código inteligente)                     --
-- ========================================================================== --
return {
  "kevinhwang91/nvim-ufo",           -- Plugin principal
  dependencies = "kevinhwang91/promise-async", -- Dependencia necesaria
  
  config = function()
    -- Ajustes globales de Neovim para el plegado
    vim.o.foldcolumn = '1'           -- Muestra la columna de pliegues a la izquierda
    vim.o.foldlevel = 99             -- Mantiene casi todos los pliegues abiertos por defecto
    vim.o.foldlevelstart = 99        -- Nivel inicial de pliegue
    vim.o.foldenable = true          -- Habilita el plegado de código

    -- Mapeo rápido: Espacio para abrir/cerrar pliegues (za)
    vim.keymap.set('n', '<space>', 'za')

    -- Configuración del motor de búsqueda de pliegues
    require('ufo').setup({
      provider_selector = function()
        -- Prioriza Treesitter para saber qué partes del código se pueden plegar
        return {'treesitter', 'indent'}
      end
    })
  end
}
