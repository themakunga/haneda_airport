local M = {}

M.plugin = {
  "nvim-treesitter/nvim-treesitter",
  build = ":TSUpdate",
  cmd = { "TSUpdateSync", "TSUpdate", "TSInstall" },
  lazy = vim.fn.argc(-1) == 0, -- load treesitter early when opening a file from the cmdline
  config = function()
    M.setup()
  end,
}

M.setup = function()
  local ok = require("utils.check-requires").check({
    "nvim-treesitter",
  })
  if not ok then
    return
  end

  local treesitter_configs = require("nvim-treesitter.configs")

  treesitter_configs.setup({
    highlight = {
      enable = true,
      additional_vim_regex_highlighting = false,
    },
    indent = { enable = true },

    autotag = { enable = true },
    ensure_installed = {
      "lua",
      "bash",
      "comment",
      "csv",
      "css",
      "diff",
      "dockerfile",
      "dot",
      "func",
      "git_config",
      "git_rebase",
      "gitattributes",
      "gitcommit",
      "gitignore",
      "go",
      "gomod",
      "gosum",
      "gowork",
      "gpg",
      "graphql",
      "groovy",
      "hcl",
      "helm",
      "hjson",
      "hlsl",
      "html",
      "http",
      "javascript",
      "ini",
      "jsdoc",
      "jq",
      "json",
      "json5",
      "jsonc",
      "luadoc",
      "markdown",
      "markdown_inline",
      "mermaid",
      "nix",
      "passwd",
      "perl",
      "php",
      "pod",
      "prisma",
      "pug",
      "python",
      "regex",
      "ruby",
      "rust",
      "scheme",
      "scss",
      "slang",
      "sql",
      "ssh_config",
      "terraform",
      "toml",
      "tsx",
      "tsv",
      "typescript",
      "vim",
      "vue",
      "xml",
      "yaml",
    },
    auto_install = true,

    incremental_selection = {
      enable = true,
      keymaps = {
        init_selection = "<C-space>",
        node_incremental = "<C-space>",
        scope_incremental = false,
        node_decremental = "<bs>",
      },
    },
  })
end

if not pcall(debug.getlocal, 4, 1) then
  M.setup()
end

return M
