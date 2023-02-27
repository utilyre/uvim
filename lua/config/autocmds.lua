vim.api.nvim_create_autocmd({ "InsertLeave", "InsertEnter" }, {
  group = vim.api.nvim_create_augroup("config.autocmds.timeout", {}),
  callback = function(args)
    if args.event == "InsertLeave" then
      vim.opt.timeout = false
    elseif args.event == "InsertEnter" then
      vim.opt.timeout = true
    end
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
