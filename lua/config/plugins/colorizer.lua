local spec = {
  "NvChad/nvim-colorizer.lua",
}

function spec.config()
  local colorizer = require("colorizer")

  colorizer.setup({
    filetypes = {},
    buftypes = { "" },
    user_default_options = {
      names = false,
      css_fn = true,
    },
  })
end

return spec
