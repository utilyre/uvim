<h1 align="center">nvim</h1>

<p align="center">
  This is my "minimal" Neovim config that I put pride on.
</p>

## ⚡ Requirements

- 🍺 Get yourself a fresh install of [`neovim`][neovim].

- 📠 Have a feature-rich terminal installed ([`kitty`][kitty] is highly
  recommended).

- 🚀 Use a [Nerd Font][nerdfonts] within your terminal.

- 🔍 Install [`ripgrep`][ripgrep] through your favorite package manager.

- 🐙 Make sure you have [`git`][git] installed.

[neovim]: https://neovim.io
[kitty]: https://sw.kovidgoyal.net/kitty
[nerdfonts]: https://www.nerdfonts.com
[ripgrep]: https://crates.io/crates/ripgrep
[git]: https://git-scm.com

## 📦 Installation

0. (Optional) Take a backup of your existing Neovim config

   ```bash
   mv ~/.config/nvim ~/.config/nvim.back
   mv ~/.local/share/nvim ~/.local/share/nvim.back
   ```

1. Clone this repository onto `~/.config/nvim`

   ```bash
   git clone https://github.com/utilyre/nvim.git ~/.config/nvim
   ```

2. Open up `nvim` and wait for [lazy.nvim][lazy.nvim] to do its job. Once it's
   done re-open `nvim` to make sure everything is good to go.

[lazy.nvim]: https://github.com/folke/lazy.nvim

## ☕ Tips

- Run `:TSInstall all` to install all treesitter parsers available (useful for
  syntax highlighting).

- See `:help lspconfig-all` to get an understanding of how you would setup a
  language server protocol.

  **NOTE**: Store LSP configurations inside `user/servers.lua` relative to this
  repository's root.

- See [null-ls builtins][builtins] to figure out how you are expected to
  configure a source.

  **NOTE**: Keep source configurations inside `user/sources.lua` of this
  repository.

[builtins]: https://github.com/jose-elias-alvarez/null-ls.nvim/blob/main/doc/BUILTINS.md
