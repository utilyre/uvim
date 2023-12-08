vim.api.nvim_create_autocmd("LspAttach", {
    group = vim.api.nvim_create_augroup("uvim.lsp.attacher", {}),
    callback = function(args)
        local client = vim.lsp.get_client_by_id(args.data.client_id)

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
    end,
})

vim.api.nvim_create_autocmd("LspDetach", {
    group = vim.api.nvim_create_augroup("uvim.lsp.detacher", {}),
    callback = function(args)
        local client = vim.lsp.get_client_by_id(args.data.client_id)

        if client.supports_method("$/progress") then
            vim.api.nvim_clear_autocmds({
                group = "uvim.lsp.progress",
                buffer = args.buf,
            })
        end
    end,
})

vim.keymap.set("n", "<space>ir", vim.lsp.buf.references)
vim.keymap.set("n", "<space>ia", vim.lsp.buf.code_action)
vim.keymap.set("n", "<space>ic", vim.lsp.buf.rename)
vim.keymap.set(
    "n",
    "<space>if",
    function() vim.lsp.buf.format({ async = true }) end
)
