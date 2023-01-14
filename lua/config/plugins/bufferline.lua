local spec = {
  "akinsho/bufferline.nvim",
  dependencies = {
    "nvim-tree/nvim-web-devicons",
  },
}

function spec.config()
  local bufferline = require("bufferline")

  bufferline.setup({
    options = {
      show_close_icon = false,
      show_buffer_close_icons = false,
      left_trunc_marker = vim.g.icons.layout.Truncation,
      right_trunc_marker = vim.g.icons.layout.Truncation,
    },
  })

  local function map(left, right, ...)
    local parameters = { ... }
    vim.keymap.set("n", left, function() right(unpack(parameters)) end)
  end

  map("<s-h>", bufferline.cycle, -1)
  map("<s-l>", bufferline.cycle, 1)
end

return spec
