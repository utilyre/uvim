local spec = {
  "lewis6991/gitsigns.nvim",
  cmd = { "Gitsigns" },
  event = { "BufReadPre", "BufNewFile" },
}

function spec:config()
  local gitsigns = require("gitsigns")

  gitsigns.setup({
    current_line_blame = true,
    current_line_blame_formatter = "  <author>, <author_time:%R> "
      .. vim.g.icons.layout.List
      .. " <summary> ",
    current_line_blame_formatter_nc = "  <author> ",
    current_line_blame_opts = {
      virt_text_priority = 10000,
    },
    preview_config = {
      border = "rounded",
    },
    on_attach = function(buf)
      local map = vim.keymap.gen("n", { buffer = buf })
      map("[h", gitsigns.prev_hunk, { navigation_message = false })
      map("]h", gitsigns.next_hunk, { navigation_message = false })
      map("<leader>hd", gitsigns.diffthis)
      map("<leader>hp", gitsigns.preview_hunk)
      map("<leader>hR", gitsigns.reset_buffer)
      map("<leader>hr", gitsigns.reset_hunk)
      map("<leader>hA", gitsigns.stage_buffer)
      map("<leader>ha", gitsigns.stage_hunk)
      map("<leader>hu", gitsigns.undo_stage_hunk)
    end,
  })
end

return spec
