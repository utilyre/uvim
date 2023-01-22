local spec = {
  "utilyre/FTerm.nvim",
  dependencies = {
    "samjwill/nvim-unception",
  },
}

function spec.config()
  local fterm = require("FTerm")

  local instance
  local options = {
    border = "rounded",
    hl = "NormalFloat",
    on_exit = function() instance = nil end,
    on_attach = function(terminal, bufnr)
      local function snap(direction)
        local width = 0.8
        local height = 0.8
        local x = 0.5
        local y = 0.5
        if direction == "left" then
          width = 0.4
          x = 0.0
        elseif direction == "right" then
          width = 0.4
          x = 1.0
        elseif direction == "top" then
          height = 0.4
          y = 0.0
        elseif direction == "bottom" then
          height = 0.4
          y = 1.0
        end

        terminal:setup({
          dimensions = {
            width = width,
            height = height,
            x = x,
            y = y,
          },
        })

        terminal:close()
        terminal:open()
      end

      local function map(left, right, ...)
        local parameters = { ... }
        vim.keymap.set(
          "t",
          left,
          function() right(unpack(parameters)) end,
          { buffer = bufnr }
        )
      end

      map("<c-w>=", snap, "center")
      map("<c-w>H", snap, "left")
      map("<c-w>L", snap, "right")
      map("<c-w>K", snap, "top")
      map("<c-w>J", snap, "bottom")
    end,
  }

  vim.api.nvim_create_autocmd("User", {
    group = vim.api.nvim_create_augroup("config.plugins.fterm#unception", {}),
    pattern = "UnceptionEditRequestReceived",
    callback = function() instance:close() end,
  })

  local function map(left, right, ...)
    local parameters = { ... }
    vim.keymap.set({ "n", "t" }, left, function() right(unpack(parameters)) end)
  end

  map("<c-\\>", function()
    instance = instance or fterm:new(options)
    instance:toggle()
  end)
end

return spec
