local configs_to_load = {
    "auto_completion",
    "cmp",
    "lsp_config",
    "lua_snip",
    "lualine",
    "markdown_preview",
    "nvim_tree",
    "org_mode",
    "telescope",
    "treesitter",
    "VimTex", -- Ensure the names match your actual config files
    "indent_blank",

}

for _, config in ipairs(configs_to_load) do
    require('configs.' .. config)
end

