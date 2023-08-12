local Binder = require("config.Binder")
local icon = require("config.icon")

local lazy_path = vim.fs.joinpath(vim.fn.stdpath("data"), "lazy", "lazy.nvim")
if not vim.loop.fs_access(lazy_path, "R") then
  vim.system({
    "git",
    "clone",
    "--single-branch",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    lazy_path,
  })
end
vim.opt.runtimepath:prepend({ lazy_path })

local lazy = require("lazy")

lazy.setup("config.plugins", {
  concurrency = 4,
  install = {
    colorscheme = { "catppuccin", "habamax" },
  },
  dev = {
    path = vim.env.NVIM_DEV,
  },
  performance = {
    rtp = {
      disabled_plugins = {
        "gzip",
        "health",
        "man",
        "matchit",
        "matchparen",
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
      lazy = icon.widget.lazy .. "  ",
      not_loaded = icon.widget.inactive,
      loaded = icon.widget.active,
      task = icon.widget.task,
      source = icon.widget.source,
      start = icon.widget.start,
      plugin = icon.widget.plugin,
      event = icon.widget.event,
      keys = icon.widget.keymap,
      cmd = icon.widget.command,
      ft = icon.widget.filetype,
      init = icon.widget.config,
      runtime = icon.widget.runtime,
      import = icon.widget.import,
      config = icon.widget.config,
      list = {
        icon.layout.list,
        icon.layout.list,
        icon.layout.list,
        icon.layout.list,
      },
    },
  },
})

local binder = Binder.new():with_modes({ "n" })
binder:bind("<leader>ph", lazy.home)
binder:bind("<leader>pi", lazy.install)
binder:bind("<leader>pu", lazy.update)
binder:bind("<leader>ps", lazy.sync)
binder:bind("<leader>px", lazy.clean)
binder:bind("<leader>pc", lazy.check)
binder:bind("<leader>pl", lazy.log)
binder:bind("<leader>pr", lazy.restore)
binder:bind("<leader>pp", lazy.profile)
binder:bind("<leader>pd", lazy.debug)
