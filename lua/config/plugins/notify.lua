local spec = {
  "rcarriga/nvim-notify",
}

function spec.config()
  local notify = require("notify")

  notify.setup({
    stages = "fade",
    top_down = false,
    icons = {
      INFO = vim.g.icons.widget.inline.Info,
      WARN = vim.g.icons.widget.inline.Warn,
      ERROR = vim.g.icons.widget.inline.Error,
    },
  })
end

return spec
