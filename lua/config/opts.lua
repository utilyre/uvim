local icons = require("config.icons")

vim.opt.termguicolors = true
vim.opt.undofile = true
vim.opt.clipboard = "unnamedplus"

vim.opt.timeout = false
vim.opt.updatetime = 400

vim.opt.equalalways = false
vim.opt.splitbelow = true
vim.opt.splitright = true
vim.opt.scrolloff = 2

vim.opt.list = true
vim.opt.listchars = { tab = icons.layout.tab .. "  " }
vim.opt.fillchars:append({ eob = " " })
vim.opt.shortmess = { a = true }

vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.colorcolumn = "+1"

vim.opt.linebreak = true
vim.opt.breakindent = true
vim.opt.showbreak = icons.layout.wrap .. " "
vim.opt.cursorline = true
vim.opt.cursorlineopt = { "number", "screenline" }

vim.opt.confirm = true
vim.opt.ignorecase = true
vim.opt.smartcase = true

vim.opt.pumheight = 20
vim.opt.complete = {}

vim.opt.expandtab = true
vim.opt.tabstop = 4
vim.opt.shiftwidth = 4

vim.opt.spell = true
vim.opt.spelloptions:append({ "camel" })
vim.opt.spelllang:append({ "programming" })

vim.g.mapleader = " "
