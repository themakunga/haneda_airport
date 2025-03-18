local M = {}

M.plugin = {
  "OXY2DEV/markview.nvim",
  lazy = false,
  dependencies = {
    "nvim-treesitter/nvim-treesitter",
    "nvim-tree/nvim-web-devicons", -- Used by the code bloxks
  },
  setup = function()
    M.setup()
  end,
}

M.setup = function()
  local ok = require("utils.check-requires").check({ "markview" })
  if not ok then
    return
  end

  local markview = require("markview")

  markview.setup({
    modes = { "n", "i", "no", "c" },
    hybrid_modes = { "i" },

    -- This is nice to have
    callbacks = {
      on_enable = function(_, win)
        vim.wo[win].conceallevel = 2
        vim.wo[win].concealcursor = "nc"
      end,
    },
  })
end

if not pcall(debug.getlocal, 4, 1) then
  M.setup()
end

return M
