<h1 align="center">nvim</h1>

<p align="center">
  This is my "minimal" Neovim config that I put pride on.
</p>

## ⚡ Requirements

- 🍺 Get yourself a fresh install of [`neovim`][neovim].

- 📠 Have a feature-rich terminal installed ([`kitty`][kitty] is highly
  recommended).

- 🚀 Use a [Nerd Font][nerdfonts] within your terminal.

- 🔍 Install [`ripgrep`][ripgrep] through your OS's package manager.

[neovim]: https://github.com/neovim/neovim
[kitty]: https://github.com/kovidgoyal/kitty
[nerdfonts]: https://www.nerdfonts.com/
[ripgrep]: https://github.com/BurntSushi/ripgrep

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

- Run `:TSInstall all` to install all treesitter parsers available. (useful for
  syntax highlighting)

- See `:help lspconfig-all` to get an understanding of how you should configure
  an specific language server.

  **NOTE**: Store server configurations inside `user/servers.lua` relative to
  this repository's root.

- See [null-ls builtins][builtins] to figure out how you should configure an
  specific linting/formatting tool, A.K.A source.

  **NOTE**: Store source configurations inside `user/sources.lua` relative to
  this repository's root.

[builtins]: https://github.com/jose-elias-alvarez/null-ls.nvim/blob/main/doc/BUILTINS.md

## 💻 Plugin Development

In case you do some Neovim plugin development, here's how you would do it in
this config

1. Set `NVIM_DEV` environment variable to your project's directory. So if you
   keep the plugin you're working on at `~/Repos/mycoolplugin.nvim`, you
   should add the following to your `~/.bashrc`, `~/.zshrc`, etc.

   ```bash
   export NVIM_DEV="$HOME/Repos"
   ```

2. Create a file under `lua/config/plugins` of this repository with the
   following content (continuing with the `mycoolplugin.nvim` example)

   ```lua
   -- lua/config/plugin/mycoolplugin.lua
   local spec = {
     "[user]/mycoolplugin.nvim", -- substitute [user] with your github username
     dev = true,
   }

   function spec.config()
     require("mycoolplugin").setup()
   end

   return spec
   ```
