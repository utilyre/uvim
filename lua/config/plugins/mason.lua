local spec = {
  "williamboman/mason.nvim",
}

function spec.config()
  local mason = require("mason")
  local ui = require("mason.ui")

  mason.setup({
    max_concurrent_installers = 4,
    ui = {
      check_outdated_packages_on_open = false,
      border = "rounded",
      icons = {
        package_uninstalled = vim.g.icons.widget.outline.Circle,
        package_installed = vim.g.icons.widget.inline.Circle,
        package_pending = vim.g.icons.widget.inline.Download,
      },
    },
  })

  local function map(left, right, ...)
    local parameters = { ... }
    vim.keymap.set(
      "n",
      "<leader>m" .. left,
      function() right(unpack(parameters)) end
    )
  end

  map("h", ui.open)
end

return spec
