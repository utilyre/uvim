local spec = {
  "L3MON4D3/LuaSnip",
}

function spec.config()
  local luasnip = require("luasnip")
  local loader = require("luasnip.loaders.from_lua")

  luasnip.config.setup({
    region_check_events = "CursorMoved",
  })

  loader.lazy_load()

  vim.fn.sign_define("LuasnipSignChoiceNode", {
    text = vim.g.icons.widget.inline.Sort,
    texthl = "LuasnipSignChoiceNode",
  })

  local group = vim.api.nvim_create_augroup("config.plugins.luasnip.sign", {})

  vim.api.nvim_create_autocmd("User", {
    group = group,
    pattern = { "LuasnipChoiceNodeEnter", "LuasnipChangeChoice" },
    callback = function(a)
      vim.fn.sign_place(0, "LuasnipSign", "LuasnipSignChoiceNode", a.buf, {
        lnum = vim.api.nvim_win_get_cursor(vim.api.nvim_get_current_win())[1],
      })
    end,
  })

  vim.api.nvim_create_autocmd("User", {
    group = group,
    pattern = "LuasnipChoiceNodeLeave",
    callback = function(a)
      vim.fn.sign_unplace("LuasnipSign", {
        buffer = a.buf,
      })
    end,
  })
end

return spec
