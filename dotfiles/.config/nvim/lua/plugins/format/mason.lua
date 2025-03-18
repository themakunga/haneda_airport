local M = {}

M.plugin = {
  "williamboman/mason.nvim",
  dependencies = {
    "williamboman/mason-lspconfig.nvim",
    "WhoIsSethDaniel/mason-tool-installer.nvim",
  },
  build = ":MasonUpdate",
  config = function()
    M.setup()
  end,
}

M.setup = function()
  local ok = require("utils.check-requires").check({ "mason", "mason-lspconfig", "mason-tool-installer" })
  if not ok then
    return
  end
  local mason = require("mason")
  local mason_lspconfig = require("mason-lspconfig")
  local mason_tool_installer = require("mason-tool-installer")

  local servers = require("plugins.format.common").mason_servers
  local tools_servers = require("plugins.format.common").mason_tools_servers

  local ui_opts = {
    border = "none",
    icons = {
      package_installed = "✓",
      package_pending = "➜",
      package_uninstalled = "✗",
    },
  }

  local mason_settings = {
    ui = ui_opts,
    log_level = vim.log.levels.INFO,
    max_concurrent_installers = 4,
  }

  local mason_lspconfig_settings = {
    ensure_installed = servers,
    handlers = {
      function(server_name)
        require("lspconfig")[server_name].setup({})
      end,
    },
  }

  local mason_tool_installer_settings = {
    ensure_installed = tools_servers,
  }

  mason.setup(mason_settings)
  mason_lspconfig.setup(mason_lspconfig_settings)
  mason_tool_installer.setup(mason_tool_installer_settings)
end

if not pcall(debug.getlocal, 4, 1) then
  M.setup()
end

return M
