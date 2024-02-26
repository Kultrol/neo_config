-- Lualine Configuration
require('lualine').setup {
  sections = {
    lualine_c = {
      {'filename'},
      {'%='}, -- Centers the remaining components
    },
    lualine_x = {
      {
        'cwd', -- Custom component that shows the current working directory
        fmt = function()
          local cwd = vim.fn.getcwd()
          return cwd:gsub("^" .. os.getenv("HOME"), "~") -- Replace home path with ~
        end,
      },
    },
  }
}
