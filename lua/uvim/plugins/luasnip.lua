local spec = {
    "L3MON4D3/LuaSnip",
    lazy = true,
}

spec.opts = {
    region_check_events = "CursorMoved"
}

function spec:config(opts)
    local luasnip = require("luasnip")

    luasnip.setup(opts)

    vim.keymap.set({ "i", "s" }, "<s-tab>", function()
        if not luasnip.jumpable(-1) then return "<s-tab>" end
        luasnip.jump(-1)
    end, { expr = true })
    vim.keymap.set({ "i", "s" }, "<tab>", function()
        if not luasnip.jumpable(1) then return "<tab>" end
        luasnip.jump(1)
    end, { expr = true })
end

return spec
