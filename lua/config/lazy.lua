local Binder = require("config.binder")
local icons = require("config.icons")

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
      lazy = icons.widget.inline.Bed .. "  ",
      not_loaded = icons.widget.outline.Circle,
      loaded = icons.widget.inline.Circle,
      task = icons.widget.inline.Clipboard,
      source = icons.widget.inline.Fire,
      start = icons.widget.inline.Play,
      plugin = icons.widget.inline.Archive,
      event = icons.widget.inline.Bolt,
      keys = icons.widget.outline.Keyboard,
      cmd = icons.widget.inline.Usd,
      ft = icons.widget.inline.Code,
      init = icons.widget.inline.Flask,
      runtime = icons.widget.inline.Vim,
      import = icons.widget.inline.PaperClip,
      config = icons.widget.inline.Gear,
      list = {
        icons.layout.List,
        icons.layout.List,
        icons.layout.List,
        icons.layout.List,
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
