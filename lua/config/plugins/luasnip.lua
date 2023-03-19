local spec = {
  "L3MON4D3/LuaSnip",
}

function spec:config()
  local luasnip = require("luasnip")
  local loader = require("luasnip.loaders.from_lua")

  luasnip.config.setup({
    region_check_events = "CursorMoved",
  })

  loader.lazy_load()

  local map = vim.keymap.gen({ "i", "s" })
  map("<c-k>", luasnip.jump, -1)
  map("<c-j>", luasnip.jump, 1)
end

return spec
