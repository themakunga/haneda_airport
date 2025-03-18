local M = {}

M.mason_servers = {
  "ansiblels",
  "bashls",
  "cssls",
  "diagnosticls",
  "dockerls",
  "docker_compose_language_service",
  "dotls",
  "eslint",
  "emmet_ls",
  "glint",
  "gopls",
  "graphql",
  "groovyls",
  "html",
  "eslint",
  "jqls",
  "lua_ls",
  "markdown_oxide",
  "puppet",
  "prismals",
  "pylsp",
  "rust_analyzer",
  "sqlls",
  "somesass_ls",
  "taplo",
  "tailwindcss",
  "terraformls",
  "tflint",
  "ts_ls",
  "volar",
  "yamlls",
}

M.mason_tools_servers = {
  "prettier", -- prettier formatter
  "stylua", -- lua formatter
  "isort", -- python formatter
  "black", -- python formatter
  "pylint", -- python linter
  "eslint_d", -- js linter
  "tfsec",
  "tflint",
}

return M
