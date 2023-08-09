local spec = {
  "numToStr/Comment.nvim",
  keys = { "gc", "gb" },
}

function spec:config()
  local comment = require("Comment")

  comment.setup()
end

return spec
