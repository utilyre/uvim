local spec = {
  "stevearc/dressing.nvim",
  dependencies = {
    "nvim-telescope/telescope.nvim",
  },
}

function spec.config()
  local dressing = require("dressing")
  local themes = require("telescope.themes")

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
end

return spec
