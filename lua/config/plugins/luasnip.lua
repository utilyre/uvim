local spec = {
  "L3MON4D3/LuaSnip",
}

function spec.config()
  local luasnip = require("luasnip")
  local types = require("luasnip.util.types")
  local loader = require("luasnip.loaders.from_lua")

  luasnip.config.setup({
    region_check_events = "CursorMoved",
    ext_opts = {
      [types.choiceNode] = {
        active = {
          virt_text = {
            { "  " },
            {
              " " .. vim.g.icons.kind.Snippet .. " Choice ",
              "CmpItemKindSnippet",
            },
          },
        },
      },
    },
  })

  loader.lazy_load()
end

return spec
