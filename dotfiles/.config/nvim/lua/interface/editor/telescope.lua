--[=[
# DEPENDENCY
- [ripgrep](github.com/BurntSushi/ripgrep) for live_grep
--]=]

local M = {}

M.plugin = {
  "nvim-telescope/telescope.nvim",
  branch = "0.1.x",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "folke/trouble.nvim",
    { "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
    "nvim-tree/nvim-web-devicons",
    "folke/todo-comments.nvim",
    "nvim-telescope/telescope-ui-select.nvim",
    "nvim-telescope/telescope-media-files.nvim",
  },
  event = "VeryLazy",
  config = function()
    M.setup()
  end,
}

M.setup = function()
  local ok = require("utils.check-requires").check({
    "telescope",
    "trouble",
  })
  if not ok then
    return
  end

  local telescope = require("telescope")
  local actions = require("telescope.actions")
  local transform_mod = require("telescope.actions.mt").transform_mod

  local trouble = require("trouble")
  local trouble_telescope = require("trouble.sources.telescope")

  telescope.load_extension("ui-select")
  telescope.load_extension("media_files")

  local custom_actions = transform_mod({
    open_trouble_qflist = function(prompt_bufnr)
      trouble.toggle("quickfix")
    end,
  })

  local function normalize_path(path)
    return path:gsub("\\", "/")
  end

  local function normalize_cwd()
    return normalize_path(vim.loop.cwd()) .. "/"
  end

  local function is_subdirectory(cwd, path)
    return string.lower(path:sub(1, #cwd)) == string.lower(cwd)
  end

  local function split_filepath(path)
    local normalized_path = normalize_path(path)
    local normalized_cwd = normalize_cwd()
    local filename = normalized_path:match("[^/]+$")

    if is_subdirectory(normalized_cwd, normalized_path) then
      local stripped_path = normalized_path:sub(#normalized_cwd + 1, -(#filename + 1))
      return stripped_path, filename
    else
      local stripped_path = normalized_path:sub(1, -(#filename + 1))
      return stripped_path, filename
    end
  end

  local function path_display(_, path)
    local stripped_path, filename = split_filepath(path)
    if filename == stripped_path or stripped_path == "" then
      return filename
    end
    return string.format("%s ~ %s", filename, stripped_path)
  end

  local opts = {
    defaults = {
      prompt_prefix = " 󱡴 ",
      selection_caret = "󰁔 ",
      path_display = path_display,
      mappings = {
        i = {
          ["<C-n>"] = actions.cycle_history_next,
          ["<C-p>"] = actions.cycle_history_prev,

          ["<C-j>"] = actions.move_selection_next,
          ["<C-k>"] = actions.move_selection_previous,

          ["<C-c>"] = actions.close,

          ["<Down>"] = actions.move_selection_next,
          ["<Up>"] = actions.move_selection_previous,

          ["<CR>"] = actions.select_default,
          ["<C-x>"] = actions.select_horizontal,
          ["<C-v>"] = actions.select_vertical,
          ["<C-t>"] = actions.select_tab,

          ["<C-u>"] = actions.preview_scrolling_up,
          ["<C-d>"] = actions.preview_scrolling_down,

          ["<PageUp>"] = actions.results_scrolling_up,
          ["<PageDown>"] = actions.results_scrolling_down,

          ["<Tab>"] = actions.toggle_selection + actions.move_selection_worse,
          ["<S-Tab>"] = actions.toggle_selection + actions.move_selection_better,
          ["<C-q>"] = actions.send_to_qflist + actions.open_qflist,
          ["<M-q>"] = actions.send_selected_to_qflist + actions.open_qflist,
          ["<C-l>"] = actions.complete_tag,
          ["<C-_>"] = actions.which_key, -- keys from pressing <C-/>
        },

        n = {
          ["<esc>"] = actions.close,
          ["<CR>"] = actions.select_default,
          ["<C-x>"] = actions.select_horizontal,
          ["<C-v>"] = actions.select_vertical,
          ["<C-t>"] = actions.select_tab,

          ["<Tab>"] = actions.toggle_selection + actions.move_selection_worse,
          ["<S-Tab>"] = actions.toggle_selection + actions.move_selection_better,
          ["<C-q>"] = actions.send_to_qflist + actions.open_qflist,
          ["<M-q>"] = actions.send_selected_to_qflist + actions.open_qflist,

          ["j"] = actions.move_selection_next,
          ["k"] = actions.move_selection_previous,
          ["H"] = actions.move_to_top,
          ["M"] = actions.move_to_middle,
          ["L"] = actions.move_to_bottom,

          ["<Down>"] = actions.move_selection_next,
          ["<Up>"] = actions.move_selection_previous,
          ["gg"] = actions.move_to_top,
          ["G"] = actions.move_to_bottom,

          ["<C-u>"] = actions.preview_scrolling_up,
          ["<C-d>"] = actions.preview_scrolling_down,

          ["<PageUp>"] = actions.results_scrolling_up,
          ["<PageDown>"] = actions.results_scrolling_down,

          ["?"] = actions.which_key,
        },
      },
    },
    pickers = {
      find_files = {
        hidden = true,
      },
    },
    extensions = {
      ["ui-select"] = {
        require("telescope.themes").get_dropdown({}),
      },
      media_files = {
        -- filetypes whitelist
        -- defaults to {"png", "jpg", "mp4", "webm", "pdf"}
        filetypes = { "png", "webp", "jpg", "jpeg" },
        find_cmd = "fd", -- find command (defaults to `fd`)
      },
    },
  }

  telescope.setup(opts)

  local keymap = require("utils.keymapping").global

  keymap("n", "<leader>ff", "<cmd>Telescope find_files<CR>", "[f]ind [f]iles in cwd")
  keymap("n", "<leader>fr", "<cmd>Telescope oldfiles<CR>", "[f]ind [r]ecent files")
  keymap("n", "<leader>fs", "<cmd>Telescope live_grep<CR>", "[f]ind [s]tring in cwd")
  keymap("n", "<leader>fc", "<cmd>Telescope grep_string<CR>", "[f]ind string under [c]ursor in cwd")
end

if not pcall(debug.getlocal, 4, 1) then
  M.setup()
end

return M
