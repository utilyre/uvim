local icon = require("uvim.icon")

local lazy_path = vim.fs.joinpath(vim.fn.stdpath("data"), "lazy", "lazy.nvim")
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
vim.opt.runtimepath:prepend({ lazy_path })

local lazy = require("lazy")

lazy.setup("uvim.plugins", {
    concurrency = 4,
    install = {
        colorscheme = { "gruvbox", "habamax" },
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
                "spellfile",
                "tarPlugin",
                "tohtml",
                "tutor",
                "zipPlugin",
            },
        },
    },
    ui = {
        icons = {
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

vim.keymap.set("n", "<space>p", lazy.show)
