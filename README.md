<div align="center">

# uvim

This is my **"minimal"** _Neovim config_ that I put pride on.

</div>

## ⚡ Requirements

-   🍺 Get yourself a fresh install of [Neovim][neovim].

-   🚀 Use a [Nerd Font][nerdfonts] within your terminal.

-   🔍 Install [`fd-find`][fd-find] and [`ripgrep`][ripgrep] through your
    favorite package manager.

-   🐙 Setup [`git`][git-scm] if you haven't already.

## 📦 Installation

1.  Append the following to your shell startup script (e.g. `~/.bashrc`) and run
    it in your current session as well

    ```bash
    export NVIM_APPNAME=uvim
    ```

2.  Clone this repository

    ```bash
    git clone https://github.com/utilyre/uvim.git ~/.config/$NVIM_APPNAME
    ```

3.  Spin up Neovim in headless mode to install the configured plugins

    ```bash
    nvim --headless +q
    ```

## ☕ Tips

-   Run `:TSInstall [language]` to install the [tree-sitter][tree-sitter] parser
    for the given language.

-   See [`:help lspconfig-all`][lspconfig-all] to get an understanding of how
    you would setup a language server protocol.

    ```lua
    -- settings/servers.lua
    local lspconfig = require("lspconfig")

    -- $ rustup component add rust-analyzer
    lspconfig.rust_analyzer.setup({
      cmd = { "rustup", "run", "stable", "rust-analyzer" },
    })
    ```

-   View [the docs][null-ls.nvim@doc] to figure out how you are expected to
    configure a source.

    ```lua
    -- settings/sources.lua
    local null = require("null-ls")

    -- $ cargo install stylua
    null.register(null.builtins.formatting.stylua)
    ```

-   Set `NVIM_DEV` environment variable to modify where [lazy.nvim][lazy.nvim]
    should look for `dev = true` plugins.

[neovim]: https://neovim.io
[nerdfonts]: https://www.nerdfonts.com
[fd-find]: https://crates.io/crates/fd-find
[ripgrep]: https://crates.io/crates/ripgrep
[git-scm]: https://git-scm.com
[tree-sitter]: https://tree-sitter.github.io/tree-sitter
[lspconfig-all]: https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md
[null-ls.nvim@doc]: https://github.com/jose-elias-alvarez/null-ls.nvim/blob/main/doc/BUILTINS.md
[lazy.nvim]: https://github.com/folke/lazy.nvim
