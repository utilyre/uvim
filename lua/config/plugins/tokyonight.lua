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

      highlights["@text.note"] = { bold = true, foreground = colors.blue2 }
      highlights["@text.todo"] = { bold = true, foreground = colors.magenta }
      highlights["@text.warning"] = { bold = true, foreground = colors.yellow }
      highlights["@text.danger"] = { bold = true, foreground = colors.red1 }
      highlights["@tag.attribute"] =
        { italic = true, foreground = colors.green1 }

      highlights["LspCodeLensSeparator"] = { foreground = colors.comment }
    end,
  })

  tokyonight.load()
end

return spec
