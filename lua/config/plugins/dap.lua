local Binder = require("config.binder")

local spec = {
  "mfussenegger/nvim-dap",
  keys = {
    "<leader>db",
    "<leader>dc",
  },
}

function spec:config()
  local dap = require("dap")
  local widgets = require("dap.ui.widgets")

  local adapters_path =
    vim.fs.normalize(vim.fn.stdpath("config") .. "/settings/adapters.lua")
  if vim.loop.fs_access(adapters_path, "R") then dofile(adapters_path) end

  vim.fn.sign_define("DapBreakpoint", { text = "", linehl = "DapBreakpoint" })
  vim.fn.sign_define("DapStopped", { text = "", linehl = "DapStopped" })

  local binder = Binder.new({ "n" })
  binder
    :clone()
    :desc("Debug Breakpoint")
    :bind("<leader>db", dap.toggle_breakpoint)
  binder:clone():desc("Debug Continue"):bind("<leader>dc", dap.continue)
  binder:clone():desc("Debug Next"):bind("<leader>dn", dap.step_over)
  binder:clone():desc("Debug Into"):bind("<leader>di", dap.step_into)
  binder:clone():desc("Debug Out"):bind("<leader>do", dap.step_out)
  binder:clone():desc("Debug REPL"):bind("<leader>dr", dap.repl.open, {}, "")
  binder
    :clone()
    :desc("Debug Scope")
    :bind("<leader>ds", widgets.centered_float, widgets.scopes)
end

return spec
