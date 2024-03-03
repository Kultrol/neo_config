-- Set options
vim.opt.relativenumber = true
vim.g.mapleader = ","

require('Lazy')

-- Keymaps
require('keymaps.mappings')


-- VimTex Configuration
vim.g.vimtex_view_method = 'skim'
vim.g.vimtex_view_general_viewer = 'okular'
vim.g.vimtex_view_general_options = '--unique file:@pdf#src:@line@tex'
vim.g.vimtex_compiler_method = 'latexmk'

--Theme
vim.cmd[[colorscheme tokyonight]]

local function autoChangeTheme()
    local hour = os.date("*t").hour
    local lightTheme = 'tokyonight-day'
    local darkTheme = 'tokyonight'

    if hour >= 7 and hour < 18 then
        vim.cmd("colorscheme " .. lightTheme)
    else
        vim.cmd("colorscheme " .. darkTheme)
    end
end

autoChangeTheme()

local timer = vim.loop.new_timer()
timer:start(0, 60000 * 60, vim.schedule_wrap(function()
    autoChangeTheme()
end))


