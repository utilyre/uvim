local spec = {
  "nvim-treesitter/nvim-treesitter-context",
  dependencies = {
    "nvim-treesitter/nvim-treesitter",
  },
}

function spec.config()
  local context = require("treesitter-context")

  context.setup()
end

return spec
