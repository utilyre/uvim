local spec = {
  "famiu/bufdelete.nvim",
}

function spec.config()
  local bufdelete = require("bufdelete")

  local function map(left, right, ...)
    local params = { ... }
    vim.keymap.set("n", left, function() right(unpack(params)) end)
  end

  map("<leader>c", bufdelete.bufdelete)
end

return spec
