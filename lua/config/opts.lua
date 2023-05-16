local icons = require("config.icons")

vim.opt.clipboard = "unnamedplus"
vim.opt.undofile = true

vim.opt.timeout = false
vim.opt.updatetime = 400

vim.opt.termguicolors = true
vim.opt.confirm = true
vim.opt.scrolloff = 2
vim.opt.sidescrolloff = 2
vim.opt.shortmess = {
  a = true,
  I = true,
  F = true,
}

vim.opt.colorcolumn = "+1"
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.list = true
vim.opt.listchars = { tab = icons.layout.tab .. "  " }
vim.opt.fillchars:append({ eob = " " })

vim.opt.linebreak = true
vim.opt.showbreak = icons.layout.wrap .. " "

vim.opt.incsearch = false
vim.opt.ignorecase = true
vim.opt.smartcase = true

vim.opt.pumheight = 20
vim.opt.complete = {}

vim.opt.expandtab = true
vim.opt.tabstop = 2
vim.opt.shiftwidth = 2
vim.opt.textwidth = 80

vim.opt.spell = true
vim.opt.spelllang:append({ "programming" })
vim.opt.spelloptions:append({ "camel" })

vim.g.mapleader = " "
