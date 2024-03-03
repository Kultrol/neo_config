require('nvim-treesitter.configs').setup {
  highlight = {
    enable = true, -- enable highlighting for all file types
    disable = { "tex", "latex" }, -- disable for tex and latex file types
  },
}

