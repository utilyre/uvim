vim.api.nvim_create_autocmd("ModeChanged", {
  group = vim.api.nvim_create_augroup("config.autocmds.timeout", {}),
  callback = function(args)
    local mode = vim.split(args.match, ":", { plain = true })[2]
    vim.opt.timeout = mode == "i"
  end,
})

vim.api.nvim_create_autocmd("TextYankPost", {
  group = vim.api.nvim_create_augroup("config.autocmds.yank", {}),
  callback = function()
    vim.highlight.on_yank({
      on_visual = false,
      higroup = "Visual",
    })
  end,
})

vim.api.nvim_create_autocmd("TermOpen", {
  group = vim.api.nvim_create_augroup("config.autocmds.terminal", {}),
  callback = function()
    vim.opt_local.number = false
    vim.opt_local.relativenumber = false
    vim.opt_local.spell = false
  end,
})
