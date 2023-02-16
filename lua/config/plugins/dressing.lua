local spec = {
  "stevearc/dressing.nvim",
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
        if options.prompt ~= "New Name: " then
          return {
            enabled = false,
          }
        end

        options.prompt = options.prompt:gsub(":%s*$", "")
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
end

return spec
