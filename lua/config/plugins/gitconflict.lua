local spec = {
  "akinsho/git-conflict.nvim",
  event = { "BufReadPre", "BufNewFile" },
}

function spec:config()
  local gitconflict = require("git-conflict")

  gitconflict.setup({
    disable_diagnostics = true,
    default_mappings = {
      prev = "[x",
      next = "]x",
      none = "<leader>xd",
      both = "<leader>xr",
      ours = "<leader>xc",
      theirs = "<leader>xi",
    },
  })
end

return spec
