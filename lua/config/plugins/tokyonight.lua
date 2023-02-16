local spec = {
  "folke/tokyonight.nvim",
  priority = 100,
}

function spec.config()
  local tokyonight = require("tokyonight")

  tokyonight.setup({
    style = "night",
    on_highlights = function(highlights, colors)
      highlights["TelescopePromptPrefix"] = { foreground = colors.blue }
      highlights["TelescopeMultiIcon"] = { foreground = colors.green }
      highlights["TelescopeMultiSelection"] = { bold = true }

      highlights["@text.note"] = { bold = true, background = colors.blue2 }
      highlights["@text.todo"] = { bold = true, background = colors.green1 }
      highlights["@text.warning"] = { bold = true, background = colors.yellow }
      highlights["@text.danger"] = { bold = true, background = colors.red1 }
    end,
  })

  tokyonight.load()
end

return spec
