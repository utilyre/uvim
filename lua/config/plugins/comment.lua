local spec = {
  "numToStr/Comment.nvim",
}

function spec.config()
  local comment = require("Comment")

  comment.setup()
end

return spec
