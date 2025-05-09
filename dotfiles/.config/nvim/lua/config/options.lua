local M = {}

M.setup = function()
  local options = {
    backup = false,
    clipboard = "unnamedplus",
    -- cmdHeight = 2,
    completeopt = { "menuone", "noselect" },
    conceallevel = 0,
    fileencoding = "utf-8",
    hlsearch = true,
    ignorecase = true,
    mouse = "a",
    pumheight = 10, -- pop up menu height
    showmode = false, -- we don't need to see things like -- INSERT -- anymore
    showtabline = 2, -- always show tabs
    smartcase = true, -- smart case
    smartindent = true, -- make indenting smarter again
    splitbelow = true, -- force all horizontal splits to go below current window
    splitright = true, -- force all vertical splits to go to the right of current window
    swapfile = false, -- creates a swapfile
    -- termguicolors = true,                    -- set term gui colors (most terminals support this)
    timeoutlen = 300, -- time to wait for a mapped sequence to complete (in milliseconds)
    undofile = true, -- enable persistent undo
    updatetime = 300, -- faster completion (4000ms default)
    writebackup = false, -- if a file is being edited by another program (or was written to file while editing with another program), it is not allowed to be edited
    expandtab = true, -- convert tabs to spaces
    shiftwidth = 2, -- the number of spaces inserted for each indentation
    tabstop = 2, -- insert 2 spaces for a tab
    cursorline = true, -- highlight the current line
    number = true, -- set numbered lines
    relativenumber = true, -- set relative numbered lines
    numberwidth = 4, -- set number column width to 2 {default 4}

    signcolumn = "yes", -- always show the sign column, otherwise it would shift the text each time
    wrap = true, -- display lines as one long line
    linebreak = true, -- companion to wrap, don't split words
    scrolloff = 8, -- minimal number of screen lines to keep above and below the cursor
    sidescrolloff = 8, -- minimal number of screen columns either side of cursor if wrap is `false`
    guifont = "monospace:h17", -- the font used in graphical neovim applications
    whichwrap = "bs<>[]hl", -- which "horizontal" keys are allowed to travel to prev/next line
  }

  for key, value in pairs(options) do
    vim.opt[key] = value
  end

  vim.opt.shortmess:append("c")
  vim.opt.iskeyword:append("-")
  vim.opt.formatoptions:remove({ "c", "r", "o" })
  vim.opt.runtimepath:remove("/usr/share/vim/vimfiles")
  vim.g.loaded_netrw = 1
  vim.g.loaded_netrwPlugin = 1
end

if not pcall(debug.getlocal, 4, 1) then
  M.setup()
end

return M
