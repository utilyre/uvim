vim.api.nvim_create_autocmd({ "InsertLeave", "InsertEnter" }, {
  group = vim.api.nvim_create_augroup("config.autocmds.timeout", {}),
  callback = function(a)
    if a.event == "InsertLeave" then
      vim.opt.timeout = false
    elseif a.event == "InsertEnter" then
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

vim.api.nvim_create_autocmd({ "TermOpen", "BufEnter" }, {
  group = vim.api.nvim_create_augroup("config.autocmds.terminal", {}),
  callback = function(a)
    if vim.bo[a.buf].buftype ~= "terminal" then return end

    vim.opt_local.signcolumn = "no"
    vim.opt_local.number = false
    vim.opt_local.relativenumber = false
    vim.opt_local.spell = false

    vim.cmd.startinsert()
  end,
})
