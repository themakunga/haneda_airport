local M = {}

M.plugin = {
    "kdheepak/lazygit.nvim",
    lazy = false,
    cmd = {
        "LazyGit",
        "LazyGitConfig",
        "LazyGitCurrentFile",
        "LazyGitFilter",
        "LazyGitFilterCurrentFile",
    },
    -- optional for floating window border decoration
    dependencies = {
        "nvim-lua/plenary.nvim",
        "nvim-telescope/telescope.nvim",
    },
    config = function()
        M.setup()
    end,
}

M.setup = function()
    local ok = require("utils.check-requires").check({ "lazygit", "telescope" })
    if not ok then
        return
    end
    local telescope = require("telescope")

    telescope.load_extension("lazygit")


    local km = require("utils.keymapping").global

    km("n", "<leader>LG", "<cmd>LazyGit<CR>", "LazyGit")
end

if not pcall(debug.getlocal, 4, 1) then
    M.setup()
end

return M