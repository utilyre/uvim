local icons = require("config.icons")

local spec = {
  "nvim-lualine/lualine.nvim",
  event = { "VeryLazy" },
  dependencies = {
    "nvim-tree/nvim-web-devicons",
  },
}

function spec:config()
  local lualine = require("lualine")

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
          icon = icons.widget.Fork,
        },
        {
          "diagnostics",
          colored = false,
          always_visible = true,
          sections = { "error", "warn" },
          symbols = {
            warn = icons.widget.Warning .. " ",
            error = icons.widget.Error .. " ",
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
        {
          "filetype",
          colored = false,
        },
        {
          function()
            return vim.lsp.buf.server_ready() and icons.widget.HeartBeat or ""
          end,
          padding = {
            right = 2,
          },
        },
      },
    },
  })
end

return spec
