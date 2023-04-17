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
  tab = icons.layout.tab .. "  ",
}
vim.opt.fillchars:append({
  eob = " ",
})

vim.opt.linebreak = true
vim.opt.showbreak = icons.layout.wrap .. " "
vim.opt.breakat:remove({ "-" })
vim.opt.iskeyword:append({ "-" })

vim.opt.incsearch = true
vim.opt.ignorecase = true
vim.opt.smartcase = true

vim.opt.pumheight = 20
vim.opt.completeopt = {}

vim.opt.expandtab = true
vim.opt.tabstop = 2
vim.opt.shiftwidth = 2
vim.opt.textwidth = 80

vim.opt.spell = true
vim.opt.spelllang:append({ "programming" })
vim.opt.spelloptions:append({ "camel" })

vim.g.mapleader = " "

vim.api.nvim_create_autocmd({ "TermOpen" }, {
  group = vim.api.nvim_create_augroup("config.opts.terminal", {}),
  callback = function()
    vim.opt_local.scrolloff = 0
    vim.opt_local.number = false
    vim.opt_local.relativenumber = false
    vim.opt_local.spell = false
  end,
})
