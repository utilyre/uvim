local nmap = vim.map("n")
local xmap = vim.map("x")
local imap = vim.map("i")

nmap("<leader>", "<nop>")
nmap("<leader>w", "<cmd>write<cr>")
nmap("<leader>q", "<cmd>quit<cr>")
nmap("<leader>s", "<cmd>split<cr>")
nmap("<leader>v", "<cmd>vsplit<cr>")
nmap("<leader>u", "<cmd>nohlsearch<cr>")

nmap("<s-y>", "y$")
xmap("<s-tab>", "<gv")
xmap("<tab>", ">gv")
imap("jk", "<esc>")
imap("kj", "<esc>")
