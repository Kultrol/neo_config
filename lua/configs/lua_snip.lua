-- LuaSnip Setup with Lua-centric Configurations
local luasnip = require("luasnip")
local vim = vim -- Ensure `vim` is accessible in Lua

-- Set LuaSnip config
luasnip.config.set_config({
    enable_autosnippets = true,
    update_events = 'TextChanged,TextChangedI',
    store_selection_keys = "<Tab>",
})

-- Key Mapping with Lua
local function map(mode, lhs, rhs, opts)
    local options = {silent = true, noremap = true}
    if opts then options = vim.tbl_extend('force', options, opts) end
    vim.api.nvim_set_keymap(mode, lhs, rhs, options)
end

-- Use Tab to expand and jump through snippets or as a regular Tab
map('i', '<Tab>', "luasnip#expand_or_jumpable() ? '<Plug>luasnip-expand-or-jump' : '<Tab>'", {expr = true})
map('s', '<Tab>', "luasnip#jumpable(1) ? '<Plug>luasnip-jump-next' : '<Tab>'", {expr = true})

-- Use Shift-Tab to jump backwards through snippets
map('i', '<S-Tab>', "luasnip#jumpable(-1) ? '<Plug>luasnip-jump-prev' : '<S-Tab>'", {expr = true})
map('s', '<S-Tab>', "luasnip#jumpable(-1) ? '<Plug>luasnip-jump-prev' : '<S-Tab>'", {expr = true})

-- Load Snippets Function
local function load_snippets(path)
    local snippets = vim.fn.globpath(path, "**/*.lua", false, true)
    for _, snippet_file in ipairs(snippets) do
        local module_name = snippet_file:match(".-lua/(.+).lua$"):gsub("/", ".")
        require(module_name)
    end
end

-- Load your snippets
load_snippets(vim.fn.stdpath("config") .. "/lua/luasnippets")

-- Consider adding more Lua-centric features or configurations here

