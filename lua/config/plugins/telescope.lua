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
  local actions = require("telescope.actions")
  local builtin = require("telescope.builtin")

  telescope.setup({
    defaults = vim.tbl_deep_extend("force", themes.get_dropdown(), {
      prompt_prefix = vim.g.icons.widget.inline.ChevronRight .. " ",
      selection_caret = "  ",
      multi_icon = vim.g.icons.widget.inline.Check .. " ",
      mappings = {
        n = {
          ["<space>"] = {
            actions.select_default,
            type = "action",
            opts = {
              nowait = true,
            },
          },
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
        initial_mode = "normal",
        mappings = {
          n = {
            ["dd"] = {
              actions.delete_buffer,
              type = "action",
            },
          },
        },
      },
    },
  })

  local function map(left, right, ...)
    local parameters = { ... }
    vim.keymap.set("n", left, function() right(unpack(parameters)) end)
  end

  map("<leader>fr", builtin.resume)
  map("<leader>ft", builtin.filetypes)
  map("<leader>ff", builtin.find_files)
  map("<leader>fw", builtin.live_grep)
  map("<leader><space>", builtin.buffers)
end

return spec
