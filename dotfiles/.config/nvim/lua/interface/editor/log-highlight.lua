local M = {}

M.plugin = {
  "fei6409/log-highlight.nvim",
  setup = function()
    M.setup()
  end,
}

M.setup = function()
  local ok = require("utils.check-requires").check({ "log-highlight" })
  if not ok then
    return
  end

  local loghighlight = require("log-highlight")

  loghighlight.setup({
    pattern = {
      ".*%.log%..*",
      ".*%.log%d+",
      ".*%.log%d+%.?gz?",
    },
  })
end

if not pcall(debug.getlocal, 4, 1) then
  M.setup()
end

return M
