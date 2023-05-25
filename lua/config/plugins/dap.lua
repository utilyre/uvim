local Binder = require("config.binder")
local icons = require("config.icons")

local spec = {
  "mfussenegger/nvim-dap",
  keys = {
    "<leader>db",
    "<leader>da",
  },
}

function spec:config()
  local dap = require("dap")
  local widgets = require("dap.ui.widgets")

  dap.defaults.fallback.terminal_win_cmd = "new"

  local adapters_path =
    vim.fs.normalize(vim.fn.stdpath("config") .. "/settings/adapters.lua")
  if vim.loop.fs_access(adapters_path, "R") then dofile(adapters_path) end

  vim.fn.sign_define("DapStopped", {
    text = icons.widget.stackframe,
    texthl = "debugPC",
    linehl = "",
  })
  vim.fn.sign_define("DapBreakpoint", {
    text = icons.widget.breakpoint,
    texthl = "debugBreakpoint",
  })

  dap.listeners.after["event_initialized"].dap = function()
    local binder = Binder.new():with_modes({ "n" })

    binder:bind("<leader>dc", dap.continue)
    binder:bind("<leader>dn", dap.step_over)
    binder:bind("<leader>di", dap.step_into)
    binder:bind("<leader>do", dap.step_out)
    binder:bind("<leader>dr", dap.repl.open, {}, "")
    binder:bind("<leader>ds", widgets.centered_float, widgets.scopes)
  end

  dap.listeners.before["event_terminated"].dap = function()
    local binder = Binder.new():with_modes({ "n" })

    binder:unbind("<leader>dc")
    binder:unbind("<leader>dn")
    binder:unbind("<leader>di")
    binder:unbind("<leader>do")
    binder:unbind("<leader>dr")
    binder:unbind("<leader>ds")
  end

  local binder = Binder.new():with_modes({ "n" })
  binder:bind("<leader>db", dap.toggle_breakpoint)
  binder:bind("<leader>da", function()
    local launch_path = vim.fs.normalize(
      (vim.lsp.buf.list_workspace_folders()[1] or vim.fn.getcwd())
        .. "/.vscode/launch.json"
    )
    if not vim.loop.fs_access(launch_path, "R") then return end

    vim.ui.select(
      vim.json.decode(table.concat(vim.fn.readfile(launch_path), "\n")).configurations,
      {
        prompt = "Configurations:",
        format_item = function(config) return config.name end,
      },
      function(config)
        if config == nil then return end
        dap.run(config)
      end
    )
  end)
end

return spec
