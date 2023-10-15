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

1.  Run the following and append it to your shell startup script

    ```bash
    export NVIM_APPNAME=uvim
    ```

2.  Clone this repository

    ```bash
    git clone https://github.com/utilyre/uvim.git ~/.config/$NVIM_APPNAME
    ```

3.  Spin up Neovim in headless mode

    ```bash
    nvim --headless +q
    ```

## ☕ Tips

-   Set `NVIM_DEV` environment variable to modify where [lazy.nvim][lazy.nvim]
    should look for `dev = true` plugins.

-   Run `:TSInstall [language]` to install the [tree-sitter][tree-sitter] parser
    for the given language.

-   Install additional plugins or override the existing ones by extending the
    `uvim.extras` module.

[neovim]: https://neovim.io
[nerdfonts]: https://www.nerdfonts.com
[fd-find]: https://crates.io/crates/fd-find
[ripgrep]: https://crates.io/crates/ripgrep
[git-scm]: https://git-scm.com
[lazy.nvim]: https://github.com/folke/lazy.nvim
[tree-sitter]: https://tree-sitter.github.io
