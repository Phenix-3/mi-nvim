local map = vim.keymap.set

-- Abrir/Cerrar la interfaz completa
map("n", "<leader>do", "<cmd>Dbee open<cr>", { desc = "Abrir DBee" })
map("n", "<leader>dc", "<cmd>Dbee close<cr>", { desc = "Cerrar DBee" })

map("n", "<leader>de", "<cmd>Dbee execute<cr>", { desc = "Ejecutar Query" })
