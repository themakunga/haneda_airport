local M = {}

M.plugin = {
  "folke/todo-comments.nvim",
  event = { "BufReadPre", "BufNewFile" },
  dependencies = { "nvim-lua/plenary.nvim" },
  setup = function()
    M.setup()
  end,
}

M.setup = function()
  local ok = require("utils.check-requires").check({ "todo-comments", "which-key" })
  if not ok then
    return
  end

  local todocomment = require("todo-comments")

  todocomment.setup()

  local keymap = require("utils.keymapping").global

  keymap("n", "]t", function()
    todocomment.jump_next()
  end, "Next todo comment")
  keymap("n", "[t", function()
    todocomment.jump_prev()
  end, "Previous todo comment")
end

if not pcall(debug.getlocal, 4, 1) then
  M.setup()
end

return M
