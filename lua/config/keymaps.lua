function vim.keymap.gen(mode, opts)
  return function(lhs, rhs, ...)
    if type(rhs) == "function" then
      local callback = rhs
      local params = { ... }
      rhs = function() return callback(unpack(params)) end
    end

    vim.keymap.set(mode, lhs, rhs, opts)
  end
end

local nmap = vim.keymap.gen("n")
local xmap = vim.keymap.gen("x")
local imap = vim.keymap.gen("i")

nmap("<leader>", "<nop>")
nmap("<leader>w", "<cmd>write<cr>")
nmap("<leader>q", "<cmd>quit<cr>")
nmap("<leader>s", "<cmd>split<cr>")
nmap("<leader>v", "<cmd>vsplit<cr>")
nmap("<leader>c", "<cmd>bdelete<cr>")
nmap("<leader>u", "<cmd>nohlsearch<cr>")

nmap("<s-y>", "y$")
nmap("<s-tab>", "<<")
nmap("<tab>", ">>")

xmap("<s-tab>", "<gv")
xmap("<tab>", ">gv")

imap("jk", "<esc>")
imap("kj", "<esc>")
