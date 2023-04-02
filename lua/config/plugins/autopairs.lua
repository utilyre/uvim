local spec = {
  "windwp/nvim-autopairs",
  event = { "InsertEnter" },
  dependencies = {
    "nvim-treesitter/nvim-treesitter",
  },
}

function spec:config()
  local autopair = require("nvim-autopairs")

  autopair.setup({
    check_ts = true,
  })
end

return spec
