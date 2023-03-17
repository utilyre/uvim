local spec = {
  "L3MON4D3/LuaSnip",
}

function spec:config()
  local luasnip = require("luasnip")
  local loader = require("luasnip.loaders.from_lua")

  luasnip.config.setup({
    region_check_events = "CursorMoved",
    update_events = "TextChangedI",
  })

  loader.lazy_load()

  local map = vim.mapper({ "i", "s" })
  map("<c-p>", luasnip.jump, -1)
  map("<c-n>", luasnip.jump, 1)
end

return spec
