local Binder = require("config.binder")

local lazy_path = vim.fs.normalize(vim.fn.stdpath("data") .. "/lazy/lazy.nvim")
if not vim.loop.fs_access(lazy_path, "R") then
  vim.fn.system({
    "git",
    "clone",
    "--single-branch",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    lazy_path,
  })
end
vim.opt.runtimepath:prepend(lazy_path)

local lazy = require("lazy")

lazy.setup("config.plugins", {
  concurrency = 4,
  defaults = {
    lazy = true,
  },
  install = {
    colorscheme = { "catppuccin", "habamax" },
  },
  dev = {
    path = os.getenv("NVIM_DEV") or vim.fs.normalize("$HOME/Code"),
  },
  performance = {
    rtp = {
      disabled_plugins = {
        "gzip",
        "health",
        "man",
        "matchit",
        "matchparen",
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
      lazy = vim.g.icons.widget.inline.Bed .. "  ",
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
      list = {
        vim.g.icons.layout.List,
        vim.g.icons.layout.List,
        vim.g.icons.layout.List,
        vim.g.icons.layout.List,
      },
    },
  },
})

local binder = Binder.new("n")
binder:clone():desc("Package Home"):bind("<leader>ph", lazy.home)
binder:clone():desc("Package Install"):bind("<leader>pi", lazy.install)
binder:clone():desc("Package Update"):bind("<leader>pu", lazy.update)
binder:clone():desc("Package Sync"):bind("<leader>ps", lazy.sync)
binder:clone():desc("Package Clean"):bind("<leader>px", lazy.clean)
binder:clone():desc("Package Check"):bind("<leader>pc", lazy.check)
binder:clone():desc("Package Log"):bind("<leader>pl", lazy.log)
binder:clone():desc("Package Restore"):bind("<leader>pr", lazy.restore)
binder:clone():desc("Package Profile"):bind("<leader>pp", lazy.profile)
binder:clone():desc("Package Debug"):bind("<leader>pd", lazy.debug)
