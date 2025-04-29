
-----------------------------
-- Basic Editor Options
-----------------------------
vim.opt.relativenumber = true   -- Show relative line numbers
vim.opt.number = true           -- Show absolute line number on current line
vim.g.mapleader = ","           -- Set leader key to comma
vim.opt.autochdir = true        -- Automatically change directory to the file being edited

-----------------------------
-- Lazy Plugin Manager Setup
-----------------------------
local ok_lazy, lazy_err = pcall(require, 'Lazy')
if not ok_lazy then
  vim.notify("Error loading Lazy plugin manager: " .. lazy_err, vim.log.levels.ERROR)
end

-----------------------------
-- Load Keymaps
-----------------------------
local ok_keymaps, keymaps_err = pcall(require, 'keymaps.mappings')
if not ok_keymaps then
  vim.notify("Error loading keymaps: " .. keymaps_err, vim.log.levels.ERROR)
end

-----------------------------
-- VimTeX Configuration
-----------------------------
-- Set viewer and compiler options for LaTeX documents.
vim.g.vimtex_view_method = 'skim'
vim.g.vimtex_view_general_viewer = 'okular'
vim.g.vimtex_view_general_options = '--unique file:@pdf#src:@line@tex'
vim.g.vimtex_compiler_method = 'latexmk'

-----------------------------
-- Auto-Theme Based on Time of Day
-----------------------------
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

-- Apply theme immediately.
autoChangeTheme()

-- Create a timer to update the theme every hour.
local timer = vim.loop.new_timer()
timer:start(
  0,                            -- Initial delay: 0 ms
  60 * 60 * 1000,               -- Repeat every hour (60 min * 60 sec * 1000 ms)
  vim.schedule_wrap(function()
    autoChangeTheme()
  end)
)

-----------------------------
-- Additional Editor Options
-----------------------------
vim.opt.numberwidth = 5         -- Set width of the number column
vim.opt.foldcolumn = "2"        -- Enable a fold column (useful for code folding)
vim.opt.wrap = true             -- Enable line wrapping
vim.opt.textwidth = 80          -- Set maximum text width for automatic formatting
vim.opt.linebreak = true        -- Wrap lines at convenient breakpoints
vim.opt.wrapmargin = 2          -- Additional margin for line wrapping
vim.opt.signcolumn = "yes:1"     -- Always show sign column with fixed width
vim.cmd("cd ~")


vim.keymap.set('n', '<F5>', require('dap').continue)          -- Start/continue debugging
vim.keymap.set('n', '<F10>', require('dap').step_over)        -- Step over
vim.keymap.set('n', '<F11>', require('dap').step_into)        -- Step into
vim.keymap.set('n', '<leader>b', require('dap').toggle_breakpoint) -- Toggle breakpoint
