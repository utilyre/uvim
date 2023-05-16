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
    local binder = Binder.new({ "n" })

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

  dap.listeners.before["event_terminated"].dap = function()
    local binder = Binder.new({ "n" })

    binder:unbind("<leader>dc")
    binder:unbind("<leader>dn")
    binder:unbind("<leader>di")
    binder:unbind("<leader>do")
    binder:unbind("<leader>dr")
    binder:unbind("<leader>ds")
  end

  local binder = Binder.new({ "n" })
  binder
    :clone()
    :desc("Debug Breakpoint")
    :bind("<leader>db", dap.toggle_breakpoint)
  binder:clone():desc("Debug Attach"):bind("<leader>da", function()
    vim.ui.select(
      vim.json.decode(
        table.concat(
          vim.fn.readfile(
            vim.fs.normalize(
              (vim.lsp.buf.list_workspace_folders()[1] or "$PWD")
                .. "/.vscode/launch.json"
            )
          ),
          "\n"
        )
      ).configurations,
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
