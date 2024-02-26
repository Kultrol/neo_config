return {
    -- vim-fugitive for Git commands within Neovim
    {"tpope/vim-fugitive"},

    -- gitsigns.nvim for Git integration features like signs and hovers
    {
        "lewis6991/gitsigns.nvim",
        config = function()
            require('gitsigns').setup()
        end,
    },

    -- telescope-github.nvim for GitHub integration with Telescope
    {
        "nvim-telescope/telescope-github.nvim",
        dependencies = {"nvim-telescope/telescope.nvim"}
    },
}

