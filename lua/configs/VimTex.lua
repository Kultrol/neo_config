-- config_vimtex.lua
vim.g.vimtex_syntax_enabled = 1 -- Ensure syntax features are enabled
vim.g.vimtex_imaps_enabled = 0

-- VimTex Configuration
vim.g.vimtex_view_method = 'skim'
vim.g.vimtex_view_general_viewer = 'okular'
vim.g.vimtex_view_general_options = '--unique file:@pdf#src:@line@tex'
vim.g.vimtex_compiler_method = 'latexmk'

