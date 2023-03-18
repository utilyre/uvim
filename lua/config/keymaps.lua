function vim.mapper(mode, opts)
  return function(lhs, rhs, ...)
    local params = { ... }
    vim.keymap.set(
      mode,
      lhs,
      type(rhs) == "function" and function() return rhs(unpack(params)) end
        or rhs,
      opts
    )
  end
end

local nmap = vim.mapper("n")
local xmap = vim.mapper("x")
local imap = vim.mapper("i")

nmap("<leader>", "<nop>")
nmap("<leader>w", "<cmd>write<cr>")
nmap("<leader>q", "<cmd>quit<cr>")
nmap("<leader>s", "<cmd>split<cr>")
nmap("<leader>v", "<cmd>vsplit<cr>")
nmap("<leader>u", "<cmd>nohlsearch<cr>")

nmap("<s-y>", "y$")
nmap("<s-tab>", "<<")
nmap("<tab>", ">>")

xmap("<s-tab>", "<gv")
xmap("<tab>", ">gv")

imap("jk", "<esc>")
imap("kj", "<esc>")
