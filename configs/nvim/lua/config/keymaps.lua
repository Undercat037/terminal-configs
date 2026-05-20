-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here
-- Ctrl+Z — undo
vim.keymap.set("n", "<C-z>", "u", { desc = "Undo" })

-- Ctrl+X — cut (dd и в системный буфер)
vim.keymap.set("n", "<C-x>", '"+dd', { desc = "Cut line" })
vim.keymap.set("v", "<C-x>", '"+d', { desc = "Cut" })

-- Ctrl+C — copy в системный буфер
vim.keymap.set("n", "<C-c>", '"+yy', { desc = "Copy line" })
vim.keymap.set("v", "<C-c>", '"+y', { desc = "Copy" })

-- Ctrl+V — paste из системного буфера
vim.keymap.set("n", "<C-v>", '"+p', { desc = "Paste" })
vim.keymap.set("i", "<C-v>", "<C-r>+", { desc = "Paste in insert mode" })
vim.keymap.set("v", "<C-v>", '"+p', { desc = "Paste" })
-- включить kitty keyboard protocol
vim.o.keymodel = "startsel,stopsel"
