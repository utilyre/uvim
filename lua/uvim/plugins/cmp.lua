local icon = require("uvim.icon")

local spec = {
    "hrsh7th/nvim-cmp",
    main = "cmp",
    dependencies = {
        "nvim-lua/plenary.nvim",
        "L3MON4D3/LuaSnip",
        "hrsh7th/cmp-nvim-lsp",
        "hrsh7th/cmp-buffer",
    },
    event = "InsertEnter",
}

function spec:opts(opts)
    local cmp = require("cmp")
    local luasnip = require("luasnip")

    return vim.tbl_deep_extend("force", opts, {
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
        preselect = "none",
        experimental = {
            ghost_text = true,
        },
        snippet = {
            expand = function(args) luasnip.lsp_expand(args.body) end,
        },
        sources = {
            { name = "nvim_lsp" },
            { name = "buffer" },
        },
        mapping = {
            ["<c-p>"] = cmp.mapping(function(fallback)
                if not cmp.visible() then
                    fallback()
                    return
                end

                cmp.select_prev_item()
            end, { "i", "s" }),
            ["<c-n>"] = cmp.mapping(function()
                if not cmp.visible() then
                    cmp.complete()
                    return
                end

                cmp.select_next_item()
            end, { "i", "s" }),
            ["<c-y>"] = cmp.mapping(function(fallback)
                if cmp.get_selected_entry() == nil then
                    fallback()
                    return
                end

                cmp.confirm()
            end, { "i", "s" }),
            ["<c-u>"] = cmp.mapping(function(fallback)
                if not cmp.visible() then
                    fallback()
                    return
                end

                cmp.scroll_docs(-5)
            end, { "i", "s" }),
            ["<c-d>"] = cmp.mapping(function(fallback)
                if not cmp.visible() then
                    fallback()
                    return
                end

                cmp.scroll_docs(5)
            end, { "i", "s" }),
        },
    })
end

return spec
