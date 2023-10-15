vim.api.nvim_create_autocmd("LspAttach", {
    group = vim.api.nvim_create_augroup("uvim.lsp.attacher", {}),
    callback = function(args)
        local client = vim.lsp.get_client_by_id(args.data.client_id)

        if client.supports_method("textDocument/inlayHint") then
            vim.lsp.inlay_hint(args.buf, true)
        end

        if client.supports_method("$/progress") then
            vim.api.nvim_create_autocmd("LspProgress", {
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

        local opts = { buffer = args.buf }
        vim.keymap.set("n", "<leader>ii", vim.lsp.buf.implementation, opts)
        vim.keymap.set("n", "<leader>ir", vim.lsp.buf.references, opts)
        vim.keymap.set("n", "<leader>ia", vim.lsp.buf.code_action, opts)
        vim.keymap.set(
            "n",
            "<leader>if",
            function() vim.lsp.buf.format({ async = true }) end,
            opts
        )
        vim.keymap.set("n", "<leader>ic", vim.lsp.buf.rename, opts)
    end,
})

vim.api.nvim_create_autocmd("LspDetach", {
    group = vim.api.nvim_create_augroup("uvim.lsp.detacher", {}),
    callback = function(args)
        local client = vim.lsp.get_client_by_id(args.data.client_id)

        if client.supports_method("textDocument/inlayHint") then
            vim.lsp.inlay_hint(args.buf, false)
        end

        if client.supports_method("$/progress") then
            vim.api.nvim_clear_autocmds({
                group = "uvim.lsp.progress",
                buffer = args.buf,
            })
        end

        local opts = { buffer = args.buf }
        vim.keymap.del("n", "<leader>ii", opts)
        vim.keymap.del("n", "<leader>ir", opts)
        vim.keymap.del("n", "<leader>ia", opts)
        vim.keymap.del("n", "<leader>if", opts)
        vim.keymap.del("n", "<leader>ic", opts)
    end,
})
