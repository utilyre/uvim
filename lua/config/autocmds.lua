vim.api.nvim_create_autocmd("BufWritePre", {
  group = vim.api.nvim_create_augroup("config.autocmds.mkdir", {}),
  callback = function(args)
    local path = vim.fs.dirname(args.file)
    if vim.loop.fs_access(path, "R") then return end

    vim.fn.mkdir(path, "p")
  end,
})

vim.api.nvim_create_autocmd({ "InsertLeave", "InsertEnter" }, {
  group = vim.api.nvim_create_augroup("config.autocmds.timeout", {}),
  callback = function(args) vim.opt.timeout = args.event == "InsertEnter" end,
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
