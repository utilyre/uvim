local spec = {
  "nvim-telescope/telescope.nvim",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-tree/nvim-web-devicons",
  },
}

function spec.config()
  local telescope = require("telescope")
  local themes = require("telescope.themes")
  local builtin = require("telescope.builtin")

  telescope.setup({
    defaults = vim.tbl_deep_extend("force", themes.get_dropdown(), {
      path_display = { "truncate" },
      prompt_prefix = vim.g.icons.widget.inline.ChevronRight .. " ",
      selection_caret = "  ",
      mappings = {
        i = {
          ["<s-tab>"] = "move_selection_previous",
          ["<tab>"] = "move_selection_next",
        },
      },
    }),
    pickers = {
      find_files = {
        hidden = true,
      },
      live_grep = {
        disable_coordinates = true,
      },
      buffers = {
        sort_lastused = true,
        mappings = {
          i = {
            ["<c-d>"] = "delete_buffer",
          },
        },
      },
    },
  })

  local map = vim.mapper("n")
  map("<leader>fr", builtin.resume)
  map("<leader>ft", builtin.filetypes)
  map("<leader>ff", builtin.find_files)
  map("<leader>fw", builtin.live_grep)
  map("<leader><space>", builtin.buffers)
end

return spec
