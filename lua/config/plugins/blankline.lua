local spec = {
  "lukas-reineke/indent-blankline.nvim",
  dependencies = {
    "nvim-treesitter/nvim-treesitter",
  },
}

function spec.config()
  local blankline = require("indent_blankline")

  blankline.setup({
    use_treesitter = true,
    show_current_context = true,
    show_trailing_blankline_indent = false,
  })
end

return spec
