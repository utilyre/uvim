<h1 align="center">nvim</h1>

<p align="center">
  This is my "minimal" neovim config that I put pride on.
</p>

## ⚡ Requirements

- 🍺 Get yourself a fresh install of [`neovim`][neovim].

- 📠 Have a feature-rich terminal installed ([`kitty`][kitty] is highly
  recommended).

- 🔍 Install [`ripgrep`][ripgrep] through your OS's package manager.

  <details>
    <summary>Arch (btw)</summary>

  ```bash
  sudo pacman -S ripgrep
  ```

  </details>

  ***

  <details>
    <summary>Ubuntu</summary>

  ```bash
  sudo apt install ripgrep
  ```

  </details>

  ***

  <details>
    <summary>macOS</summary>

  ```bash
  brew install ripgrep
  ```

  </details>

[neovim]: https://github.com/neovim/neovim
[kitty]: https://github.com/kovidgoyal/kitty
[ripgrep]: https://github.com/BurntSushi/ripgrep

## 📦 Installation

0. (Optional) Take a backup of your existing neovim config

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

## ⚙️ Configuration

### Syntax highlighting via [tree-sitter][tree-sitter] and [nvim-treesitter][nvim-treesitter]

Type `:TSInstall ` while neovim is open and press `<tab>`. You'll see a list of
**parsers** displayed under the prompt. Continue pressing `<tab>` until you get to
the desired parser and press `<cr>` to install.

**NOTE**: It's also possible to install all the parsers at once by executing
`:TSInstall all`.

[tree-sitter]: https://github.com/tree-sitter/tree-sitter
[nvim-treesitter]: https://github.com/nvim-treesitter/nvim-treesitter

### Code Analysis/Intellisense via LSPs (language server protocols)

If you're coming from VS Code (or practically any other IDE), you're used to
having code analysis/intellisense support out of the box or at the worst
scenario you would have to install an extension.

However, in neovim, you've got to install the binaries manually. But don't
worry, thanks to [mason.nvim][mason.nvim] it became a simple task to setup a LSP
in neovim too!

1. Press `<leader>mh` on your keyboard to open mason.

2. Search for the LSP you want to install if you know the name, otherwise press
   `<c-f>` and select a language so that the long list will narrow down to a
   few LSPs.

   **NOTE**: You can press `<cr>` on any item to get a bunch of useful
   information about it (brief description, URL, version, etc).

3. Open a shell and change directory to user config folder

   ```bash
   mkdir -p ~/.config/nvim/user # in case it's not already there
   cd ~/.config/nvim/user
   ```

4. Edit/Create `servers.lua` and paste the following in there

   ```lua
   local lspconfig = require("lspconfig")

   -- lspconfig.[lsp-name].setup({ [options] })
   ```

   As you see in the commented line, you can configure a server by calling the
   `setup` function. `setup` requires a table of options that will be used to
   configure the LSP. You can find these options in the LSP's documentations.

   **NOTE**: `[lsp-name]` isn't always the same as the binary you've installed
   from mason. See [server-mappings.md][server-mappings.md] for more
   information.

   This is an example of configuring [lua-language-server][lua-language-server]

   ```lua
   lspconfig.sumneko_lua.setup({
     settings = {
       Lua = {
         completion = {
           enable = true,
           callSnippet = "Replace",
           showWord = false,
           workspaceWord = false,
         },
         diagnostics = {
           enable = true,
           globals = { "vim" },
         },
         format = {
           enable = false,
         },
         hint = {
           enable = true,
         },
         hover = {
           enable = true,
           expandAlias = false,
         },
         runtime = {
           version = "LuaJIT",
         },
         workspace = {
           library = {
             [os.getenv("VIMRUNTIME") .. "/lua"] = true,
           },
         },
       },
     },
   })
   ```

[mason.nvim]: https://github.com/williamboman/mason.nvim
[server-mappings.md]: https://github.com/williamboman/mason-lspconfig.nvim/blob/main/doc/server-mapping.md
[lua-language-server]: https://github.com/sumneko/lua-language-server

### Formatters/Linters (e.g. [prettier][prettier])

1. Press `<leader>mh` on your keyboard to open mason.

2. Search for the formatter/linter you want to install.

   **NOTE**: You can press `<cr>` on any item to get a bunch of useful
   information about it (brief description, URL, version, etc).

3. Open a shell and change directory to user config folder

   ```bash
   mkdir -p ~/.config/nvim/user # in case it's not already there
   cd ~/.config/nvim/user
   ```

4. Edit/Create `sources.lua` and paste the following in there

   ```lua
   local null = require("null-ls")

   -- null.register(null.builtins.[type].[name])
   ```

   See [BUILTINS.md][bultins.md] (place contents of `sources` table inside
   `null.register`'s parentheses).

[prettier]: https://prettier.io
[buitins.md]: https://github.com/jose-elias-alvarez/null-ls.nvim/blob/main/doc/BUILTINS.md
