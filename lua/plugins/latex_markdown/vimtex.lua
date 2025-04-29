return {
  "lervag/vimtex",
  ft = "tex",
  config = function()
    vim.g.vimtex_syntax_enabled = 1
    vim.g.vimtex_imaps_enabled = 0
    vim.g.vimtex_view_method = 'skim'
    vim.g.vimtex_view_general_viewer = 'okular'
    vim.g.vimtex_view_general_options = '--unique file:@pdf#src:@line@tex'
    vim.g.vimtex_compiler_method = 'latexmk'
    vim.g.vimtex_compiler_latexmk = {
      build_dir = 'build',
      callback = 1,
      continuous = 1,
      executable = 'latexmk',
      options = {
        '-pdf',
        '-shell-escape',
        '-verbose',
        '-file-line-error',
        '-synctex=1',
        '-interaction=nonstopmode',
      },
    }
    vim.g.vimtex_clean_enabled = 1
    vim.g.vimtex_clean_ignore = { '*.pdf', '*.tex' }
    vim.g.vimtex_clean_exts = {
      'aux', 'log', 'out', 'fls', 'fdb_latexmk', 'toc', 'synctex.gz',
      'nav', 'snm', 'vrb', 'xdv', 'bbl', 'blg', 'brf', 'run.xml'
    }
  end,
}
