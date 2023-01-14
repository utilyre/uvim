local spec = {
  "RRethy/vim-illuminate",
  dependencies = {
    "nvim-treesitter/nvim-treesitter",
  },
}

function spec.config()
  local illuminate = require("illuminate")

  illuminate.configure({
    delay = vim.go.updatetime,
    modes_allowlist = { "n" },
    providers = { "lsp", "treesitter" },
  })
end

return spec
