local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

local ok = require("utils.check-requires").check({ "lazy" })
if not ok then
  return
end

local lazy = require("lazy")

require("config").init()

-- main configuration
lazy.setup({

  -- basic setup
  -- checker = {
  --   notify = false,
  --   enabled = true,
  -- },
  -- change_detection = {
  --   notify = false,
  -- },

  require("interface").init(),
  require("plugins").init(),
})
