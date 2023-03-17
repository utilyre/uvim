local spec = {
  "utilyre/onedark.nvim",
  priority = 100,
}

function spec:config()
  local onedark = require("onedark")

  onedark.setup({
    style = "darker",
  })

  onedark.load()
end

return spec
