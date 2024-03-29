local icon = require("uvim.icon")

vim.opt.undofile = true
vim.opt.clipboard = "unnamedplus"

vim.opt.timeout = false
vim.opt.updatetime = 400

vim.opt.equalalways = false
vim.opt.splitbelow = true
vim.opt.splitright = true

vim.opt.list = true
vim.opt.listchars = { tab = icon.layout.tab .. "  " }
vim.opt.shortmess = {
    a = true,
    F = true,
}

vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.signcolumn = "no"
vim.opt.colorcolumn = "+1"

vim.opt.linebreak = true
vim.opt.scrolloff = 2

vim.opt.confirm = true
vim.opt.ignorecase = true
vim.opt.smartcase = true

vim.opt.pumheight = 20
vim.opt.complete = {}

vim.opt.expandtab = true
vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
