local icons = require("config.icons")

vim.opt.clipboard = "unnamedplus"
vim.opt.writebackup = false
vim.opt.undofile = true

vim.opt.timeout = false
vim.opt.updatetime = 500

vim.opt.termguicolors = true
vim.opt.confirm = true
vim.opt.splitright = true
vim.opt.splitbelow = true
vim.opt.scrolloff = 2
vim.opt.sidescrolloff = 2
vim.opt.shortmess = {
  a = true,
  s = true,
  t = true,
  T = true,
  I = true,
  F = true,
}

vim.opt.colorcolumn = "+1"
vim.opt.signcolumn = "yes"
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.cursorline = true
vim.opt.list = true
vim.opt.listchars = {
  tab = icons.layout.Tab .. "  ",
}
vim.opt.fillchars:append({
  eob = " ",
})

vim.opt.incsearch = true
vim.opt.ignorecase = true
vim.opt.smartcase = true

vim.opt.pumheight = 20
vim.opt.completeopt = {}

vim.opt.wrap = false
vim.opt.expandtab = true
vim.opt.tabstop = 2
vim.opt.shiftwidth = 2
vim.opt.textwidth = 80

vim.opt.spell = true
vim.opt.spelllang:append({ "programming" })
vim.opt.spelloptions:append({ "camel" })

vim.g.mapleader = " "
