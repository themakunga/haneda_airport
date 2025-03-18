local M = {}

M.plugin = {
  "epwalsh/pomo.nvim",
  version = "*", -- Recommended, use latest release instead of latest commit
  lazy = true,
  cmd = { "TimerStart", "TimerRepeat", "TimerSession" },
  dependencies = {
    -- Optional, but highly recommended if you want to use the "Default" timer
    "rcarriga/nvim-notify",
  },
  config = function()
    M.setup()
  end,
}

M.setup = function()
  local ok = require("utils.check-requires").check({ "pomo", "telescope" })

  if not ok then
    return
  end

  local pomo = require("pomo")

  local opts = {
    sessions = {
      pomodoro = {
        { name = "Work", duration = "25m" },
        { name = "Short Break", duration = "5m" },
        { name = "Work", duration = "25m" },
        { name = "Short Break", duration = "5m" },
        { name = "Work", duration = "25m" },
        { name = "Long Break", duration = "15m" },
      },
    },
  }

  pomo.setup(opts)

  require("telescope").load_extension("pomodori")

  local keymap = require("utils.keymapping").global

  keymap("n", "<leader>Pt", function()
    require("telescope").extensions.pomodori.timers()
  end, "Manage Pomodori Timers")
  keymap("n", "<leader>Tss", "<cmd>TimerSession<cr>", "Init a timer session")
end

if not pcall(debug.getlocal, 4, 1) then
  M.setup()
end

return M
