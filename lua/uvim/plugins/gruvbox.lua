local spec = {
    "ellisonleao/gruvbox.nvim",
    priority = 100,
}

function spec:config()
    local gruvbox = require("gruvbox")

    gruvbox.setup({
        overrides = {
            ["TelescopeNormal"] = { link = "NormalFloat" },
        },
    })

    gruvbox.load()
end

return spec
