local spec = {
  "hrsh7th/nvim-cmp",
  dependencies = {
    "saadparwaiz1/cmp_luasnip",
    "hrsh7th/cmp-nvim-lsp",
    "petertriho/cmp-git",
    "hrsh7th/cmp-emoji",
    "L3MON4D3/LuaSnip",
  },
}

function spec.config()
  local cmp = require("cmp")
  local git = require("cmp_git")
  local luasnip = require("luasnip")

  cmp.setup({
    snippet = {
      expand = function(options) luasnip.lsp_expand(options.body) end,
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
        group_index = 1,
        name = "luasnip",
        max_item_count = 2,
      },
      {
        group_index = 1,
        name = "nvim_lsp",
      },
      {
        group_index = 2,
        name = "git",
      },
      {
        group_index = 3,
        name = "emoji",
      },
    },
    mapping = {
      ["<c-space>"] = cmp.mapping(function()
        if cmp.visible() then
          cmp.abort()
        else
          cmp.complete()
        end
      end, { "i", "s" }),
      ["<c-y>"] = cmp.mapping(function(fallback)
        if cmp.visible() then
          cmp.scroll_docs(-1)
        else
          fallback()
        end
      end, { "i", "s" }),
      ["<c-e>"] = cmp.mapping(function(fallback)
        if cmp.visible() then
          cmp.scroll_docs(1)
        else
          fallback()
        end
      end, { "i", "s" }),
      ["<c-p>"] = cmp.mapping(function(fallback)
        if cmp.visible() then
          cmp.select_prev_item()
        else
          fallback()
        end
      end, { "i", "s" }),
      ["<c-n>"] = cmp.mapping(function(fallback)
        if cmp.visible() then
          cmp.select_next_item()
        else
          fallback()
        end
      end, { "i", "s" }),
      ["<s-tab>"] = cmp.mapping(function(fallback)
        if luasnip.jumpable(-1) then
          luasnip.jump(-1)
        else
          fallback()
        end
      end, { "i", "s" }),
      ["<tab>"] = cmp.mapping(function(fallback)
        if cmp.visible() then
          cmp.confirm({ select = true })
        elseif luasnip.jumpable(1) then
          luasnip.jump(1)
        else
          fallback()
        end
      end, { "i", "s" }),
    },
  })

  git.setup()
end

return spec
