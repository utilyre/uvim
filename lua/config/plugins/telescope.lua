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
      prompt_prefix = vim.g.icons.widget.inline.ChevronRight .. " ",
      selection_caret = "  ",
      mappings = {
        n = {
          ["<tab>"] = "select_default",
        },
        i = {
          ["<tab>"] = "select_default",
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
    },
  })

  local function map(left, right, ...)
    local params = { ... }
    vim.keymap.set("n", left, function() right(unpack(params)) end)
  end

  map("<leader>fr", builtin.resume)
  map("<leader>ft", builtin.filetypes)
  map("<leader>ff", builtin.find_files)
  map("<leader>fw", builtin.live_grep)
end

return spec
