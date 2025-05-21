local M = {}

M.init = function()
  return {
    require("plugins.git.gitsigns").plugin,
    require("plugins.git.lazygit").plugin,
    require("plugins.git.gist").plugin,
    require("plugins.format.conform").plugin,
    require("plugins.format.cmp").plugin,
    require("plugins.format.mason").plugin,
    require("plugins.format.autopairs").plugin,
    require("plugins.format.lsp-config").plugin,
    require("plugins.markdown.markview").plugin,
    require("plugins.markdown.markdown-toc").plugin,
    require("plugins.markdown.markdown-preview").plugin,
    require("plugins.markdown.md-section-number").plugin,
    require("plugins.markdown.obsidian").plugin,
    require("plugins.management.pomo").plugin,
    require("plugins.management.project").plugin,
    require("plugins.terminal.toggleterm").plugin,
  }
end

return M
