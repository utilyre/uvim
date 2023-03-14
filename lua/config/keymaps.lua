---Generate a helper function to define keymaps.
---
---@param mode string|string[]
---@param opts? table
---@return fun(lhs: string, rhs: string|(fun(): string|nil), ...: any) map
---@return fun(lhs: string) unmap
function vim.mapper(mode, opts)
  local function map(lhs, rhs, ...)
    local params = { ... }
    vim.keymap.set(
      mode,
      lhs,
      type(rhs) == "function" and function() return rhs(unpack(params)) end
        or rhs,
      opts
    )
  end

  local function unmap(lhs) vim.keymap.del(mode, lhs, opts) end

  return map, unmap
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
