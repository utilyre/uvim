local spec = {
  "nvim-treesitter/nvim-treesitter",
}

function spec.config()
  local treesitter = require("nvim-treesitter.configs")

  treesitter.setup({
    highlight = {
      enable = true,
    },
    indent = {
      enable = true,
    },
  })
end

return spec
