local M = {}

M.init = function()
  require("config.options").setup()
  require("config.keymaps").setup()
end


if not pcall(debug.getlocal, 4, 1) then
  M.init()
end

return M
  
