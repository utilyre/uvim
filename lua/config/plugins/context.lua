local spec = {
  "nvim-treesitter/nvim-treesitter-context",
  dependencies = {
    "nvim-treesitter/nvim-treesitter",
  },
}

function spec.config()
  local context = require("treesitter-context")

  context.setup({
    mode = "topline",
  })
end

return spec
