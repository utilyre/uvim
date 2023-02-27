local function map(mode, left, right) vim.keymap.set(mode, left, right) end

map("n", "<leader>", "<nop>")
map("n", "<leader>w", "<cmd>write<cr>")
map("n", "<leader>q", "<cmd>quit<cr>")
map("n", "<leader>s", "<cmd>split<cr>")
map("n", "<leader>v", "<cmd>vsplit<cr>")
map("n", "<leader>u", "<cmd>nohlsearch<cr>")

map("n", "<s-y>", "y$")
map("i", "jk", "<esc>")
map("i", "kj", "<esc>")
