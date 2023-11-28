local icon = require("uvim.icon")

local spec = {
    "hrsh7th/nvim-cmp",
    dependencies = {
        "nvim-lua/plenary.nvim",
        "L3MON4D3/LuaSnip",
        "hrsh7th/cmp-nvim-lsp",
        "hrsh7th/cmp-buffer",
    },
    event = "InsertEnter",
}

function spec:opts(opts)
    local luasnip = require("luasnip")

    return vim.tbl_deep_extend("force", opts, {
        snippet = {
            expand = function(args) luasnip.lsp_expand(args.body) end,
        },
        sources = {
            { name = "nvim_lsp" },
            { name = "buffer" },
        },
        view = {
            entries = {
                selection_order = "near_cursor",
            },
        },
        window = {
            completion = {
                col_offset = -2,
                scrolloff = vim.go.scrolloff,
            },
        },
        formatting = {
            fields = { "kind", "abbr", "menu" },
            format = function(_, item)
                local kind = item.kind
                item.kind = icon.kind[kind]
                item.menu = kind:gsub("(%l)(%u)", "%1 %2"):lower()

                return item
            end,
        },
    })
end

function spec:config(opts)
    local cmp = require("cmp")

    cmp.setup(opts)

    vim.keymap.set({ "i", "s" }, "<c-p>", cmp.select_prev_item)
    vim.keymap.set({ "i", "s" }, "<c-n>", cmp.select_next_item)
    vim.keymap.set({ "i", "s" }, "<c-y>", cmp.confirm)
end

return spec
