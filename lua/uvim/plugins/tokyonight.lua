local spec = {
  "folke/tokyonight.nvim",
  priority = 1000,
}

function spec:config()
  local tokyonight = require("tokyonight")

  tokyonight.setup({
    style = "night",
    on_highlights = function(highlights, colors)
      highlights["DiagnosticLineError"] = highlights["DiagnosticVirtualTextError"]
      highlights["DiagnosticLineWarn"] = highlights["DiagnosticVirtualTextWarn"]
      highlights["DiagnosticLineInfo"] = highlights["DiagnosticVirtualTextInfo"]
      highlights["DiagnosticLineHint"] = highlights["DiagnosticVirtualTextHint"]
    end,
  })

  tokyonight.load()
end

return spec
