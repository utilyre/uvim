local spec = {
  "utilyre/sentiment.nvim",
  name = "sentiment",
  event = {
    "VeryLazy",
  },
}

function spec:config()
  local sentiment = require("sentiment")

  sentiment.setup()
end

return spec
