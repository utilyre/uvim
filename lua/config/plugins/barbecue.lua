local spec = {
  "utilyre/barbecue.nvim",
  dependencies = {
    "SmiteshP/nvim-navic",
    "nvim-tree/nvim-web-devicons",
  },
}

function spec.config()
  local barbecue = require("barbecue")
  local ui = require("barbecue.ui")

  barbecue.setup({
    create_autocmd = false,
    show_modified = true,
    custom_section = function(bufnr)
      return (
        vim.bo[bufnr].readonly
          and "%#Error#" .. vim.g.icons.widget.inline.Lock
        or ""
      ) .. " "
    end,
    kinds = vim.g.icons.kind,
    symbols = {
      ellipsis = vim.g.icons.layout.Truncation,
      separator = vim.g.icons.widget.inline.AngleRight,
      modified = vim.g.icons.layout.Modified,
    },
  })

  vim.api.nvim_create_autocmd({
    "WinEnter",
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
