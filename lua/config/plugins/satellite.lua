local spec = {
  "lewis6991/satellite.nvim",
}

function spec.config()
  local satellite = require("satellite")

  satellite.setup({
    current_only = true,
  })
end

return spec
