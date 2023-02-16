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
    end,
  })

  tokyonight.load()
end

return spec
