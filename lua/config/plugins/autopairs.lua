local spec = {
  "windwp/nvim-autopairs",
  event = { "InsertEnter" },
}

function spec:config()
  local autopair = require("nvim-autopairs")

  autopair.setup({
    check_ts = true,
    enable_afterquote = false,
  })
end

return spec
