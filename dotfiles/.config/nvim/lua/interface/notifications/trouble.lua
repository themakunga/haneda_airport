local M = {}

M.plugin = {
  "folke/trouble.nvim",
  dependencies = { "nvim-tree/nvim-web-devicons", "folke/todo-comments.nvim" },
  config = function()
    M.setup()
  end,
}

M.setup = function()
  local ok = require("utils.check-requires").check({ "trouble" })
  if not ok then
    return
  end

  local keymap = require('utils.keymapping').global

  keymap("n", "<leader>xx", "<cmd>TroubleToggle<CR>", "Open/close trouble list")
  keymap("n", "<leader>xw", "<cmd>TroubleToggle workspace_diagnostics<CR>", "Open trouble workspace diagnostics")
  keymap("n", "<leader>xd", "<cmd>TroubleToggle document_diagnostics<CR>", "Open trouble document diagnostics")
  keymap("n", "<leader>xq", "<cmd>TroubleToggle quickfix<CR>", "Open trouble quickfix list")
  keymap("n", "<leader>xl", "<cmd>TroubleToggle loclist<CR>", "Open trouble location list")
  keymap("n", "<leader>xt", "<cmd>TodoTrouble<CR>", "Open todos in trouble")

end

if not pcall(debug.getlocal, 4, 1) then
  M.setup()
end

return M
