local Binder = require("config.Binder")
local icons = require("config.icons")

local spec = {
  "mfussenegger/nvim-dap",
  name = "dap",
  keys = {
    "<leader>bb",
    "<leader>ba",
  },
}

function spec:config()
  local dap = require("dap")
  local vscode = require("dap.ext.vscode")
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
  vim.fn.sign_define("DapBreakpointRejected", {
    text = icons.widget.rejectedpoint,
    texthl = "debugBreakpoint",
  })

  dap.listeners.after["event_initialized"].dap = function()
    local binder = Binder.new():with_modes({ "n" })

    binder:bind("<leader>bc", dap.continue)
    binder:bind("<leader>bn", dap.step_over)
    binder:bind("<leader>bi", dap.step_into)
    binder:bind("<leader>bo", dap.step_out)
    binder:bind("<leader>br", dap.repl.open, {}, "")
    binder:bind("<leader>bs", widgets.centered_float, widgets.scopes)
  end

  dap.listeners.before["event_terminated"].dap = function()
    local binder = Binder.new():with_modes({ "n" })

    binder:unbind("<leader>bc")
    binder:unbind("<leader>bn")
    binder:unbind("<leader>bi")
    binder:unbind("<leader>bo")
    binder:unbind("<leader>br")
    binder:unbind("<leader>bs")
  end

  local binder = Binder.new():with_modes({ "n" })
  binder:bind("<leader>bb", dap.toggle_breakpoint)
  binder:bind("<leader>bt", dap.terminate)
  binder:bind("<leader>ba", function()
    local launch_path = vim.fs.normalize(
      (vim.lsp.buf.list_workspace_folders()[1] or vim.fn.getcwd())
        .. "/.vscode/launch.json"
    )
    if not vim.loop.fs_access(launch_path, "R") then return end

    vim.ui.select(
      vscode._load_json(table.concat(vim.fn.readfile(launch_path), "\n")),
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
