local spec = {
  "nvim-lualine/lualine.nvim",
  dependencies = {
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
      component_separators = vim.g.icons.layout.List,
      section_separators = {
        left = "",
        right = "",
      },
    },
    sections = {
      lualine_a = {
        {
          function() return vim.g.icons.widget.outline.Moon end,
        },
      },
      lualine_b = {
        {
          "branch",
          icon = vim.g.icons.widget.inline.Fork,
        },
        {
          "diff",
        },
        {
          "diagnostics",
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
            local clients = vim.tbl_map(
              function(client) return client.name end,
              vim.tbl_filter(
                function(client) return client.name ~= "null-ls" end,
                vim.lsp.get_active_clients()
              )
            )
            local null = vim.tbl_map(
              function(source) return source.name end,
              sources.get_available(vim.bo.filetype)
            )

            return table.concat({ unpack(clients), unpack(null) }, " ")
          end,
        },
        {
          "filetype",
        },
        {
          function()
            if not vim.bo.expandtab then return "" end
            return vim.g.icons.widget.inline.Indent .. " " .. vim.bo.shiftwidth
          end,
        },
      },
      lualine_z = {
        {
          "location",
        },
      },
    },
  })
end

return spec
