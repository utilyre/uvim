---@class Binder
---@field private mode string|string[]
---@field private opts { buffer: integer, desc: string, expr: boolean, remap: boolean }
local Binder = {}

---@param mode string|string[]
---@return Binder
function Binder.new(mode)
  local instance = setmetatable({}, { __index = Binder })

  instance.mode = mode
  instance.opts = {}

  return instance
end

---@return Binder
function Binder:clone() return vim.deepcopy(self) end

---@param value integer
---@return Binder
function Binder:buffer(value)
  self.opts.buffer = value
  return self
end

---@param value string
---@return Binder
function Binder:desc(value)
  self.opts.desc = value
  return self
end

---@return Binder
function Binder:expr()
  self.opts.expr = true
  return self
end

---@return Binder
function Binder:remap()
  self.opts.remap = true
  return self
end

---@param lhs string
---@param rhs string|fun(): string|nil
---@param ... any
function Binder:bind(lhs, rhs, ...)
  if type(rhs) == "function" then
    local fn = rhs
    local params = { ... }
    rhs = function() return fn(unpack(params)) end
  end

  vim.keymap.set(self.mode, lhs, rhs, self.opts)
end

return Binder
