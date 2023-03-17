local spec = {
  "famiu/bufdelete.nvim",
}

function spec:config()
  local bufdelete = require("bufdelete")

  local map = vim.mapper("n")
  map("<leader>c", bufdelete.bufdelete)
end

return spec
