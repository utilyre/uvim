vim.api.nvim_create_autocmd({ "InsertLeave", "InsertEnter" }, {
  group = vim.api.nvim_create_augroup("config.autocmds#timeout", {}),
  callback = function(a)
    if a.event == "InsertLeave" then
      vim.opt.timeout = false
    elseif a.event == "InsertEnter" then
      vim.opt.timeout = true
    end
  end,
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
