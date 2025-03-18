local M = {}

M.plugin = {
    "Isrothy/neominimap.nvim",
  dependencies = {
    "lewis6991/gitsigns.nvim",
  },
    version = "v3.*.*",
    enabled = true,
    lazy = false, -- NOTE: NO NEED to Lazy load
    init = function()
        -- The following options are recommended when layout == "float"
        vim.opt.wrap = false
        vim.opt.sidescrolloff = 36 -- Set a large value
        vim.g.neominimap = {
            auto_enable = true,
        }
    end,

    setup = function()
        M.setup()
    end,
}


M.setup = function()
    local ok = require("utils.check-requires").check({ "neominimap", })
    if not ok then
        return
    end

  local keymap = require("utils.keymapping").global

  
-- Global [M]inimap Controls
    keymap("n", "<leader>mt", "<cmd>Neominimap toggle<cr>", "[m]inimap [t]oggle global")
    keymap("n", "<leader>me", "<cmd>Neominimap on<cr>", "[m]inimap [e]nable global")
    keymap("n", "<leader>md", "<cmd>Neominimap off<cr>", "[m]inimap [d]isable global")
    keymap("n", "<leader>mr", "<cmd>Neominimap refresh<cr>", "[m]inimap [r]efresh global")

    -- Window-Specific Minimap Controls
    keymap("n", "<leader>mwt", "<cmd>Neominimap winToggle<cr>", "[t]oggle [m]inimap for current window")
    keymap("n", "<leader>mwr", "<cmd>Neominimap winRefresh<cr>", "Refresh [m]inimap for current window")
    keymap("n", "<leader>mwo", "<cmd>Neominimap winOn<cr>", "Enable [m]inimap for current window")
    keymap("n", "<leader>mwc", "<cmd>Neominimap winOff<cr>", "Disable [m]inimap for current window")

    -- Tab-Specific [M]inimap Controls
    keymap("n", "<leader>mtt", "<cmd>Neominimap tabToggle<cr>", "Toggle [m]inimap for current tab")
    keymap("n", "<leader>mtr", "<cmd>Neominimap tabRefresh<cr>", "Refresh [m]inimap for current tab")
    keymap("n", "<leader>mto", "<cmd>Neominimap tabOn<cr>", "Enable [m]inimap for current tab")
    keymap("n", "<leader>mtc", "<cmd>Neominimap tabOff<cr>", "Disable [m]inimap for current tab")

    -- Buffer-Specific [M]inimap Controls
    keymap("n", "<leader>mbt", "<cmd>Neominimap bufToggle<cr>", "Toggle [m]inimap for current buffer")
    keymap("n", "<leader>mbr", "<cmd>Neominimap bufRefresh<cr>", "Refresh [m]inimap for current buffer")
    keymap("n", "<leader>mbo", "<cmd>Neominimap bufOn<cr>", "Enable [m]inimap for current buffer")
    keymap("n", "<leader>mbc", "<cmd>Neominimap bufOff<cr>", "Disable [m]inimap for current buffer")

    ---Focus Controls
    keymap("n", "<leader>mf", "<cmd>Neominimap focus<cr>", "Focus on minimap")
    keymap("n", "<leader>mu", "<cmd>Neominimap unfocus<cr>", "Unfocus minimap")
    keymap("n", "<leader>ms", "<cmd>Neominimap toggleFocus<cr>", "Switch focus on minimap")

end

if not pcall(debug.getlocal, 4, 1) then
    M.setup()
end

return M
