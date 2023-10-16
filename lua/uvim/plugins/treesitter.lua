local spec = {
    "nvim-treesitter/nvim-treesitter",
    main = "nvim-treesitter.configs",
    build = ":TSUpdateSync",
    cmd = "TSUpdateSync",
    event = { "BufReadPre", "BufNewFile" },
}

spec.opts = {
    highlight = {
        enable = true,
    },
    indent = {
        enable = true,
    },
}

return spec
