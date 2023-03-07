local spec = {
  "navarasu/onedark.nvim",
  dev = true,
  priority = 100,
}

function spec.config()
  local onedark = require("onedark")

  onedark.setup({
    style = "darker",
  })

  onedark.load()
end

return spec
