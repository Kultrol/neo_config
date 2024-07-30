-- LuaSnip Setup with Enhanced Configurations
local luasnip = require("luasnip")

-- Set LuaSnip configuration
luasnip.config.set_config({
    history = true, -- Keep snippet history for undo/redo
    enable_autosnippets = true, -- Automatically trigger autosnippets
    update_events = "TextChanged,TextChangedI", -- Update snippets on these events
    store_selection_keys = "<Tab>", -- Store selected text on tab key press
})

-- Key Mapping function for LuaSnip with Lua
local function map(mode, lhs, rhs, opts)
    local options = {silent = true, noremap = true}
    if opts then options = vim.tbl_extend('force', options, opts) end
    vim.api.nvim_set_keymap(mode, lhs, rhs, options)
end

-- Key mappings for navigating snippets
map('i', '<Tab>', "luasnip#expand_or_jumpable() ? '<Plug>luasnip-expand-or-jump' : '<Tab>'", {expr = true})
map('s', '<Tab>', "luasnip#jumpable(1) ? '<Plug>luasnip-jump-next' : '<Tab>'", {expr = true})
map('i', '<S-Tab>', "luasnip#jumpable(-1) ? '<Plug>luasnip-jump-prev' : '<S-Tab>'", {expr = true})
map('s', '<S-Tab>', "luasnip#jumpable(-1) ? '<Plug>luasnip-jump-prev' : '<S-Tab>'", {expr = true})

-- Function to load snippets from a specified path
local function load_snippets(path)
    local snippets = vim.fn.globpath(path, "**/*.lua", false, true)
    for _, snippet_file in ipairs(snippets) do
        local module_name = snippet_file:match(".-lua/(.+).lua$"):gsub("/", ".")
        require(module_name)
    end
end

-- Load snippets from the specified directory
load_snippets(vim.fn.stdpath("config") .. "/lua/luasnippets")

-- Additional LuaSnip configurations or features can be added here
