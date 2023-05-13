local icons = require("config.icons")

local spec = {
  "hrsh7th/nvim-cmp",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "L3MON4D3/LuaSnip",
    "hrsh7th/cmp-nvim-lsp",
    "hrsh7th/cmp-buffer",
  },
  event = {
    "InsertEnter",
  },
}

function spec:config()
  local cmp = require("cmp")
  local luasnip = require("luasnip")

  cmp.setup({
    snippet = {
      expand = function(opts) luasnip.lsp_expand(opts.body) end,
    },
    experimental = {
      ghost_text = true,
    },
    window = {
      completion = {
        scrolloff = vim.go.scrolloff,
      },
      documentation = {
        border = "rounded",
      },
    },
    formatting = {
      fields = { "kind", "abbr", "menu" },
      format = function(_, item)
        local kind = item.kind
        item.kind = icons.kind[kind]
        item.menu = kind:gsub("(%l)(%u)", "%1 %2"):lower()

        return item
      end,
    },
    sources = {
      {
        name = "nvim_lsp",
        max_item_count = 80,
      },
      {
        name = "buffer",
        max_item_count = 20,
        option = {
          get_bufnrs = function()
            return vim.tbl_map(
              function(win) return vim.api.nvim_win_get_buf(win) end,
              vim.api.nvim_list_wins()
            )
          end,
        },
      },
    },
    mapping = {
      ["<c-space>"] = cmp.mapping(function()
        if not cmp.visible() then cmp.complete() end
        cmp.abort()
      end, { "i", "s" }),
      ["<c-y>"] = cmp.mapping(function(fallback)
        if not cmp.visible() then fallback() end
        cmp.scroll_docs(-1)
      end, { "i", "s" }),
      ["<c-e>"] = cmp.mapping(function(fallback)
        if not cmp.visible() then fallback() end
        cmp.scroll_docs(1)
      end, { "i", "s" }),
      ["<s-tab>"] = cmp.mapping(function(fallback)
        if not cmp.visible() then fallback() end
        cmp.select_prev_item()
      end, { "i", "s" }),
      ["<tab>"] = cmp.mapping(function(fallback)
        if not cmp.visible() then fallback() end
        cmp.select_next_item()
      end, { "i", "s" }),
      ["<cr>"] = cmp.mapping(function(fallback)
        if cmp.get_selected_entry() == nil then fallback() end
        cmp.confirm()
      end, { "i", "s" }),
      ["<c-p>"] = cmp.mapping(function(fallback)
        if not luasnip.jumpable(-1) then fallback() end
        luasnip.jump(-1)
      end, { "i", "s" }),
      ["<c-n>"] = cmp.mapping(function(fallback)
        if not luasnip.jumpable(1) then fallback() end
        luasnip.jump(1)
      end, { "i", "s" }),
    },
  })
end

return spec
