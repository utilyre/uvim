local spec = {
  "catppuccin/nvim",
  name = "catppuccin.nvim",
  lazy = false,
  priority = 10000,
}

function spec:config()
  local catppuccin = require("catppuccin")

  catppuccin.setup({
    flavour = "mocha",
  })

  catppuccin.load()
end

return spec
