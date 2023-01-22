local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.fs.exists(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--single-branch",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    lazypath,
  })
end
vim.opt.runtimepath:prepend(lazypath)

local lazy = require("lazy")

lazy.setup("config.plugins", {
  concurrency = 4,
  install = {
    colorscheme = { "tokyonight", "habamax" },
  },
  dev = {
    path = vim.fs.normalize("$NVIM_DEV"),
  },
  performance = {
    rtp = {
      disabled_plugins = {
        "gzip",
        "health",
        "man",
        "matchit",
        "netrwPlugin",
        "rplugin",
        "tarPlugin",
        "tohtml",
        "tutor",
        "zipPlugin",
      },
    },
  },
  ui = {
    border = "rounded",
    icons = {
      not_loaded = vim.g.icons.widget.outline.Circle,
      loaded = vim.g.icons.widget.inline.Circle,
      task = vim.g.icons.widget.inline.Clipboard,
      source = vim.g.icons.widget.inline.Fire,
      start = vim.g.icons.widget.inline.Play,
      plugin = vim.g.icons.widget.inline.Archive,
      event = vim.g.icons.widget.inline.Bolt,
      keys = vim.g.icons.widget.outline.Keyboard,
      cmd = vim.g.icons.widget.inline.Usd,
      ft = vim.g.icons.widget.inline.Code,
      init = vim.g.icons.widget.inline.Flask,
      runtime = vim.g.icons.widget.inline.Vim,
      import = vim.g.icons.widget.inline.PaperClip,
      config = vim.g.icons.widget.inline.Gear,
    },
  },
})

local function map(left, right, ...)
  local parameters = { ... }
  vim.keymap.set("n", left, function() right(unpack(parameters)) end)
end

map("<leader>ph", lazy.home)
map("<leader>pi", lazy.install)
map("<leader>pu", lazy.update)
map("<leader>ps", lazy.sync)
map("<leader>px", lazy.clean)
map("<leader>pc", lazy.check)
map("<leader>pl", lazy.log)
map("<leader>pr", lazy.restore)
map("<leader>pp", lazy.profile)
map("<leader>pd", lazy.debug)
