vim.g.mapleader = " "

vim.keymap.set("n", "<cr>", "<cr>")
vim.keymap.set("n", "<c-i>", "<c-i>")
vim.keymap.set("n", "<c-[>", "<c-[>")

vim.keymap.set("i", "jk", "<esc>")
vim.keymap.set("i", "kj", "<esc>")
vim.keymap.set("n", "<s-y>", "y$")
vim.keymap.set("n", "<leader>", "<nop>")

vim.keymap.set("n", "<leader>w", "<cmd>write<cr>")
vim.keymap.set("n", "<leader>q", "<cmd>quit<cr>")
vim.keymap.set("n", "<leader>c", "<cmd>bdelete<cr>")
vim.keymap.set("n", "<leader>t", "<cmd>terminal<cr>")
vim.keymap.set("n", "<leader>s", "<cmd>split<cr>")
vim.keymap.set("n", "<leader>v", "<cmd>vsplit<cr>")
vim.keymap.set("n", "<leader>u", "<cmd>nohlsearch<cr>")
