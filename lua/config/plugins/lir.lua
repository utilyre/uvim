local spec = {
  "tamago324/lir.nvim",
  lazy = false,
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-tree/nvim-web-devicons",
  },
}

function spec:config()
  local lir = require("lir")
  local actions = require("lir.actions")
  local clipboard = require("lir.clipboard.actions")

  lir.setup({
    show_hidden_files = true,
    devicons = {
      enable = true,
    },
    mappings = {
      ["<bs>"] = actions.up,
      ["<cr>"] = actions.edit,
      ["r"] = actions.reload,
      ["x"] = actions.delete,
      ["c"] = actions.rename,
      ["a"] = actions.newfile,
      ["d"] = clipboard.cut,
      ["y"] = clipboard.copy,
      ["p"] = clipboard.paste,
    },
  })

  vim.api.nvim_create_autocmd("FileType", {
    pattern = "lir",
    callback = function()
      vim.opt_local.number = false
      vim.opt_local.relativenumber = false
      vim.opt_local.spell = false
    end,
  })
end

return spec
