local spec = {
  "nvim-lualine/lualine.nvim",
  dependencies = {
    "nvim-tree/nvim-web-devicons",
  },
}

function spec:config()
  local lualine = require("lualine")
  local sources = require("null-ls.sources")

  lualine.setup({
    options = {
      globalstatus = true,
      component_separators = " ",
      section_separators = "",
      theme = {
        normal = {
          a = "StatusLine",
          b = "StatusLine",
          c = "StatusLine",
        },
      },
    },
    sections = {
      lualine_a = {
        {
          "branch",
          icon = vim.g.icons.widget.inline.Fork,
        },
        {
          "diagnostics",
          colored = false,
          always_visible = true,
          sections = { "error", "warn" },
          symbols = {
            warn = vim.g.icons.widget.inline.Warning .. " ",
            error = vim.g.icons.widget.inline.Error .. " ",
          },
        },
      },
      lualine_b = {},
      lualine_c = {},
      lualine_x = {},
      lualine_y = {},
      lualine_z = {
        function() return "Ln %l, Col %c" end,
        function()
          if vim.bo.expandtab then return "Spaces: " .. vim.bo.shiftwidth end
          return "Tabs"
        end,
        function() return vim.go.encoding:upper() end,
        {
          "fileformat",
          symbols = {
            dos = "CRLF",
            mac = "CR",
            unix = "LF",
          },
        },
        function() return vim.bo.filetype:gsub("^%l", string.upper) end,
        function()
          local names = vim.tbl_map(
            function(source) return source.name:gsub("^%l", string.upper) end,
            sources.get_available(vim.bo.filetype)
          )
          vim.list_extend(
            names,
            vim.tbl_map(
              function(client) return client.name:gsub("_", "-") end,
              vim.tbl_filter(
                function(client) return client.name ~= "null-ls" end,
                vim.lsp.get_active_clients({ bufnr = 0 })
              )
            )
          )

          return table.concat(names, " ")
        end,
      },
    },
  })
end

return spec
