local spec = {
  "lewis6991/gitsigns.nvim",
}

function spec.config()
  local gitsigns = require("gitsigns")

  gitsigns.setup({
    current_line_blame = true,
    current_line_blame_formatter = "    <author>, <author_time:%R> "
      .. vim.g.icons.layout.Separator
      .. " <summary>",
    current_line_blame_formatter_nc = "    <author>",
    current_line_blame_opts = {
      virt_text_priority = 10000,
    },
    preview_config = {
      border = "rounded",
    },
    on_attach = function(bufnr)
      local function map(left, right, ...)
        local parameters = { ... }
        vim.keymap.set(
          "n",
          "<leader>g" .. left,
          function() right(unpack(parameters)) end,
          { buffer = bufnr }
        )
      end

      map("d", gitsigns.diffthis)
      map("p", gitsigns.preview_hunk)
      map("R", gitsigns.reset_buffer)
      map("r", gitsigns.reset_hunk)
      map("A", gitsigns.stage_buffer)
      map("a", gitsigns.stage_hunk)
      map("u", gitsigns.undo_stage_hunk)
      map("k", gitsigns.prev_hunk, { navigation_message = false })
      map("j", gitsigns.next_hunk, { navigation_message = false })
    end,
  })
end

return spec
