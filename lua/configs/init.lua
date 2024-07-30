local configs_to_load = {
    "auto_completion", -- https://github.com/nvim-lua/completion-nvim
    "auto_pairs", -- https://github.com/windwp/nvim-autopairs
    "cmp", -- https://github.com/nvimdev/epo.nvim
    "lsp_config", -- https://github.com/mfussenegger/nvim-lsp-compl
    "lua_snip", -- https://github.com/L3MON4D3/LuaSnip
    "lualine", -- https://github.com/nvim-lualine/lualine.nvim
    "markdown_preview", -- https://github.com/iamcco/markdown-preview.nvim
    "nvim_tree", -- https://github.com/kyazdani42/nvim-tree.lua
    "org_mode", -- https://github.com/kristijanhusak/orgmode.nvim
    "telescope", -- https://github.com/nvim-telescope/telescope.nvim
    "treesitter", -- https://github.com/nvim-treesitter/nvim-treesitter
    "VimTex", -- https://github.com/lervag/vimtex
    "indent_blank", -- https://github.com/lukas-reineke/indent-blankline.nvim
}

for _, config in ipairs(configs_to_load) do
    local ok, err = pcall(require, 'configs.' .. config)
    if not ok then
        print("Error loading config: " .. config .. " - " .. err)
    end
end
