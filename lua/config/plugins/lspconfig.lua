local Binder = require("config.binder")
local icons = require("config.icons")

local spec = {
  "neovim/nvim-lspconfig",
  event = { "BufReadPre", "BufNewFile" },
}

function spec:init()
  vim.diagnostic.config({
    virtual_text = {
      spacing = 2,
      prefix = " " .. icons.layout.List,
      suffix = " ",
    },
    float = {
      source = true,
      border = "rounded",
      header = "",
      prefix = " " .. icons.layout.List .. " ",
      suffix = " ",
    },
  })

  vim.fn.sign_define("DiagnosticSignHint", { numhl = "DiagnosticSignHint" })
  vim.fn.sign_define("DiagnosticSignInfo", { numhl = "DiagnosticSignInfo" })
  vim.fn.sign_define("DiagnosticSignWarn", { numhl = "DiagnosticSignWarn" })
  vim.fn.sign_define("DiagnosticSignError", { numhl = "DiagnosticSignError" })

  local binder = Binder.new({ "n" })
  binder
    :clone()
    :desc("Previous Error")
    :bind("[e", vim.diagnostic.goto_prev, { float = false })
  binder
    :clone()
    :desc("Next Error")
    :bind("]e", vim.diagnostic.goto_next, { float = false })
  binder:clone():desc("Error Show"):bind("<leader>e", vim.diagnostic.open_float)
end

function spec:config()
  local lspconfig = require("lspconfig")
  local windows = require("lspconfig.ui.windows")
  local cmp = require("cmp_nvim_lsp")

  windows.default_options.border = "rounded"

  local servers_path =
    vim.fs.normalize(vim.fn.stdpath("config") .. "/settings/servers.lua")
  if vim.loop.fs_access(servers_path, "R") then
    lspconfig.util.on_setup = lspconfig.util.add_hook_after(
      lspconfig.util.on_setup,
      function(config)
        config.capabilities = vim.tbl_deep_extend(
          "force",
          config.capabilities,
          cmp.default_capabilities()
        )
      end
    )

    dofile(servers_path)
  end

  vim.lsp.handlers["textDocument/hover"] =
    vim.lsp.with(vim.lsp.handlers.hover, {
      border = "rounded",
    })

  vim.api.nvim_create_autocmd("LspAttach", {
    group = vim.api.nvim_create_augroup("config.plugins.lsp.attacher", {}),
    callback = function(args)
      local client = vim.lsp.get_client_by_id(args.data.client_id)

      if client.server_capabilities["codeLensProvider"] then
        vim.api.nvim_create_autocmd({
          "CursorHold",
          "TextChanged",
          "InsertLeave",
        }, {
          group = vim.api.nvim_create_augroup("config.plugins.lsp.codelens", {
            clear = false,
          }),
          buffer = args.buf,
          callback = function() vim.lsp.codelens.refresh() end,
        })
      end

      if client.server_capabilities["documentHighlightProvider"] then
        local group =
          vim.api.nvim_create_augroup("config.plugins.lsp.reference", {
            clear = false,
          })

        vim.api.nvim_create_autocmd("CursorHold", {
          group = group,
          buffer = args.buf,
          callback = function() vim.lsp.buf.document_highlight() end,
        })

        vim.api.nvim_create_autocmd({ "CursorMoved", "InsertEnter" }, {
          group = group,
          buffer = args.buf,
          callback = function() vim.lsp.buf.clear_references() end,
        })
      end

      local binder = Binder.new({ "n" }):buffer(args.buf)
      binder:clone():desc("LSP Hover"):bind("K", vim.lsp.buf.hover)
      binder
        :clone()
        :desc("LSP Definition")
        :bind("<leader>id", vim.lsp.buf.definition, { reuse_win = true })
      binder
        :clone()
        :desc("LSP Type Definition")
        :bind("<leader>it", vim.lsp.buf.type_definition, { reuse_win = true })
      binder
        :clone()
        :desc("LSP Implementation")
        :bind("<leader>ii", vim.lsp.buf.implementation)
      binder
        :clone()
        :desc("LSP References")
        :bind("<leader>ir", vim.lsp.buf.references)
      binder
        :clone()
        :desc("LSP Code Actions")
        :bind("<leader>ia", vim.lsp.buf.code_action)
      binder
        :clone()
        :desc("LSP Format")
        :bind("<leader>if", vim.lsp.buf.format, { async = true })
      binder:clone():desc("LSP Rename"):bind("<leader>ic", vim.lsp.buf.rename)
    end,
  })
end

return spec
