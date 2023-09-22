local Binder = require("uvim.Binder")

local spec = {
    "neovim/nvim-lspconfig",
    event = { "BufReadPre", "BufNewFile" },
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

    local lsp_path = vim.fs.joinpath(vim.fn.stdpath("config"), "lsp")
    for name, type in vim.fs.dir(lsp_path) do
        if type == "file" and vim.endswith(name, ".lua") then
            name = name:sub(1, -5)
            lspconfig[name].setup(dofile(vim.fs.joinpath(lsp_path, name)))
        end
    end
end

return spec
