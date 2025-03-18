local M = {}

M.plugin = {
  "stevearc/conform.nvim",
  event = { "BufReadPre", "BufNewFile" },
  config = function()
    M.setup()
  end,
}

M.setup = function()
  local ok = require("utils.check-requires").check({ "conform" })
  if not ok then
    return
  end

  local conform = require("conform")
  local prettier = { { "prettierd", "prettier" } }
  conform.setup({
    formatters_by_ft = {
      javascript = prettier,
      typescript = prettier,
      javascriptreact = prettier,
      typescriptreact = prettier,
      svelte = prettier,
      css = prettier,
      html = prettier,
      json = prettier,
      yaml = prettier,
      markdown = prettier,
      graphql = prettier,
      liquid = prettier,
      lua = { "stylua" },
      python = { "isort", "black" },
      terraform = { "terraform_fmt" },
      hcl = { "packer_fmt" },
      tf = { "terrraform_fmt" },
      ["terraform-vars"] = { "terraform_fmt" },
    },
    format_on_save = {
      timeout_ms = 500,
      lsp_format = "fallback",
    },
    prettier = {
      config_command = "--config",
      config_names = {
        ".prettierrc",
        ".prettierrc.json",
        ".prettierrc.yml",
        ".prettierrc.yaml",
        ".prettierrc.yaml",
        ".prettierrc.json5",
        ".prettierrc.js",
        ".editorconfig",
      },
      config_path = ".prettierrc.json",
    },
  })

  local km = require("utils.keymapping").global

  km({ "n", "v" }, "<leader>f", function()
    conform.format({
      lsp_fallback = true,
      async = false,
      timeout_ms = 500,
    })
  end, "Format file or range (in visual mode)")
end

if not pcall(debug.getlocal, 4, 1) then
  M.setup()
end

return M
