local Binder = require("config.binder")

local spec = {
  "L3MON4D3/LuaSnip",
  lazy = true,
}

function spec:config()
  local luasnip = require("luasnip")
  local loader = require("luasnip.loaders.from_lua")

  luasnip.config.setup({
    region_check_events = "CursorMoved",
  })

  loader.lazy_load()

  local binder = Binder.new({ "i", "s" })
  binder:clone():desc("Previous Region"):bind("<c-k>", luasnip.jump, -1)
  binder:clone():desc("Next Region"):bind("<c-j>", luasnip.jump, 1)
end

return spec
