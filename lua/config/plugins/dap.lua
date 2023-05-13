local Binder = require("config.binder")
local icons = require("config.icons")

local spec = {
  "mfussenegger/nvim-dap",
  event = { "BufReadPre", "BufNewFile" },
}

function spec:config()
  local dap = require("dap")

  local adapters_path =
    vim.fs.normalize(vim.fn.stdpath("config") .. "/settings/adapters.lua")
  if vim.loop.fs_access(adapters_path, "R") then dofile(adapters_path) end

  local binder = Binder.new({ "n" })
  binder:bind("<leader>db", dap.toggle_breakpoint)
  binder:bind("<leader>dc", dap.continue)
  binder:bind("<leader>dn", dap.step_over)
  binder:bind("<leader>di", dap.step_into)
  binder:bind("<leader>do", dap.step_out)

  vim.fn.sign_define("DapBreakpoint", {
    text = icons.widget.breakpoint,
    texthl = "DiagnosticSignError",
  })
  vim.fn.sign_define("DapStopped", {
    text = icons.widget.stack,
    texthl = "DiagnosticSignInfo",
  })
end

return spec
