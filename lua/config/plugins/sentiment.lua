local spec = {
  "utilyre/sentiment.nvim",
  event = { "VeryLazy" },
}

function spec:config()
  local sentiment = require("sentiment")

  sentiment.setup({
    delay = 40,
  })
end

return spec
