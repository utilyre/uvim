local spec = {
  "folke/noice.nvim",
  dependencies = {
    "MunifTanjim/nui.nvim",
  },
}

function spec.config()
  local noice = require("noice")
  local lsp = require("noice.lsp")

  noice.setup({
    presets = {
      command_palette = true,
      lsp_doc_border = true,
    },
    messages = {
      view_history = "popup",
      view_search = false,
    },
    cmdline = {
      format = {
        cmdline = {
          title = " Palette ",
          icon = vim.g.icons.widget.inline.ChevronRight,
        },
        search_up = {
          title = " Find ",
          icon = vim.g.icons.widget.inline.Search,
        },
        search_down = {
          title = " Find ",
          icon = vim.g.icons.widget.inline.Search,
        },
      },
    },
    lsp = {
      override = {
        ["vim.lsp.util.convert_input_to_markdown_lines"] = true,
        ["vim.lsp.util.stylize_markdown"] = true,
        ["cmp.entry.get_documentation"] = true,
      },
      progress = {
        format = {
          {
            "{progress}",
            key = "progress.percentage",
            contents = {
              "{data.progress.message}",
            },
          },
          " ",
          {
            "{spinner}",
            hl_group = "NoiceLspProgressSpinner",
          },
          " ",
          {
            "{data.progress.client}",
            hl_group = "NoiceLspProgressClient",
          },
          " ",
          {
            "{data.progress.title}",
            hl_group = "NoiceLspProgressTitle",
          },
        },
        format_done = {
          {
            vim.g.icons.widget.inline.Play,
            hl_group = "NoiceLspProgressSpinner",
          },
          " ",
          {
            "{data.progress.client}",
            hl_group = "NoiceLspProgressClient",
          },
          " ",
          {
            "{data.progress.title}",
            hl_group = "NoiceLspProgressTitle",
          },
        },
      },
    },
  })

  local map = vim.mapper({ "n", "i", "s" }, { expr = true })
  map("<c-y>", function()
    if not lsp.scroll(-1) then return "<c-y>" end
    return "<ignore>"
  end)
  map("<c-e>", function()
    if not lsp.scroll(1) then return "<c-e>" end
    return "<ignore>"
  end)
end

return spec
