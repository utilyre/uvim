local spec = {
  "hrsh7th/nvim-cmp",
  event = { "InsertEnter" },
  dependencies = {
    "saadparwaiz1/cmp_luasnip",
    "hrsh7th/cmp-nvim-lsp",
    "nvim-lua/plenary.nvim",
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
        border = "rounded",
      },
      documentation = {
        border = "rounded",
      },
    },
    formatting = {
      fields = { "kind", "abbr" },
      format = function(_, item)
        item.kind = vim.g.icons.kind[item.kind]
        return item
      end,
    },
    sources = {
      {
        name = "luasnip",
        max_item_count = 2,
      },
      {
        name = "nvim_lsp",
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
        cmp.confirm({ behavior = cmp.ConfirmBehavior.Replace })
      end, { "i", "s" }),
    },
  })
end

return spec
