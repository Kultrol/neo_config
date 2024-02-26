local configs_to_load = {
    "config_auto_completion",
    "config_cmp",
    "config_lsp_config",
    "config_lua_snip",
    "config_lualine",
    "config_markdown_preview",
    "config_nvim_tree",
    "config_org_mode",
    "config_telescope",
    "config_treesitter",
    "config_VimTex", -- Ensure the names match your actual config files
}

for _, config in ipairs(configs_to_load) do
    require('configs.' .. config)
end

