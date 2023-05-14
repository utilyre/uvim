local Binder = require("config.binder")

local spec = {
  "mfussenegger/nvim-dap",
  keys = {
    "<leader>dc",
    "<leader>db",
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

  dap.listeners.after["event_initialized"].dap = function()
    local binder = Binder.new({ "n" })

    binder:clone():desc("Debug Next"):bind("<leader>dn", dap.step_over)
    binder:clone():desc("Debug Into"):bind("<leader>di", dap.step_into)
    binder:clone():desc("Debug Out"):bind("<leader>do", dap.step_out)
    binder:clone():desc("Debug REPL"):bind("<leader>dr", dap.repl.open, {}, "")
    binder
      :clone()
      :desc("Debug Scope")
      :bind("<leader>ds", widgets.centered_float, widgets.scopes)
  end

  dap.listeners.before["event_terminated"].dap = function()
    local binder = Binder.new({ "n" })

    binder:unbind("<leader>dn")
    binder:unbind("<leader>di")
    binder:unbind("<leader>do")
    binder:unbind("<leader>dr")
    binder:unbind("<leader>ds")
  end

  local binder = Binder.new({ "n" })
  binder:clone():desc("Debug Continue"):bind("<leader>dc", dap.continue)
  binder
    :clone()
    :desc("Debug Breakpoint")
    :bind("<leader>db", dap.toggle_breakpoint)
end

return spec
