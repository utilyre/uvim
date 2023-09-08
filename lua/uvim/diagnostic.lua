local Binder = require("uvim.Binder")
local icon = require("uvim.icon")

vim.diagnostic.config({
  severity_sort = true,
  virtual_text = false,
  float = {
    source = true,
    border = "rounded",
    header = "",
    prefix = " " .. icon.layout.list .. " ",
    suffix = " ",
  },
})

vim.fn.sign_define("DiagnosticSignError", { numhl = "DiagnosticSignError" })
vim.fn.sign_define("DiagnosticSignWarn", { numhl = "DiagnosticSignWarn" })
vim.fn.sign_define("DiagnosticSignInfo", { numhl = "DiagnosticSignInfo" })
vim.fn.sign_define("DiagnosticSignHint", { numhl = "DiagnosticSignHint" })

local binder = Binder.new():with_modes({ "n" })
binder:bind("[d", vim.diagnostic.goto_prev, { float = false })
binder:bind("]d", vim.diagnostic.goto_next, { float = false })
binder:bind("<leader>d", vim.diagnostic.open_float)
