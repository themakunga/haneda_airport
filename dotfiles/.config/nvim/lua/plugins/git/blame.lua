local M = {}

M.plugin = {
  "f-person/git-blame.nvim",
  -- load the plugin at startup
  event = "VeryLazy",
  config = function()
    M.setup()
  end,
}

M.setup = function()
  local ok = require("utils.check-requires").check({
    "gitblame",
  })

  if not ok then
    return
  end

  local gb = require("gitblame")

  local opts = {
    enabled = true, -- if you want to enable the plugin
    message_template = " <author> | <date> <<sha>> | <summary>", -- template for the blame message, check the Message template section for more options
    date_format = "%Y-%m-%d %H:%M:%S", -- template for the date, check Date format section for more options
    virtual_text_column = 1, --
  }

  gb.setup(opts)
end

if not pcall(debug.getlocal, 4, 1) then
  M.setup()
end

return M
