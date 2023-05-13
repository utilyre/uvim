local icons = require("config.icons")

local spec = {
  "utilyre/barbecue.nvim",
  dependencies = {
    "SmiteshP/nvim-navic",
    "nvim-tree/nvim-web-devicons",
  },
  event = {
    "BufReadPre",
    "BufNewFile",
  },
}

function spec:config()
  local barbecue = require("barbecue")
  local ui = require("barbecue.ui")

  barbecue.setup({
    create_autocmd = false,
    show_modified = true,
    kinds = icons.kind,
    symbols = {
      separator = icons.widget.nesting,
    },
  })

  vim.api.nvim_create_autocmd({
    "BufReadPre",
    "BufNewFile",
    "CursorHold",
    "InsertLeave",
    "BufModifiedSet",
  }, {
    group = vim.api.nvim_create_augroup("config.plugins.barbecue.updater", {}),
    callback = function() ui.update() end,
  })
end

return spec
