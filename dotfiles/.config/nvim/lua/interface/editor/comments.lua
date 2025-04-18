local M = {}

M.plugin = {
  "numToStr/Comment.nvim",
  event = { "BufReadPre", "BufNewFile" },
  dependencies = {
    "JoosepAlviste/nvim-ts-context-commentstring",
  },

  setup = function()
    M.setup()
  end,
}

M.setup = function()
  local ok = require("utils.check-requires").check({ "comment", "ts_context_commentstring" })
  if not ok then
    return
  end

  local comment = require("comment")
  local ts_context_commentstring = require("ts_context_commentstring.integrations.comment_nvim")

  comment.setup({
    -- for commenting tsx, jsx, svelte, html files
    pre_hook = ts_context_commentstring.create_pre_hook(),
  })
end

if not pcall(debug.getlocal, 4, 1) then
  M.setup()
end

return M
