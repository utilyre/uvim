local Binder = require("config.Binder")
local icon = require("config.icon")

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

vim.fn.sign_define("DiagnosticSignError", {
  numhl = "DiagnosticSignError",
  linehl = "DiagnosticLineError",
})
vim.fn.sign_define("DiagnosticSignWarn", {
  numhl = "DiagnosticSignWarn",
  linehl = "DiagnosticLineWarn",
})
vim.fn.sign_define("DiagnosticSignInfo", {
  numhl = "DiagnosticSignInfo",
  linehl = "DiagnosticLineInfo",
})
vim.fn.sign_define("DiagnosticSignHint", {
  numhl = "DiagnosticSignHint",
  linehl = "DiagnosticLineHint",
})

local binder = Binder.new():with_modes({ "n" })
binder:bind("[d", vim.diagnostic.goto_prev, { float = false })
binder:bind("]d", vim.diagnostic.goto_next, { float = false })
binder:bind("<leader>d", vim.diagnostic.open_float)
