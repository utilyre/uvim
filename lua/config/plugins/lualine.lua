local spec = {
  "nvim-lualine/lualine.nvim",
  dependencies = {
    "folke/noice.nvim",
    "jose-elias-alvarez/null-ls.nvim",
    "nvim-tree/nvim-web-devicons",
  },
}

function spec.config()
  local lualine = require("lualine")
  local noice = require("noice")
  local sources = require("null-ls.sources")

  lualine.setup({
    options = {
      globalstatus = true,
      component_separators = vim.g.icons.layout.Separator,
      section_separators = {
        left = vim.g.icons.layout.SectionRight,
        right = vim.g.icons.layout.SectionLeft,
      },
    },
    sections = {
      lualine_a = {
        {
          function() return vim.g.icons.widget.outline.Moon end,
          separator = {
            left = vim.g.icons.layout.SectionLeft,
            right = vim.g.icons.layout.SectionRight,
          },
        },
      },
      lualine_b = {
        {
          "branch",
        },
        {
          "diff",
          symbols = {
            added = vim.g.icons.git.Added,
            modified = vim.g.icons.git.Modified,
            removed = vim.g.icons.git.Deleted,
          },
        },
        {
          "diagnostics",
          update_in_insert = true,
          symbols = {
            hint = vim.g.icons.widget.inline.Hint .. " ",
            info = vim.g.icons.widget.inline.Info .. " ",
            warn = vim.g.icons.widget.inline.Warn .. " ",
            error = vim.g.icons.widget.inline.Error .. " ",
          },
        },
      },
      lualine_c = {
        {
          function()
            if not noice.api.statusline.mode.has() then return "" end
            return noice.api.statusline.mode.get_hl()
          end,
        },
      },
      lualine_x = {
        {
          function()
            if not noice.api.statusline.search.has() then return "" end
            return noice.api.statusline.search.get_hl()
          end,
        },
      },
      lualine_y = {
        {
          function()
            local names = table.unique(
              table.merge(
                table.map(
                  table.filter(
                    vim.lsp.get_active_clients({
                      bufnr = vim.api.nvim_get_current_buf(),
                    }),
                    function(client) return client.name ~= "null-ls" end
                  ),
                  function(client) return client.name end
                ),
                table.map(
                  sources.get_available(vim.bo.filetype),
                  function(source) return source.name end
                )
              )
            )

            return table.concat(names, " ")
          end,
        },
        {
          "filetype",
        },
        {
          function()
            if not vim.bo.expandtab then return "" end
            return vim.g.icons.widget.inline.AlignLeft
              .. " "
              .. vim.bo.shiftwidth
          end,
        },
      },
      lualine_z = {
        {
          "location",
          separator = {
            left = vim.g.icons.layout.SectionLeft,
            right = vim.g.icons.layout.SectionRight,
          },
        },
      },
    },
  })
end

return spec
