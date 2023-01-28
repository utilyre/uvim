vim.api.nvim_create_autocmd("InsertLeave", {
  group = vim.api.nvim_create_augroup("config.autocmds#timeout", {}),
  callback = function() vim.opt.timeout = false end,
})

vim.api.nvim_create_autocmd("InsertEnter", {
  group = vim.api.nvim_create_augroup("config.autocmds#timeout", {}),
  callback = function() vim.opt.timeout = true end,
})

vim.api.nvim_create_autocmd("TextYankPost", {
  group = vim.api.nvim_create_augroup("config.autocmds#yank", {}),
  callback = function()
    vim.highlight.on_yank({
      on_visual = false,
      higroup = "Visual",
    })
  end,
})
