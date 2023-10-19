local spec = {
    "neovim/nvim-lspconfig",
    lazy = true,
}

function spec:config()
    local lspconfig = require("lspconfig")
    local cmp = require("cmp_nvim_lsp")

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
end

return spec
