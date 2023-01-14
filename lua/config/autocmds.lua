local augroup = vim.api.nvim_create_augroup("autocmds", {})

vim.api.nvim_create_autocmd("InsertLeave", {
  group = augroup,
  callback = function() vim.opt.timeout = false end,
})

vim.api.nvim_create_autocmd("InsertEnter", {
  group = augroup,
  callback = function() vim.opt.timeout = true end,
})

vim.api.nvim_create_autocmd("TextYankPost", {
  group = augroup,
  callback = function()
    vim.highlight.on_yank({
      on_visual = false,
      higroup = "Visual",
    })
  end,
})
