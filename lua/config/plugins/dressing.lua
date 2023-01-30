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
        if options.prompt ~= "New Name: " then
          return {
            enabled = false,
          }
        end

        return nil
      end,
    },
    select = {
      backend = { "telescope" },
      telescope = themes.get_cursor(),
      get_config = function(options)
        if options.kind ~= "codeaction" then
          return {
            telescope = themes.get_dropdown(),
          }
        end

        return nil
      end,
    },
  })

  vim.api.nvim_create_autocmd("FileType", {
    group = vim.api.nvim_create_augroup("config.plugins.dressing.quickfix", {}),
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
