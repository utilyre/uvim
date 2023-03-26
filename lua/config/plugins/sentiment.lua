local spec = {
  "utilyre/sentiment.nvim",
  event = { "BufWinEnter" },
}

function spec:config()
  local sentiment = require("sentiment")

  sentiment.setup()
end

return spec
