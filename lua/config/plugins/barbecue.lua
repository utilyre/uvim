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
      separator = vim.g.icons.layout.Nesting,
    },
  })

  vim.api.nvim_create_autocmd({
    "WinScrolled",
    "BufWinEnter",
    "CursorHold",
    "InsertLeave",
  }, {
    group = vim.api.nvim_create_augroup("barbecue", {}),
    callback = function() ui.update() end,
  })
end

return spec
