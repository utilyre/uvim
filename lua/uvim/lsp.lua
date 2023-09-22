local Binder = require("uvim.Binder")

vim.api.nvim_create_autocmd({ "LspAttach" }, {
    group = vim.api.nvim_create_augroup("uvim.lsp.attacher", {}),
    callback = function(args)
        local client = vim.lsp.get_client_by_id(args.data.client_id)

        if client.supports_method("textDocument/inlayHint") then
            vim.lsp.inlay_hint(args.buf, true)
        end

        if client.supports_method("$/progress") then
            vim.api.nvim_create_autocmd({ "LspProgress" }, {
                group = vim.api.nvim_create_augroup(
                    "uvim.lsp.progress",
                    { clear = false }
                ),
                buffer = args.buf,
                callback = function(args)
                    vim.api.nvim_echo({ { vim.lsp.status() } }, false, {})
                end,
            })
        end

        local binder = Binder.new():with_buffer(args.buf)
        binder
            :clone()
            :with_modes({ "n" })
            :bind("<leader>ii", vim.lsp.buf.implementation)
        binder
            :clone()
            :with_modes({ "n" })
            :bind("<leader>ir", vim.lsp.buf.references)
        binder
            :clone()
            :with_modes({ "n" })
            :bind("<leader>ia", vim.lsp.buf.code_action)
        binder
            :clone()
            :with_modes({ "n" })
            :bind("<leader>if", vim.lsp.buf.format, { async = true })
        binder
            :clone()
            :with_modes({ "n" })
            :bind("<leader>ic", vim.lsp.buf.rename)
        binder
            :clone()
            :with_modes({ "s", "i" })
            :bind("<c-space>", vim.lsp.buf.signature_help)
    end,
})

vim.api.nvim_create_autocmd({ "LspDetach" }, {
    group = vim.api.nvim_create_augroup("uvim.lsp.detacher", {}),
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

        local binder = Binder.new():with_buffer(args.buf)
        binder:clone():with_modes({ "n" }):unbind("<leader>ii")
        binder:clone():with_modes({ "n" }):unbind("<leader>ir")
        binder:clone():with_modes({ "n" }):unbind("<leader>ia")
        binder:clone():with_modes({ "n" }):unbind("<leader>if")
        binder:clone():with_modes({ "n" }):unbind("<leader>ic")
        binder:clone():with_modes({ "s", "i" }):unbind("<c-space>")
    end,
})
