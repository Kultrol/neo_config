-- Lazy Plugin Manager Bootstraper
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    lazypath,
    "--branch=stable", -- latest stable release
  })
end
vim.opt.rtp:prepend(lazypath)


-- Lazy Plugin Caller
require("lazy").setup("plugins")


require('configs')
