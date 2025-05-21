local M = {}

M.plugin = {
  "whitestarrain/md-section-number.nvim",
  ft = "markdown",
  config = function()
    M.setup()
  end,
}

M.setup = function()
  local ok = require("utils.check-requires").check({ "md_section_number" })
  if not ok then
    return
  end

  local mdsectionnumber = require("md_section_number")

  mdsectionnumber.setup()

  local keymap = require("utils.keymapping").global

  keymap("n", "<leader>mdc", "<cmd>MdClearNumber<cr>", "Clear all the header level numbers.")
  keymap("n", "<leader>mdu", "<cmd>MdUpdateNumber<cr>", "Add or update all the header level numbers.")
  keymap("n", "<leader>md-", "<cmd>MdHeaderDecrease<cr>", "Decrease a header level.")
  keymap("n", "<leader>md+", "<cmd>MdHeaderIncrease<cr>", "Increase a header level.")
end

if not pcall(debug.getlocal, 4, 1) then
  M.setup()
end

return M
