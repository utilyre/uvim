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
local ismap = vim.keymap.gen({ "i", "s" })

nmap("<leader>", "<nop>")
nmap("<leader>s", "<cmd>split<cr>")
nmap("<leader>v", "<cmd>vsplit<cr>")
nmap("<leader>t", "<cmd>terminal<cr>")
nmap("<leader>c", "<cmd>bdelete<cr>")
nmap("<leader>u", "<cmd>nohlsearch<cr>")

nmap("<s-y>", "y$")
ismap("jk", "<esc>")
ismap("kj", "<esc>")
