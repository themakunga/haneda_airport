local M = {}

M.plugin = {
  "kyazdani42/nvim-tree.lua",
  version = "*",
  lazy = false,
  dependencies = {
    "nvim-tree/nvim-web-devicons",
  },
  config = function()
    M.setup()
  end,
}

M.setup = function()
  local ok = require("utils.check-requires").check({ "nvim-tree" })
  if not ok then
    return
  end

  local opts = {
    hijack_cursor = true,
    open_on_tab = true,
    update_cwd = true,
    update_focused_file = {
      enable = true,
      update_root = true,
      update_cwd = true,
    },
    view = {
      width = 35,
      relativenumber = false,
      side = "left",
    },

    renderer = {
      highlight_git = true,
      root_folder_modifier = ":t",
      indent_markers = {
        enable = true,
      },
      icons = {
        glyphs = {
          default = "",
          symlink = "",
          bookmark = "◉",
          folder = {
            default = "",
            open = "",
            symlink = "",
          },
          git = {
            deleted = "",
            ignored = "◌",
            renamed = "➜",
            staged = "✓",
            unmerged = "",
            unstaged = "✗",
            untracked = "★",
          },
        },
        show = {
          git = false,
          file = true,
          folder = true,
          folder_arrow = false,
        },
      },
    },
    actions = {
      open_file = {
        resize_window = true,
        window_picker = {
          enable = false,
        },
      },
    },
    filters = {
      custom = {
        ".DS_Store",
      },
      dotfiles = false,
    },
    git = {
      ignore = false,
    },
  }

  local nvim_tree = require("nvim-tree")
  local keymap = require("utils.keymapping").global

  nvim_tree.setup(opts)

  keymap("n", "<leader>ee", "<cmd>NvimTreeFocus<cr>", "Toggle Nvim Tree")
end

if not pcall(debug.getlocal, 4, 1) then
  M.setup()
end

return M
