local M = {}

M.plugin = {
  "folke/snacks.nvim",
  priority = 1000,
  lazy = false,
  config = function()
    M.setup()
  end,
}

M.setup = function()
  local ok = require("utils.check-requires").check({ "snacks" })
  if not ok then
    return
  end

  local opts = {
    indent = { enabled = true },
    input = { enabled = true },
    notifier = { enabled = true },
    scope = { enabled = true },
    scroll = { enabled = true },
    statuscolumn = { enabled = false }, -- we set this in options.lua
    words = { enabled = true },
  }

  local Snacks = require("snacks")
  local keymap = require("utils.keymapping").global


  Snacks.setup(opts)

  keymap("n", "<leader>n", function()
    if Snacks.config.picker and Snacks.config.picker.enabled then
      Snacks.picker.notifications()
    else
      Snacks.notifier.show_history()
    end
  end, "Notification History")
  keymap("n", "<leader>un", function() Snacks.notifier.hide() end, "Dismiss All Notifications")
end

if not pcall(debug.getlocal, 4, 1) then
  M.setup()
end

return M
