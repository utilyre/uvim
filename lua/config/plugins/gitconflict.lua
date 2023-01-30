local spec = {
  "akinsho/git-conflict.nvim",
}

function spec.config()
  local gitconflict = require("git-conflict")

  gitconflict.setup({
    default_mappings = false,
    disable_diagnostics = true,
  })

  vim.api.nvim_create_autocmd("User", {
    group = vim.api.nvim_create_augroup(
      "config.plugins.gitconflict.detection",
      {}
    ),
    pattern = "GitConflictDetected",
    callback = function(a)
      local function map(left, right, ...)
        local parameters = { ... }
        vim.keymap.set(
          "n",
          left,
          function() right(unpack(parameters)) end,
          { buffer = a.buf }
        )
      end

      map("[x", gitconflict.find_prev, "ours")
      map("]x", gitconflict.find_next, "ours")
      map("<leader>xd", gitconflict.choose, "none")
      map("<leader>xr", gitconflict.choose, "both")
      map("<leader>xc", gitconflict.choose, "ours")
      map("<leader>xi", gitconflict.choose, "theirs")
    end,
  })

  vim.api.nvim_create_autocmd("User", {
    group = vim.api.nvim_create_augroup(
      "config.plugins.gitconflict.resolution",
      {}
    ),
    pattern = "GitConflictResolved",
    callback = function(a)
      local function unmap(left) vim.keymap.del("n", left, { buffer = a.buf }) end

      unmap("[x")
      unmap("]x")
      unmap("<leader>xd")
      unmap("<leader>xr")
      unmap("<leader>xc")
      unmap("<leader>xi")
    end,
  })
end

return spec
