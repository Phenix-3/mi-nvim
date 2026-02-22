-- ========================================================================== --
--                    CONFIGURACIÓN DE NVIM-TREESITTER                        --
--            (Resaltado de sintaxis y análisis de código avanzado)           --
-- ========================================================================== --
local status, configs = pcall(require, "nvim-treesitter.configs")

if not status then
    -- Evita errores si el plugin no está instalado físicamente
    return
end

configs.setup {
    -- Lista de lenguajes que queremos que estén instalados siempre
    ensure_installed = {
      "lua", "python", "php", "html", "bash", "css", "vim", "vimdoc", "javascript", "rust"
    },
    
    -- Configuración del coloreado (Resaltado)
    highlight = {
      enable = true, -- Activa el resaltado de Treesitter
      -- Desactiva el resaltado estándar de Vim para ganar rendimiento
      additional_vim_regex_highlighting = false, 
    },
    
    -- Mejora el comportamiento del indentado automático
    indent = {
      enable = true 
    }
}
