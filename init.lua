-- Set options
vim.opt.relativenumber = true
vim.g.mapleader = ","

-- Lazy Plugin Manager
local ok_lazy, lazy_err = pcall(require, 'Lazy')
if not ok_lazy then
    print("Error loading Lazy plugin manager: " .. lazy_err)
end

-- Keymaps
local ok_keymaps, keymaps_err = pcall(require, 'keymaps.mappings')
if not ok_keymaps then
    print("Error loading keymaps: " .. keymaps_err)
end

-- VimTex Configuration
vim.g.vimtex_view_method = 'skim'
vim.g.vimtex_view_general_viewer = 'okular'
vim.g.vimtex_view_general_options = '--unique file:@pdf#src:@line@tex'
vim.g.vimtex_compiler_method = 'latexmk'

-- Theme
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


-- Set number width (adjust this to create more space)
vim.o.numberwidth = 4

-- Enable a fold column (useful for padding and also for code folding)
vim.o.foldcolumn = "2"

-- Enable line numbers (if not already enabled)
vim.o.number = true
vim.o.relativenumber = true


vim.opt.wrap = true
vim.opt.textwidth = 80
vim.opt.linebreak = true
vim.opt.wrapmargin = 2
vim.opt.numberwidth = 5
vim.opt.signcolumn = "yes:1"

