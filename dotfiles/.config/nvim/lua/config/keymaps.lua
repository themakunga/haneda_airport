local M = {}

M.setup = function()
  local keymap = require("utils.keymapping").global

  keymap("", "<Space>", "<Nop>")

  vim.g.mapleader = " "
  vim.g.maplocalleader = " "

  -- Modes
  --   normal_mode = "n",
  --   insert_mode = "i",
  --   visual_mode = "v",
  --   visual_block_mode = "x",
  --   term_mode = "t",
  --   command_mode = "c",
  -- Normal --
  -- Better window navigation
  keymap("n", "<C-h>", "<C-w>h")
  keymap("n", "<C-j>", "<C-w>j")
  keymap("n", "<C-l>", "<C-w>l")
  keymap("n", "<C-k>", "<C-w>k")

  -- Resize with arrows
  keymap("n", "<C-Up>", ":resize -2<CR>")
  keymap("n", "<C-Down>", ":resize +2<CR>")
  keymap("n", "<C-Left>", ":vertical resize -2<CR>")
  keymap("n", "<C-Right>", ":vertical resize +2<CR>")

  -- Navigate buffers
  keymap("n", "<S-l>", ":bprevious<CR>")
  keymap("n", "<S-Left>", ":bprevious<CR>")
  keymap("n", "<S-h>", ":bnext<CR>")
  keymap("n", "<S-Right>", ":bnext<CR>")

  -- Move text up and down
  keymap("n", "<A-j>", ":m .+1<CR>==")
  keymap("n", "<A-Down>", ":m .+1<CR>==")
  keymap("n", "<A-k>", ":m .-2<CR>==")
  keymap("n", "<A-Up>", ":m .-2<CR>==")

  -- Copy text
  keymap("n", "<A-K>", ":copy .<cr>:move -2<cr>")
  keymap("n", "<A-J>", ":copy .<cr>")

  -- Insert --
  -- Press jk fast to exit insert mode
  -- keymap("i", "jk", "<ESC>")
  -- keymap("i", "kj", "<ESC>")

  -- Visual --
  -- Stay in indent mode
  keymap("v", "<", "<gv^")
  keymap("v", ">", ">gv^")

  -- Move text up and down
  keymap("v", "<A-j>", ":m '>+1<CR>gv=gv")
  keymap("v", "<A-k>", ":m '<-2<CR>gv=gv")
  keymap("v", "p", '"_dP')

  -- Visual Block --
  -- Move text up and down
  keymap("x", "J", ":m '>+1<CR>gv=gv")
  keymap("x", "K", ":m '<-2<CR>gv=gv")
  keymap("x", "<A-j>", ":m '>+1<CR>gv=gv")
  keymap("x", "<A-k>", ":m '<-2<CR>gv=gv")
end

return M
