return {
  "nvim-lualine/lualine.nvim",
  dependencies = { "kyazdani42/nvim-web-devicons" },
  config = function()
    require('lualine').setup {
      options = {
        theme = 'tokyonight'
      },
      sections = {
        lualine_c = {
          {'filename'},
          {'%='},
        },
        lualine_x = {
          {
            'cwd',
            fmt = function()
              local cwd = vim.fn.getcwd()
              return cwd:gsub("^" .. os.getenv("HOME"), "~")
            end,
          },
        },
      }
    }
  end,
}
