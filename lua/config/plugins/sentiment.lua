local spec = {
  "utilyre/sentiment.nvim",
}

function spec.config()
  local sentiment = require("sentiment")

  sentiment.setup()
end

return spec
