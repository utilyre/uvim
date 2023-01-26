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

      highlights["@text.note"] = { foreground = colors.blue2, bold = true }
      highlights["@text.todo"] = { foreground = colors.magenta, bold = true }
      highlights["@text.warning"] = { foreground = colors.yellow, bold = true }
      highlights["@text.danger"] = { foreground = colors.red1, bold = true }
      highlights["@tag.attribute"] =
        { foreground = colors.green1, italic = true }

      highlights["LspCodeLensSeparator"] = { foreground = colors.comment }
    end,
  })

  tokyonight.load()
end

return spec
