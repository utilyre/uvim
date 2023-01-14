local spec = {
  "folke/noice.nvim",
  dependencies = {
    "MunifTanjim/nui.nvim",
    "rcarriga/nvim-notify",
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
          icon = ":",
        },
        search_down = {
          title = " Find ",
          icon = "/",
        },
        search_up = {
          title = " Find ",
          icon = "?",
        },
      },
    },
    lsp = {
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
    views = {
      mini = {
        zindex = 40,
        position = {
          row = 2,
          col = -2,
        },
      },
    },
  })

  local function map(left, right, ...)
    local parameters = { ... }
    vim.keymap.set({ "n", "i", "s" }, left, function()
      if not right(unpack(parameters)) then return left end
      return "<ignore>"
    end, { expr = true })
  end

  map("<c-y>", lsp.scroll, -1)
  map("<c-e>", lsp.scroll, 1)
end

return spec
