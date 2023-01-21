local spec = {
  "stevearc/dressing.nvim",
  dependencies = {
    "nvim-telescope/telescope.nvim",
  },
}

function spec.config()
  local dressing = require("dressing")
  local themes = require("telescope.themes")
  local builtin = require("telescope.builtin")

  dressing.setup({
    input = {
      insert_only = false,
      win_options = {
        winblend = 0,
      },
      get_config = function(options)
        if options.prompt == "New Name: " then
          return {
            relative = "cursor",
            anchor = "NW",
            override = function(config)
              return vim.tbl_deep_extend("force", config, {
                row = 1,
                col = 0,
              })
            end,
          }
        end

        return {
          enabled = false,
        }
      end,
    },
    select = {
      backend = { "telescope" },
      get_config = function(options)
        if options.kind == "codeaction" then
          return {
            telescope = themes.get_cursor(),
          }
        end

        return {
          telescope = themes.get_dropdown(),
        }
      end,
    },
  })

  vim.api.nvim_create_autocmd("FileType", {
    group = vim.api.nvim_create_augroup("dressing", {}),
    pattern = "qf",
    callback = function(a)
      vim.schedule(function()
        vim.api.nvim_buf_delete(a.buf, {})
        builtin.quickfix()
      end)
    end,
  })
end

return spec