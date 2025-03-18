local M = {}

M.global = function(mode, command, func, desc)
  local set = vim.keymap.set

  local opts = {
    silent = true,
    noremap = true,
    desc = desc or "",
  }

  set(mode, command, func, opts)
end

M.buffer = function(bufnr, mode, command, func, desc)
  local set = vim.keymap.set

  local opts = {
    desc = desc,
    buffer = bufnr,
  }

  set(mode, command, func, opts)
end

return M
