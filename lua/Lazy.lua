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
local ok_lazy_setup, lazy_setup_err = pcall(require("lazy").setup, "plugins")
if not ok_lazy_setup then
    print("Error setting up lazy plugins: " .. lazy_setup_err .. " (in Lazy Plugin Caller)")
end

-- Load configs
local ok_configs, configs_err = pcall(require, 'configs')
if not ok_configs then
    print("Error loading configs: " .. configs_err .. " (in configs)")
end

-- Load snippets from ~/.config/nvim/LuaSnip/
local ok_snippets, snippets_loader = pcall(require, "luasnip.loaders.from_lua")
if ok_snippets then
    local ok_load, snippets_err = pcall(snippets_loader.load, { paths = { "~/.config/nvim/lua/luasnippets" } })
    if not ok_load then
        print("Error loading LuaSnip snippets: " .. snippets_err .. " (in LuaSnip)")
    end
else
    print("Error requiring LuaSnip loader: " .. snippets_loader .. " (in LuaSnip)")
end
