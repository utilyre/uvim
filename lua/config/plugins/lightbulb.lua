local spec = {
  "kosayoda/nvim-lightbulb",
}

function spec.config()
  local lightbulb = require("nvim-lightbulb")

  lightbulb.setup({
    autocmd = {
      enabled = true,
      events = { "CursorHold", "InsertLeave" },
    },
  })

  vim.fn.sign_define("LightBulbSign", {
    text = vim.g.icons.widget.outline.Lightbulb,
    texthl = "DiagnosticSignInfo",
  })
end

return spec
