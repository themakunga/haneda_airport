local M = {}

M.plugin = {
    "goolord/alpha-nvim",
    event = "VimEnter",
    enabled = true,
    init = false,
    config = function()
        M.setup()
    end,
}

M.setup = function()
  local ok = require("utils.check-requires").check({"alpha"})

  if not ok then
    return
  end

  local alpha = require("alpha")
    local dashboard = require("alpha.themes.dashboard")
    local logo = {
        [[ ⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀ ]],
        [[ ⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣀⡀⢀⣀⠀⠀⣤⠀⢠⡄⢀⣤⣤⡀⢀⡀⠀⢀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀ ]],
        [[ ⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢠⣤⠴⠆⣴⠟⠛⢷⡌⢷⣼⠃⠀⠀⣿⣤⣼⡇⣿⠁⠈⢻⣼⡇⠀⣸⠀⣿⡄⢰⡆⣶⢤⣄⡀⠀⠀⠀⠀⠀⠀ ]],
        [[ ⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢸⡷⠶⠆⣿⡀⠀⣼⢇⡾⢻⣆⠀⠀⣿⠀⢸⡇⢿⣄⣠⡿⠹⣇⠀⣿⠀⡇⠻⣼⡇⣿⠀⠈⣷⠀⠀⠀⠀⠀⠀ ]],
        [[ ⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢸⡇⠀⠀⠈⠛⠛⠋⠈⠁⠀⠉⠀⠀⠀⠀⠀⠀⠀⠉⠉⠀⠀⠉⠉⠉⠀⠃⠀⠙⠇⠿⢤⣤⡿⠀⠀⠀⠀⠀⠀ ]],
        [[ ⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣀⣀⣤⣤⣶⣶⣶⣿⣿⣿⣿⣦⣄⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀ ]],
        [[ ⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢠⣶⣾⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣽⣛⣫⣤⣤⣤⣤⣀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀ ]],
        [[ ⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢸⣿⠛⠿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣷⣄⠀⠀⠀⠀⠀⠀⠀⣀⣤⣴⡶⠾⠶⠶⠄⠀⠀⠀⠀⠀ ]],
        [[ ⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢸⣇⠀⠀⠀⠈⠉⠙⠛⠿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣷⣤⡀⠀⢀⣴⣿⠟⠋⠁⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀ ]],
        [[ ⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢸⣿⠁⣤⠀⠀⠀⠀⠀⠀⠈⠻⣿⣿⣿⣿⣿⣿⣿⡿⠟⢿⡿⠛⡛⢿⣿⡇⣴⣿⠟⠁⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀ ]],
        [[ ⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢸⣿⣧⣹⣿⣦⣄⠀⠀⠀⠀⠀⠘⢿⣿⣿⣯⣭⣾⣷⣿⣿⣶⣾⣿⣶⣤⣾⡿⠃⠀⠀⠀⠀⢀⣠⡄⣼⠀⠀⠀⠀⠀⠀⠀ ]],
        [[ ⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢸⣿⣿⣟⢿⣿⣯⢀⣀⢤⡀⠀⠀⡀⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⡁⠀⠀⠀⢀⡰⣶⣶⣿⣿⠀⠀⠀⠀⠀⠀⠀ ]],
        [[ ⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢸⣿⣿⣿⣷⡻⣿⣶⡎⢿⡿⢛⣭⣾⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣷⣤⣤⠀⣈⣤⣿⣿⣿⠃⠀⠀⠀⠀⠀⠀⠀ ]],
        [[ ⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢸⣿⣿⣿⣿⣿⡘⢿⠿⣃⣴⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣷⣾⣭⣽⣭⠁⠀⠀⠀⠀⠀⠀⠀⠀ ]],
        [[ ⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢸⣿⣿⣿⣿⣿⣿⡄⢻⣿⣿⠿⢿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⢿⣧⠀⠀⠀⠀⠀⠀⠀⠀⠀ ]],
        [[ ⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢸⣿⣿⡏⣿⣿⣿⡰⣬⡛⢿⣿⣷⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⠟⣵⣿⣫⣿⣿⣿⣿⣿⣿⣭⢾⣿⠃⠀⠀⠀⠀⠀⠀⠀⠀ ]],
        [[ ⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢸⣿⣿⣿⡿⣿⣿⣷⠙⣿⡞⣿⣿⣿⣿⣿⣿⣿⡟⣿⣿⣿⣿⣾⣻⣿⣿⣿⣿⣿⣿⣿⣽⣾⣷⢟⣼⠇⠀⠀⠀⠀⠀⠀⠀ ]],
        [[ ⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢘⡻⣿⣿⡇⢻⣿⡗⣾⣿⢷⡜⠛⠿⠟⠛⠛⠿⣿⠈⢉⣿⣟⢱⣿⣿⣿⢿⡟⠉⠀⣿⣿⣿⢹⣿⡏⠀⠀⠀⠀⠀⠀⠀⠀ ]],
        [[ ⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢸⣿⣬⣿⣗⢸⣿⢳⣯⠛⣿⣧⣠⠀⠐⢷⢰⡄⠈⢀⣿⣿⣿⡞⠃⠀⣴⢸⡏⠀⣼⣿⣿⣿⢺⡟⠃⠀⠀⠀⠀⠀⠀⠀⠀ ]],
        [[ ⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠈⢿⣿⠟⠉⠘⢿⣯⣛⢷⡝⢛⣻⣦⣄⣠⣤⣀⢀⡤⣴⣿⣿⡧⢀⣴⣶⣶⣶⣿⣿⣷⡶⢰⣿⡇⠀⠀⠀⠀⠀⠀⠀⠀⠀ ]],
        [[ ⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠈⠇⠀⠀⠀⠈⣿⣿⡏⣛⣦⣽⣛⡻⣿⣿⣿⣿⣣⣿⣿⣿⡇⣿⣿⣿⣿⠿⠿⣫⣤⡴⣚⡟⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀ ]],
        [[ ⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠻⣿⣿⣮⣭⣟⢻⣿⣮⣻⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣵⣿⣿⠛⢿⠟⠛⠁⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀ ]],
        [[ ⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠙⢿⣿⣿⣶⣶⡝⠙⣝⣿⣿⣿⣿⣿⣿⢯⣿⣿⠟⠉⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀ ]],
        [[ ⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠹⠿⠿⠉⠁⠀⣿⣿⡛⣿⣿⣿⣏⣿⣿⡇⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀ ]],
        [[ ⠀⠀⠀⠈⠻⢿⣷⣝⣻⢿⣿⣿⣿⣿⣿⣿⣾⣿⣿⣿⣿⣷⣿⣿⣾⣿⣿⢹⣿⠀⠀⠀⣿⣿⠇⠿⠿⠿⠇⢿⣿⡇⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀ ]],
        [[ ⠀⠀⠀⠀⠀⠀⠈⠉⠚⠛⠛⠛⠛⠛⠛⠛⠛⠛⠛⠛⠛⠛⠛⠛⠛⠛⠛⠚⠛⠀⠀⠀⢿⣿⡀⠀⠀⠀⠀⣸⣿⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀ ]],
        [[ ⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠘⣶⡆⠀⢰⣝⠿⠶⠆⠶⠾⠿⠃⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀ ]],
        [[ ⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠘⢷⣤⣾⣿⣿⣿⡆⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀ ]],
        [[ ⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠈⣿⣿⣿⣿⣿⣷⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀ ]],
        [[ ⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠻⣿⣿⣿⣿⡿⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀ ]],
        [[ ⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠉⠙⠻⠃⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀ ]],
        [[ ⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀ ]],
    }

    dashboard.section.header.val = logo

    dashboard.section.buttons.val = {
        dashboard.button("n", "  > New File", "<cmd>ene<CR>"),
        dashboard.button("e", "  > Focus File Explorer", "<cmd>NvimTreeToggle<CR>"),
        dashboard.button("f", "󰱼  > Find File", "<cmd>Telescope find_files<CR>"),
        dashboard.button("r", "󰁯  > Restore Session For Current Directory", "<cmd>SessionRestore<CR>"),
        dashboard.button("l", "💤 > Open Lazy UI", "<cmd>Lazy<CR>"),
        dashboard.button("q", "  > Quit NVIM", "<cmd>qa<CR>"),
    }

    for _, button in ipairs(dashboard.section.buttons.val) do
        button.opts.hl = "AlphaButtons"
        button.opts.hl_shortcut = "AlphaShortcut"
    end
    dashboard.section.header.opts.hl = "AlphaHeader"
    dashboard.section.buttons.opts.hl = "AlphaButtons"
    dashboard.section.footer.opts.hl = "AlphaFooter"
    dashboard.opts.layout[1].val = 8

    if vim.o.filetype == "lazy" then
        vim.cmd.close()
        vim.api.nvim_create_autocmd("User", {
            once = true,
            pattern = "AlphaReady",
            callback = function()
                require("lazy").show()
            end,
        })
    end


    alpha.setup(dashboard.opts)

    vim.api.nvim_create_autocmd("User", {
        once = true,
        pattern = "LazyVimStarted",
        callback = function()
            local stats = require("lazy").stats()
            local ms = (math.floor(stats.startuptime * 100 + 0.5) / 100)
            dashboard.section.footer.val = "⚡ Neovim loaded "
                .. stats.loaded
                .. "/"
                .. stats.count
                .. " plugins in "
                .. ms
                .. "ms"
            pcall(vim.cmd.AlphaRedraw)
        end,
    })

    -- Automatically open alpha when the last buffer is deleted and only one window left
    vim.cmd [[ au BufDelete * if empty(filter(tabpagebuflist(), '!buflisted(v:val)')) && winnr('$') == 1 | exec 'Alpha' | endif ]]

    vim.api.nvim_create_augroup("alphaOnEmpty", { clear = true })
    vim.api.nvim_create_autocmd("User", {
        pattern = "BDeletePre *",
        group = "alphaOnEmpty",
        callback = function()
            local bufnr = vim.api.nvim_get_current_buf()
            local name = vim.api.nvim_buf_get_name(bufnr)

            if name == "" then
                vim.cmd([[:Alpha | bd#]])
            end
        end,
    })
end

if not pcall(debug.getlocal, 4, 1) then
  M.setup()
end

return M
