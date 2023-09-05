local spec = {
  "folke/tokyonight.nvim",
  priority = 1000,
}

function spec:config()
  local tokyonight = require("tokyonight")

  tokyonight.setup({
    style = "night",
    on_highlights = function(highlights)
      highlights["DiagnosticLineError"] =
        { bg = highlights["DiagnosticVirtualTextError"].bg }
      highlights["DiagnosticLineWarn"] =
        { bg = highlights["DiagnosticVirtualTextWarn"].bg }
      highlights["DiagnosticLineInfo"] =
        { bg = highlights["DiagnosticVirtualTextInfo"].bg }
      highlights["DiagnosticLineHint"] =
        { bg = highlights["DiagnosticVirtualTextHint"].bg }
    end,
  })

  tokyonight.load()
end

return spec
