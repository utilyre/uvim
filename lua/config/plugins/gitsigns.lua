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
          left,
          function() right(unpack(parameters)) end,
          { buffer = bufnr }
        )
      end

      map("[g", gitsigns.prev_hunk, { navigation_message = false })
      map("]g", gitsigns.next_hunk, { navigation_message = false })
      map("<leader>gd", gitsigns.diffthis)
      map("<leader>gp", gitsigns.preview_hunk)
      map("<leader>gR", gitsigns.reset_buffer)
      map("<leader>gr", gitsigns.reset_hunk)
      map("<leader>gA", gitsigns.stage_buffer)
      map("<leader>ga", gitsigns.stage_hunk)
      map("<leader>gu", gitsigns.undo_stage_hunk)
    end,
  })
end

return spec
