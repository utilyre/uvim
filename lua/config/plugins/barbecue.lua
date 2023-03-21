local spec = {
  "utilyre/barbecue.nvim",
  event = { "BufWinEnter" },
  dependencies = {
    "SmiteshP/nvim-navic",
    "nvim-tree/nvim-web-devicons",
  },
}

function spec:config()
  local barbecue = require("barbecue")
  local ui = require("barbecue.ui")

  barbecue.setup({
    create_autocmd = false,
    show_modified = true,
    kinds = vim.g.icons.kind,
    symbols = {
      separator = vim.g.icons.widget.inline.AngleRight,
    },
  })

  vim.api.nvim_create_autocmd({
    "BufWinEnter",
    "CursorHold",
    "InsertLeave",
    "BufWritePost",
    "TextChanged",
    "TextChangedI",
  }, {
    group = vim.api.nvim_create_augroup("config.plugins.barbecue.updater", {}),
    callback = function() ui.update() end,
  })
end

return spec
