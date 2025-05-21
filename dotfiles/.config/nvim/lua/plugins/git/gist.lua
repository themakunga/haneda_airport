local M = {}

M.plugin = {

  "Rawnly/gist.nvim",
  cmd = { "GistCreate", "GistCreateFromFile", "GistsList" },
  dependencies = {
    {
      "samjwill/nvim-unception",
      lazy = false,
      init = function()
        vim.g.unception_block_while_host_edits = true
      end,
    },
  },
  config = function()
    M.setup()
  end,
}

M.setup = function()
  local ok = require("utils.check-requires").check({ "gist" })
  if not ok then
    return
  end

  local gist = require("gist")

  local opts = {
    private = true, -- All gists will be private, you won't be prompted again
    clipboard = "+", -- The registry to use for copying the Gist URL
    split_direction = "vertical", -- default: "vertical" - set window split orientation when opening a gist ("vertical" or "horizontal")
    gh_cmd = "gh",
    list = {
      -- If there are multiple files in a gist you can scroll them,
      -- with vim-like bindings n/p next previous
      mappings = {
        next_file = "<C-n>",
        prev_file = "<C-p>",
      },
    },
  }

  gist.setup(opts)
end

if not pcall(debug.getlocal, 4, 1) then
  M.setup()
end

return M
