local spec = {
  "ggandor/leap.nvim",
  dependencies = {
    "tpope/vim-repeat",
  },
}

function spec.config()
  local leap = require("leap")

  leap.add_default_mappings()
end

return spec
