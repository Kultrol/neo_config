return {
  "nvim-treesitter/nvim-treesitter",
  build = ":TSUpdate",
  config = function()
    require('nvim-treesitter.configs').setup({
      ensure_installed = { "c", "cpp" },
      highlight = {
        enable = true,
        disable = { "tex", "latex" },
      },
      indent = {
        enable = true,
      },
    })
  end,
}
