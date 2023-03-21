local spec = {
  "neovim/nvim-lspconfig",
  event = { "BufReadPre", "BufNewFile" },
}

function spec:config()
  local lspconfig = require("lspconfig")
  local cmp = require("cmp_nvim_lsp")

  local servers_path = vim.fn.stdpath("config") .. "/settings/servers.lua"
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

  vim.diagnostic.config({
    virtual_text = {
      spacing = 2,
      prefix = " " .. vim.g.icons.layout.List,
      suffix = " ",
    },
    float = {
      source = true,
      border = "rounded",
      header = "",
      prefix = " " .. vim.g.icons.layout.List .. " ",
      suffix = " ",
    },
  })

  vim.fn.sign_define("DiagnosticSignHint", { numhl = "DiagnosticSignHint" })
  vim.fn.sign_define("DiagnosticSignInfo", { numhl = "DiagnosticSignInfo" })
  vim.fn.sign_define("DiagnosticSignWarn", { numhl = "DiagnosticSignWarn" })
  vim.fn.sign_define("DiagnosticSignError", { numhl = "DiagnosticSignError" })

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

      local map = vim.keymap.gen("n", { buffer = args.buf })
      map("K", vim.lsp.buf.hover)
      map("<leader>is", vim.lsp.buf.document_symbol)
      map("<leader>iD", vim.lsp.buf.declaration, { reuse_win = true })
      map("<leader>id", vim.lsp.buf.definition, { reuse_win = true })
      map("<leader>it", vim.lsp.buf.type_definition, { reuse_win = true })
      map("<leader>ii", vim.lsp.buf.implementation)
      map("<leader>ir", vim.lsp.buf.references)
      map("<leader>ia", vim.lsp.buf.code_action)
      map("<leader>if", vim.lsp.buf.format, { async = true })
      map("<leader>ic", vim.lsp.buf.rename)
    end,
  })

  local map = vim.keymap.gen("n")
  map("[e", vim.diagnostic.goto_prev, { float = false })
  map("]e", vim.diagnostic.goto_next, { float = false })
  map("<leader>e", vim.diagnostic.open_float)
end

return spec
