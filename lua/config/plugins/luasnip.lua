local spec = {
  "L3MON4D3/LuaSnip",
  dependencies = {
    "rafamadriz/friendly-snippets",
  },
}

function spec.config()
  local luasnip = require("luasnip")
  local vscode = require("luasnip.loaders.from_vscode")

  luasnip.config.setup({
    region_check_events = "CursorMoved",
  })

  vscode.lazy_load()
end

return spec
