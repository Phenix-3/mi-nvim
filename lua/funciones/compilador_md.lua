local M = {}

function M.setup()
    vim.api.nvim_create_autocmd("BufWritePost", {
        pattern = "*/apuntes/*.md",
        callback = function()
            local md_file = vim.fn.expand("%:p")
            local html_file = vim.fn.expand("%:p:r") .. ".html"
            local grip_path = "/home/phenix/.venvs/nvim-debug/bin/grip"
            
            -- 1. Compilamos el HTML limpio usando grip básico
            vim.fn.jobstart({ grip_path, md_file, "--export", html_file }, {
                on_exit = function(_, exit_code)
                    if exit_code == 0 then
                        -- 2. Inyectamos los estilos clonados de Neovim y la estructura oscura envolvente
                        local sed_cmd = string.format(
                            [[sed -i '1i <link rel="stylesheet" href="/apuntes/estilo.css"><main data-theme="dark"><div id="page-ctn">' %s && echo '</div></main>' >> %s]],
                            vim.fn.shellescape(html_file),
                            vim.fn.shellescape(html_file)
                        )
                        
                        -- 3. Borramos el bloque Frontmatter de Obsidian (id: indice...) del HTML de forma segura
                        local clean_obsidian = string.format(
                            [[sed -i '/<li class="task-list-item source-line"/,/<\/li>/d' %s && sed -i '/<hr>/d' %s]],
                            vim.fn.shellescape(html_file),
                            vim.fn.shellescape(html_file)
                        )
                        
                        vim.fn.jobstart(sed_cmd .. " && " .. clean_obsidian, { shell = true })
                    end
                end
            })
        end,
    })
end

return M
