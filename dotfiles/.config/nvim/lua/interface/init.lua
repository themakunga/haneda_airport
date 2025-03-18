local M = {}

M.init = function()
  return {
    require("interface.theme.tokionight").plugin,
    require("interface.welcome.alpha").plugin,
    require("interface.tree-view.nvim-tree").plugin,
    require("interface.editor.snacks").plugin,
    require("interface.editor.bufferline").plugin,
    require("interface.editor.telescope").plugin,
    require("interface.editor.treesitter").plugin,
    require("interface.editor.lualine").plugin,
    require("interface.editor.minimap").plugin,
    require("interface.editor.indent-blankline").plugin,
    require("interface.editor.whichkey").plugin,
    require("interface.editor.comments").plugin,
    require("interface.editor.todo-comments").plugin,
    require("interface.editor.log-highlight").plugin,
    require("interface.editor.tssorter").plugin,
    require("interface.notifications.noice").plugin,
    require("interface.notifications.trouble").plugin,
  }
end

return M
