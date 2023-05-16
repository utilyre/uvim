<div align="center">

# nvim

This is my **"minimal"** _Neovim config_ that I put pride on.

</div>

## ⚡ Requirements

-   🍺 Get yourself a fresh install of [Neovim][neovim].

-   🚀 Use a [Nerd Font][nerdfonts] within your terminal.

-   🔍 Install [`fd-find`][fd] and [`ripgrep`][ripgrep] through your favorite
    package manager.

-   🐙 Setup [`git`][git] if you haven't already.

## 📦 Installation

1.  Take a backup of your (possibly) existing Neovim folders

    ```bash
    # required
    mv ~/.config/nvim ~/.config/nvim-backup

    # optional
    mv ~/.cache/nvim ~/.cache/nvim-backup
    mv ~/.local/share/nvim ~/.local/share/nvim-backup
    mv ~/.local/state/nvim ~/.local/state/nvim-backup
    ```

2.  Clone this repository onto `~/.config/nvim`

    ```bash
    git clone https://github.com/utilyre/nvim.git ~/.config/nvim
    ```

3.  Spin up Neovim in headless mode to install all the plugins

    ```bash
    nvim --headless +q
    ```

## ☕ Tips

-   Run `:TSInstall [language]` to install the [treesitter][treesitter] parser
    for the given language.

-   See [`:help lspconfig-all`][lspconfig-all] to get an understanding of how
    you would setup a language server protocol.

    **NOTE**: Additionally, [SchemaStore.nvim][SchemaStore.nvim] is provided to
    properly setup language servers that accept pre-defined schemas.

    ```lua
    -- settings/servers.lua
    local lspconfig = require("lspconfig")

    -- $ rustup component add rust-analyzer
    lspconfig.rust_analyzer.setup({
      cmd = { "rustup", "run", "stable", "rust-analyzer" },
    })
    ```

-   See [builtins][builtins] to figure out how you are expected to configure a
    source.

    ```lua
    -- settings/sources.lua
    local null = require("null-ls")

    -- $ cargo install stylua
    null.register(null.builtins.formatting.stylua)
    ```

-   Check out [Debug Adapter Installation][adapters] for further information on
    setting up a debug adapter and configuring it.

    ```lua
    -- settings/adapters.lua
    local dap = require("dap")

    dap.adapters.codelldb = {
      type = "server",
      port = "${port}",
      executable = {
        command = vim.fn.normalize("/path/to/codelldb/extension/adapter/codelldb"),
        args = { "--port", "${port}" },
      },
    }
    ```

    ```json5
    // ${workspaceFolder}/.vscode/launch.json
    {
      "version": "0.2.0",
      "configurations": [
        {
          "type": "codelldb",
          "request": "launch",
          "name": "Launch CodeLLDB",
          "cwd": "${workspaceFolder}",
          "program": "${workspaceFolder}/path/to/binary"
        }
      ]
    }
    ```

-   Set `NVIM_DEV` environment variable to modify where [lazy.nvim][lazy.nvim]
    should look for `dev = true` plugins.

[neovim]: https://neovim.io
[nerdfonts]: https://www.nerdfonts.com
[fd]: https://crates.io/crates/fd-find
[ripgrep]: https://crates.io/crates/ripgrep
[git]: https://git-scm.com
[treesitter]: https://tree-sitter.github.io/tree-sitter
[lspconfig-all]: https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md
[SchemaStore.nvim]: https://github.com/b0o/SchemaStore.nvim
[builtins]: https://github.com/jose-elias-alvarez/null-ls.nvim/blob/main/doc/BUILTINS.md
[adapters]: https://github.com/mfussenegger/nvim-dap/wiki/Debug-Adapter-installation
[lazy.nvim]: https://github.com/folke/lazy.nvim
