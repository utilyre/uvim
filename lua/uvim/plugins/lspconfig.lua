local Binder = require("uvim.Binder")

local spec = {
  "neovim/nvim-lspconfig",
  event = { "BufReadPre", "BufNewFile" },
}

function spec:config()
  local lspconfig = require("lspconfig")
  local windows = require("lspconfig.ui.windows")
  local cmp = require("cmp_nvim_lsp")

  windows.default_options.border = "rounded"
  lspconfig.util.on_setup = lspconfig.util.add_hook_after(
    lspconfig.util.on_setup,
    function(config)
      config.capabilities = vim.tbl_deep_extend(
        "force",
        config.capabilities,
        cmp.default_capabilities()
      )

      config.handlers["textDocument/hover"] =
        vim.lsp.with(vim.lsp.handlers.hover, { border = "rounded" })
      config.handlers["textDocument/signatureHelp"] =
        vim.lsp.with(vim.lsp.handlers.signature_help, { border = "rounded" })
    end
  )

  local lsp_path = vim.fs.joinpath(vim.fn.stdpath("config"), "lsp")
  for name, type in vim.fs.dir(lsp_path) do
    if type == "file" and vim.endswith(name, ".lua") then
      lspconfig[name:sub(1, -5)].setup(dofile(vim.fs.joinpath(lsp_path, name)))
    end
  end

  vim.api.nvim_create_autocmd({ "LspAttach" }, {
    group = vim.api.nvim_create_augroup(
      "config.plugins.lspconfig.attacher",
      {}
    ),
    callback = function(args)
      local client = vim.lsp.get_client_by_id(args.data.client_id)

      if client.supports_method("textDocument/inlayHint") then
        vim.lsp.inlay_hint(args.buf, true)
      end

      if client.supports_method("$/progress") then
        vim.api.nvim_create_autocmd({ "LspProgress" }, {
          group = vim.api.nvim_create_augroup(
            "config.plugins.lspconfig.progress",
            { clear = false }
          ),
          buffer = args.buf,
          callback = function(args)
            vim.api.nvim_echo({ { vim.lsp.status() } }, false, {})
          end,
        })
      end

      local binder = Binder.new():with_modes({ "n" }):with_buffer(args.buf)
      binder:bind("<leader>id", vim.lsp.buf.definition, { reuse_win = true })
      binder:bind("<leader>it", vim.lsp.buf.type_definition, {
        reuse_win = true,
      })
      binder:bind("<leader>ii", vim.lsp.buf.implementation)
      binder:bind("<leader>ir", vim.lsp.buf.references)
      binder:bind("<leader>ia", vim.lsp.buf.code_action)
      binder:bind("<leader>if", vim.lsp.buf.format, { async = true })
      binder:bind("<leader>ic", vim.lsp.buf.rename)
      binder
        :clone()
        :with_modes({ "i", "s" })
        :bind("<c-space>", vim.lsp.buf.signature_help)
    end,
  })

  vim.api.nvim_create_autocmd({ "LspDetach" }, {
    group = vim.api.nvim_create_augroup(
      "config.plugins.lspconfig.detacher",
      {}
    ),
    callback = function(args)
      local client = vim.lsp.get_client_by_id(args.data.client_id)

      if client.supports_method("textDocument/inlayHint") then
        vim.lsp.inlay_hint(args.buf, false)
      end

      if client.supports_method("$/progress") then
        vim.api.nvim_clear_autocmds({
          group = "config.plugins.lspconfig.progress",
          buffer = args.buf,
        })
      end

      local binder = Binder.new():with_modes({ "n" }):with_buffer(args.buf)
      binder:unbind("<leader>ih")
      binder:unbind("<leader>id")
      binder:unbind("<leader>it")
      binder:unbind("<leader>ii")
      binder:unbind("<leader>ir")
      binder:unbind("<leader>ia")
      binder:unbind("<leader>if")
      binder:unbind("<leader>ic")
    end,
  })
end

return spec