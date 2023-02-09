local spec = {
  "folke/tokyonight.nvim",
  priority = 100,
}

function spec.config()
  local tokyonight = require("tokyonight")

  tokyonight.setup({
    style = "night",
    on_colors = function(colors) colors.bg_statusline = colors.none end,
    on_highlights = function(highlights, colors)
      highlights["TelescopeSelectionCaret"] =
        { foreground = colors.teal, background = colors.bg_visual }
      highlights["TelescopeMultiIcon"] = { foreground = colors.green }
      highlights["TelescopeMultiSelection"] = { bold = true }

      highlights["@text.note"] = { foreground = colors.blue2 }
      highlights["@text.todo"] = { foreground = colors.green1 }
      highlights["@text.warning"] = { foreground = colors.yellow }
      highlights["@text.danger"] = { foreground = colors.red1 }
    end,
  })

  tokyonight.load()
end

return spec
