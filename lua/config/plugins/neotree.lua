local spec = {
  "nvim-neo-tree/neo-tree.nvim",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "MunifTanjim/nui.nvim",
    "nvim-tree/nvim-web-devicons",
  },
}

function spec.config()
  local neotree = require("neo-tree")
  local command = require("neo-tree.command")

  neotree.setup({
    use_default_mappings = false,
    window = {
      mappings = {
        ["<space>"] = "toggle_node",
        ["<cr>"] = "open",
        ["q"] = "close_window",
        ["r"] = "refresh",
        ["d"] = "cut_to_clipboard",
        ["y"] = "copy_to_clipboard",
        ["p"] = "paste_from_clipboard",
        ["c"] = "rename",
        ["x"] = "delete",
        ["a"] = {
          "add",
          config = {
            show_path = "relative",
          },
        },
      },
    },
    source_selector = {
      winbar = true,
      content_layout = "center",
      tab_labels = {
        filesystem = "  Files ",
        buffers = "  Buffers ",
        git_status = "  Git ",
        diagnostics = " 裂Diagnostics ",
      },
    },
    filesystem = {
      filtered_items = {
        visible = true,
      },
    },
    default_component_configs = {
      indent = {
        with_expanders = true,
        expander_collapsed = vim.g.icons.widget.inline.CaretRight,
        expander_expanded = vim.g.icons.widget.inline.CaretDown,
      },
      icon = {
        folder_closed = vim.g.icons.widget.inline.Folder,
        folder_open = vim.g.icons.widget.inline.FolderOpen,
        folder_empty = vim.g.icons.widget.outline.Folder,
        folder_empty_open = vim.g.icons.widget.outline.FolderOpen,
      },
      diagnostics = {
        symbols = {
          hint = vim.g.icons.widget.inline.Hint,
          info = vim.g.icons.widget.inline.Info,
          warn = vim.g.icons.widget.inline.Warn,
          error = vim.g.icons.widget.inline.Error,
        },
      },
      git_status = {
        symbols = {
          added = "",
          modified = "",
          ignored = vim.g.icons.git.Ignored,
          untracked = vim.g.icons.git.Untracked,
          renamed = vim.g.icons.git.Renamed,
          deleted = vim.g.icons.git.Deleted,
          unstaged = vim.g.icons.git.Unstaged,
          staged = vim.g.icons.git.Staged,
          conflict = vim.g.icons.git.Unmerged,
        },
      },
    },
  })

  local function map(left, right, ...)
    local parameters = { ... }
    vim.keymap.set("n", left, function() right(unpack(parameters)) end)
  end

  map("<tab>", command.execute, { position = "float", toggle = true })
end

return spec
