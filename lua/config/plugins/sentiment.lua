local spec = {
  "utilyre/sentiment.nvim",
  event = { "BufReadPre", "BufNewFile" },
}

function spec:config()
  local sentiment = require("sentiment")

  sentiment.setup()
end

return spec
