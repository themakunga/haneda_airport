local M = {}

M.plugin = {
  "hedyhli/markdown-toc.nvim",
  ft = "markdown", -- Lazy load on markdown filetype
  cmd = { "Mtoc" }, -- Or, lazy load on "Mtoc" command
  opts = {
    -- Your configuration here (optional)
  },
  config = function()
    M.setup()
  end,
}

M.setup = function()
  local ok = require("utils.check-requires").check({ "mtoc" })
  if not ok then
    return
  end

  local mtoc = require("mtoc")

  local keymap = require("utils.keymapping").global

  mtoc.setup({
    headings = {
      before_toc = false,
      indent_size = 2,
      pattern = "^(##+)%s+(.+)$",
    },
    auto_update = {
      enabled = true,
      -- This allows the ToC to be refreshed silently on save for any markdown file.
      -- The refresh operation uses `Mtoc update` and does NOT create the ToC if
      -- it does not exist.
      events = { "BufWritePre" },
      pattern = "*.{md,mdown,mkd,mkdn,markdown,mdwn}",
    },
  })

  keymap("n", "<leader>mti", "<cmd>Mtoc insert<cr>", "Markdown TOC insert on cursor position")
  keymap("n", "<leader>mtu", "<cmd>Mtoc update<cr>", "Markdown TOC update")
  keymap("n", "<leader>mtr", "<cmd>Mtoc remove<cr>", "Markdown TOC remove")
  keymap("n", "<leader>mdt", "<cmd>MdTocToggle<cr>", "View the table of contents.")
end

if not pcall(debug.getlocal, 4, 1) then
  M.setup()
end

return M
