local icon = require("uvim.icon")

vim.diagnostic.config({
    severity_sort = true,
    float = {
        source = true,
        scope = "cursor",
        header = "",
        prefix = icon.layout.list .. " ",
        suffix = " ",
    },
})

vim.keymap.set(
    "n",
    "[g",
    function() vim.diagnostic.goto_prev({ float = false }) end
)
vim.keymap.set(
    "n",
    "]g",
    function() vim.diagnostic.goto_next({ float = false }) end
)
vim.keymap.set("n", "<space>g", vim.diagnostic.open_float)
