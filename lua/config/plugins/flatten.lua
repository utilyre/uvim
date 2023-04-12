local spec = {
  "willothy/flatten.nvim",
  priority = 10000,
}

function spec:config()
  local flatten = require("flatten")

  flatten.setup({
    window = {
      open = "alternate",
    },
  })
end

return spec