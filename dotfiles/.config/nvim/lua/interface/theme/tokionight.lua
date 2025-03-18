local M = {}

M.plugin = {
  "folke/tokyonight.nvim",
  config = function()
    M.setup()
  end,
}

M.setup = function()
  local ok = require("utils.check-requires").check({ "tokyonight" })
  if not ok then
    return
  end

  local tokyonight = require("tokyonight")

  vim.o.termguicolors = true

  tokyonight.setup({
    style = "storm",
    transparent = true,
    styles = {
      floats = "transparent",
      sidebars = "transparent",
    },
  })
  vim.cmd("colorscheme tokyonight")
end

if not pcall(debug.getlocal, 4, 1) then
  M.setup()
end

return M