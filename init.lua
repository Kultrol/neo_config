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


