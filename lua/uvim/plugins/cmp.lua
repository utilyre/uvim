local icon = require("uvim.icon")

local spec = {
  "hrsh7th/nvim-cmp",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "L3MON4D3/LuaSnip",
    "hrsh7th/cmp-nvim-lsp",
    "hrsh7th/cmp-buffer",
  },
  event = { "InsertEnter" },
}

function spec:config()
  local cmp = require("cmp")
  local luasnip = require("luasnip")

  cmp.setup({
    view = {
      entries = {
        selection_order = "near_cursor",
      },
    },
    window = {
      completion = {
        col_offset = -2,
        scrolloff = vim.go.scrolloff,
      },
    },
    formatting = {
      fields = { "kind", "abbr", "menu" },
      format = function(_, item)
        local kind = item.kind
        item.kind = icon.kind[kind]
        item.menu = kind:gsub("(%l)(%u)", "%1 %2"):lower()

        return item
      end,
    },
    preselect = "none",
    experimental = {
      ghost_text = true,
    },
    snippet = {
      expand = function(opts) luasnip.lsp_expand(opts.body) end,
    },
    sources = {
      { name = "nvim_lsp" },
      { name = "buffer" },
    },
    mapping = {
      ["<c-space>"] = cmp.mapping(function(fallback)
        if not cmp.visible() then
          fallback()
          return
        end

        cmp.abort()
      end, { "i", "s" }),
      ["<c-y>"] = cmp.mapping(function(fallback)
        if not cmp.visible() then
          fallback()
          return
        end

        cmp.scroll_docs(-1)
      end, { "i", "s" }),
      ["<c-e>"] = cmp.mapping(function(fallback)
        if not cmp.visible() then
          fallback()
          return
        end

        cmp.scroll_docs(1)
      end, { "i", "s" }),
      ["<s-tab>"] = cmp.mapping(function(fallback)
        if not cmp.visible() then
          fallback()
          return
        end

        cmp.select_prev_item()
      end, { "i", "s" }),
      ["<tab>"] = cmp.mapping(function(fallback)
        if not cmp.visible() then
          fallback()
          return
        end

        cmp.select_next_item()
      end, { "i", "s" }),
      ["<cr>"] = cmp.mapping(function(fallback)
        if cmp.get_selected_entry() == nil then
          fallback()
          return
        end

        cmp.confirm()
      end, { "i", "s" }),
      ["<c-p>"] = cmp.mapping(function(fallback)
        if not luasnip.jumpable(-1) then
          fallback()
          return
        end

        luasnip.jump(-1)
      end, { "i", "s" }),
      ["<c-n>"] = cmp.mapping(function(fallback)
        if not luasnip.jumpable(1) then
          fallback()
          return
        end

        luasnip.jump(1)
      end, { "i", "s" }),
    },
  })
end

return spec
