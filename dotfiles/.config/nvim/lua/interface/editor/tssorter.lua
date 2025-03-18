local M = {}

M.plugin = {
  "mtrajano/tssorter.nvim",
  version = "*", -- latest stable version, use `main` to keep up with the latest changes
  setup = function()
    M.setup()
  end,
}

M.setup = function()
  local ok = require("utils.check-requires").check({ "tssorter", "which-key" })
  if not ok then
    return
  end

  local tssorter = require("tssorter")

  tssorter.setup({})

  local keymap = require("utils.keymapping").global

  keymap("n", "<leader>lsa", "<cmd>TSSort<cr>", "Sort the content on group")
  keymap("n", "<leader>lsr", "<cmd>TSSort heading reverse=true<cr>", "Reverse sort the content")
end

if not pcall(debug.getlocal, 4, 1) then
  M.setup()
end

return M
