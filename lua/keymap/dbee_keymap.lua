local map = vim.keymap.set
-- No se que keymap poner
-- map("n", "<leader>op", "<cmd>Dbee open<cr>", { desc = "Abrir DBee" })
-- map("n", "<leader>cl", "<cmd>Dbee close<cr>", { desc = "Cerrar DBee" })

map("n", "<leader>BB", "<cmd>Dbee execute<cr>", { desc = "Ejecutar Query" })
