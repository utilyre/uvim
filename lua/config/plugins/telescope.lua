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
      prompt_prefix = vim.g.icons.widget.inline.Telescope .. " ",
      selection_caret = vim.g.icons.widget.inline.ArrowRight .. " ",
      multi_icon = vim.g.icons.widget.inline.Check .. " ",
    }),
    pickers = {
      quickfix = {
        theme = "cursor",
        show_line = false,
      },
    },
  })

  local function map(left, right, ...)
    local parameters = { ... }
    vim.keymap.set(
      "n",
      "<leader>f" .. left,
      function() right(unpack(parameters)) end
    )
  end

  map("h", builtin.help_tags)
  map("r", builtin.oldfiles)
  map("f", builtin.find_files)
  map("a", builtin.filetypes)
  map("w", builtin.live_grep)

  vim.api.nvim_create_autocmd("FileType", {
    group = vim.api.nvim_create_augroup("telescope", {}),
    pattern = "qf",
    callback = function(a)
      vim.defer_fn(function()
        vim.api.nvim_buf_delete(a.buf, {})
        builtin.quickfix()
      end, 0)
    end,
  })
end

return spec
