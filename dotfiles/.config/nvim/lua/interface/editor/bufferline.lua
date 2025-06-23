local M = {}

M.plugin = {
  "akinsho/bufferline.nvim",
  version = "*",
  dependencies = {
    "nvim-tree/nvim-web-devicons",
    "folke/snacks.nvim",
  },
  config = function()
    M.setup()
  end,
}

M.setup = function()
  local ok = require("utils.check-requires").check({ "bufferline", "snacks" })

  if not ok then
    return
  end

  local Snacks = require("snacks")
  local bufferline = require("bufferline")

  local opts = {
    options = {
      -- stylua: ignore
      close_command = function(n) Snacks.bufdelete(n) end,
      -- stylua: ignore
      right_mouse_command = function(n) Snacks.bufdelete(n) end,
      umbers = "none", -- | "ordinal" | "buffer_id" | "both" | function({ ordinal, id, lower, raise }): string,
      middle_mouse_command = nil, -- can be a string | function, see "Mouse actions"
      -- NOTE: this plugin is designed with this icon in mind,
      -- and so changing this is NOT recommended, this is intended
      -- as an escape hatch for people who cannot bear it for whatever reason
      indicator_icon = "▎",
      buffer_close_icon = "",
      -- buffer_close_icon = '',
      modified_icon = "●",
      close_icon = "",
      -- close_icon = '',
      left_trunc_marker = "",
      right_trunc_marker = "",
      --- name_formatter can be used to change the buffer's label in the bufferline.
      --- Please note some names can/will break the
      --- bufferline so use this at your discretion knowing that it has
      --- some limitations that will *NOT* be fixed.
      -- name_formatter = function(buf)  -- buf contains a "name", "path" and "bufnr"
      --   -- remove extension from markdown files for example
      --   if buf.name:match('%.md') then
      --     return vim.fn.fnamemodify(buf.name, ':t:r')
      --   end
      -- end,
      max_name_length = 30,
      max_prefix_length = 30, -- prefix used when a buffer is de-duplicated
      tab_size = 21,
      diagnostics = false, -- | "nvim_lsp" | "coc",
      diagnostics_update_in_insert = false,
      always_show_bufferline = true,

      offsets = { { filetype = "NvimTree", text = "", padding = 1 } },
      highlights = {
        fill = {
          guifg = { attribute = "fg", highlight = "#ff0000" },
          guibg = { attribute = "bg", highlight = "TabLine" },
        },
        background = {
          guifg = { attribute = "fg", highlight = "TabLine" },
          guibg = { attribute = "bg", highlight = "TabLine" },
        },

        -- buffer_selected = {
        --   guifg = {attribute='fg',highlight='#ff0000'},
        --   guibg = {attribute='bg',highlight='#0000ff'},
        --   gui = 'none'
        --   },
        buffer_visible = {
          guifg = { attribute = "fg", highlight = "TabLine" },
          guibg = { attribute = "bg", highlight = "TabLine" },
        },

        close_button = {
          guifg = { attribute = "fg", highlight = "TabLine" },
          guibg = { attribute = "bg", highlight = "TabLine" },
        },
        close_button_visible = {
          guifg = { attribute = "fg", highlight = "TabLine" },
          guibg = { attribute = "bg", highlight = "TabLine" },
        },
        -- close_button_selected = {
        --   guifg = {attribute='fg',highlight='TabLineSel'},
        --   guibg ={attribute='bg',highlight='TabLineSel'}
        --   },

        tab_selected = {
          guifg = { attribute = "fg", highlight = "Normal" },
          guibg = { attribute = "bg", highlight = "Normal" },
        },
        tab = {
          guifg = { attribute = "fg", highlight = "TabLine" },
          guibg = { attribute = "bg", highlight = "TabLine" },
        },
        tab_close = {
          -- guifg = {attribute='fg',highlight='LspDiagnosticsDefaultError'},
          guifg = { attribute = "fg", highlight = "TabLineSel" },
          guibg = { attribute = "bg", highlight = "Normal" },
        },

        duplicate_selected = {
          guifg = { attribute = "fg", highlight = "TabLineSel" },
          guibg = { attribute = "bg", highlight = "TabLineSel" },
          gui = "italic",
        },
        duplicate_visible = {
          guifg = { attribute = "fg", highlight = "TabLine" },
          guibg = { attribute = "bg", highlight = "TabLine" },
          gui = "italic",
        },
        duplicate = {
          guifg = { attribute = "fg", highlight = "TabLine" },
          guibg = { attribute = "bg", highlight = "TabLine" },
          gui = "italic",
        },

        modified = {
          guifg = { attribute = "fg", highlight = "TabLine" },
          guibg = { attribute = "bg", highlight = "TabLine" },
        },
        modified_selected = {
          guifg = { attribute = "fg", highlight = "Normal" },
          guibg = { attribute = "bg", highlight = "Normal" },
        },
        modified_visible = {
          guifg = { attribute = "fg", highlight = "TabLine" },
          guibg = { attribute = "bg", highlight = "TabLine" },
        },

        separator = {
          guifg = { attribute = "bg", highlight = "TabLine" },
          guibg = { attribute = "bg", highlight = "TabLine" },
        },
        separator_selected = {
          guifg = { attribute = "bg", highlight = "Normal" },
          guibg = { attribute = "bg", highlight = "Normal" },
        },
        -- separator_visible = {
        --   guifg = {attribute='bg',highlight='TabLine'},
        --   guibg = {attribute='bg',highlight='TabLine'}
        --   },
        indicator_selected = {
          guifg = { attribute = "fg", highlight = "LspDiagnosticsDefaultHint" },
          guibg = { attribute = "bg", highlight = "Normal" },
        },
      },
    },
  }

  bufferline.setup(opts)

  vim.api.nvim_create_autocmd({ "BufAdd", "BufDelete" }, {
    callback = function()
      vim.schedule(function()
        pcall(bufferline)
      end)
    end,
  })

  local keymap = require("utils.keymapping").global

  keymap("n", "<leader>bp", "<Cmd>BufferLineTogglePin<CR>", "Toggle Pin")
  keymap("n", "<leader>bP", "<Cmd>BufferLineGroupClose ungrouped<CR>", "Delete Non-Pinned Buffers")
  keymap("n", "<leader>br", "<Cmd>BufferLineCloseRight<CR>", "Delete Buffers to the Right")
  keymap("n", "<leader>bl", "<Cmd>BufferLineCloseLeft<CR>", "Delete Buffers to the Left")
  keymap("n", "<S-h>", "<cmd>BufferLineCyclePrev<cr>", "Prev Buffer")
  keymap("n", "<S-l>", "<cmd>BufferLineCycleNext<cr>", "Next Buffer")
  keymap("n", "[b", "<cmd>BufferLineCyclePrev<cr>", "Prev Buffer")
  keymap("n", "]b", "<cmd>BufferLineCycleNext<cr>", "Next Buffer")
  keymap("n", "[B", "<cmd>BufferLineMovePrev<cr>", "Move buffer prev")
  keymap("n", "]B", "<cmd>BufferLineMoveNext<cr>", "Move buffer next")
end

if not pcall(debug.getlocal, 4, 1) then
  M.setup()
end

return M
