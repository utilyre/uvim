local spec = {
  "numToStr/Comment.nvim",
  keys = {
    { "gc", mode = { "n", "x" } },
    { "gb", mode = { "n", "x" } },
  },
}

function spec:config()
  local comment = require("Comment")

  comment.setup()
end

return spec
