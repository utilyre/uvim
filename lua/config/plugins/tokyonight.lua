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
        { background = colors.bg_visual, foreground = colors.teal }
      highlights["TelescopeMultiIcon"] = { foreground = colors.green }
      highlights["TelescopeMultiSelection"] = { bold = true }

      highlights["@text.note"] =
        { background = colors.blue2, foreground = colors.bg, bold = true }
      highlights["@text.todo"] =
        { background = colors.magenta, foreground = colors.bg, bold = true }
      highlights["@text.warning"] =
        { background = colors.yellow, foreground = colors.bg, bold = true }
      highlights["@text.danger"] =
        { background = colors.red1, foreground = colors.bg, bold = true }
      highlights["@tag.attribute"] =
        { foreground = colors.green1, italic = true }
    end,
  })

  tokyonight.load()
end

return spec
