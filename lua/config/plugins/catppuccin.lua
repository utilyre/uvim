local spec = {
  "catppuccin/nvim",
  name = "catppuccin.nvim",
  priority = 1000,
}

function spec:config()
  local catppuccin = require("catppuccin")
  local utils = require("catppuccin.utils.colors")

  catppuccin.setup({
    flavour = "mocha",
    custom_highlights = function(colors)
      return {
        ["DiagnosticLineError"] = {
          bg = utils.darken(colors.red, 0.095, colors.base),
        },
        ["DiagnosticLineWarn"] = {
          bg = utils.darken(colors.yellow, 0.095, colors.base),
        },
        ["DiagnosticLineInfo"] = {
          bg = utils.darken(colors.sky, 0.095, colors.base),
        },
        ["DiagnosticLineHint"] = {
          bg = utils.darken(colors.teal, 0.095, colors.base),
        },

        ["debugPC"] = {
          fg = colors.yellow,
          bg = colors.none,
        },
        ["debugBreakpoint"] = {
          fg = colors.red,
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
