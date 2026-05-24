vim.g.mapleader = " "
vim.g.maplocalleader = " "
vim.keymap.set("n", "<leader>sr", function()
    require("grug-far").open()
end)
-- Normal mode: Space + e to open file explorer
-- vim.keymap.set("n", "<leader>e", ":Ex<CR>", { desc = "Open file explorer" })
