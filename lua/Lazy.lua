-- Lazy Plugin Manager Bootstrapper
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "--branch=stable",
    "https://github.com/folke/lazy.nvim.git",
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

-- Define the plugin specifications using imports from the plugins directory
local plugins = {
  spec = {
    { import = "plugins.appearance" },
    { import = "plugins.file_utils" },
    { import = "plugins.git" },
    { import = "plugins.latex_markdown" },
    { import = "plugins.lsp" },
    { import = "plugins.orgmode" },
    { import = "plugins.snippets" },
    { import = "plugins.telescope" },
    { import = "plugins.treesitter" },
  },
}

-- Set up lazy.nvim with the plugin specifications
local ok_lazy_setup, lazy_setup_err = pcall(require("lazy").setup, plugins)
if not ok_lazy_setup then
  vim.notify("Error setting up lazy plugins: " .. lazy_setup_err, vim.log.levels.ERROR)
end
