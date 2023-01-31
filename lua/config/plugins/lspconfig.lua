local spec = {
  "neovim/nvim-lspconfig",
  dependencies = {
    "hrsh7th/cmp-nvim-lsp",
  },
}

function spec.config()
  local lspconfig = require("lspconfig")
  local cmp = require("cmp_nvim_lsp")

  local servers_path = vim.fn.stdpath("config") .. "/user/servers.lua"
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

  vim.diagnostic.config({
    float = {
      scope = "cursor",
      source = "always",
      border = "rounded",
      header = "",
      prefix = "",
    },
  })

  vim.fn.sign_define("DiagnosticSignHint", { numhl = "DiagnosticSignHint" })
  vim.fn.sign_define("DiagnosticSignInfo", { numhl = "DiagnosticSignInfo" })
  vim.fn.sign_define("DiagnosticSignWarn", { numhl = "DiagnosticSignWarn" })
  vim.fn.sign_define("DiagnosticSignError", { numhl = "DiagnosticSignError" })

  vim.api.nvim_create_autocmd("LspAttach", {
    group = vim.api.nvim_create_augroup("config.plugins.lsp.attachment", {}),
    callback = function(a)
      local client = vim.lsp.get_client_by_id(a.data.client_id)

      if client.server_capabilities["codeLensProvider"] then
        vim.api.nvim_create_autocmd({
          "CursorHold",
          "TextChanged",
          "InsertLeave",
        }, {
          group = vim.api.nvim_create_augroup(
            "config.plugins.lsp.codelens",
            { clear = false }
          ),
          buffer = a.buf,
          callback = function() vim.lsp.codelens.refresh() end,
        })
      end

      local function map(left, right, ...)
        local parameters = { ... }
        vim.keymap.set(
          "n",
          left,
          function() right(unpack(parameters)) end,
          { buffer = a.buf }
        )
      end

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

  local function map(left, right, ...)
    local parameters = { ... }
    vim.keymap.set("n", left, function() right(unpack(parameters)) end)
  end

  map("[d", vim.diagnostic.goto_prev, { float = false })
  map("]d", vim.diagnostic.goto_next, { float = false })
  map("<leader>d", vim.diagnostic.open_float)
end

return spec
