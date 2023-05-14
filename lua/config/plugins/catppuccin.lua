local spec = {
  "catppuccin/nvim",
  name = "catppuccin.nvim",
  priority = 10000,
}

function spec:config()
  local catppuccin = require("catppuccin")
  local utils = require("catppuccin.utils.colors")

  catppuccin.setup({
    flavour = "mocha",
    custom_highlights = function(colors)
      return {
        ["DapBreakpoint"] = {
          bg = utils.darken(colors.red, 0.095, colors.base),
        },
        ["DapStopped"] = {
          bg = utils.darken(colors.yellow, 0.095, colors.base),
        },
        ["CmpItemMenu"] = {
          fg = colors.overlay0,
        },
      }
    end,
    integrations = {
      barbecue = {
        bold_basename = false,
        dim_context = true,
      },
    },
  })

  catppuccin.load()
end

return spec
