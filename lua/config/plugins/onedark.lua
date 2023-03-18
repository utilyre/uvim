local spec = {
  "utilyre/onedark.nvim",
  priority = 10000,
}

function spec:config()
  local onedark = require("onedark")

  onedark.setup({
    style = "darker",
  })

  onedark.load()
end

return spec
