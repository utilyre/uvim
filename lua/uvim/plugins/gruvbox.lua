local spec = {
    "ellisonleao/gruvbox.nvim",
    priority = 100,
}

spec.opts = {
    contrast = "hard",
}

function spec:config(opts)
    local gruvbox = require("gruvbox")

    gruvbox.setup(opts)
    gruvbox.load()
end

return spec
