local spec = {
  "j-morano/buffer_manager.nvim",
  dependencies = {
    "nvim-lua/plenary.nvim",
  },
}

function spec.config()
  local buffermanager = require("buffer_manager")
  local ui = require("buffer_manager.ui")

  buffermanager.setup({
    focus_alternate_buffer = true,
  })

  local function map(left, right, ...)
    local params = { ... }
    vim.keymap.set("n", left, function() right(unpack(params)) end)
  end

  map("<leader><space>", ui.toggle_quick_menu)
end

return spec
