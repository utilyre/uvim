local spec = {
  "utilyre/barbecue.nvim",
  dependencies = {
    "SmiteshP/nvim-navic",
    "nvim-tree/nvim-web-devicons",
  },
}

function spec.config()
  local barbecue = require("barbecue")

  barbecue.setup({
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
      separator = vim.g.icons.layout.Nesting,
    },
  })
end

return spec
