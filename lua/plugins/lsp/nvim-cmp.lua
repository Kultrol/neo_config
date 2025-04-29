return {
  "hrsh7th/nvim-cmp",
  dependencies = {
    "hrsh7th/cmp-nvim-lsp",
    "hrsh7th/cmp-buffer",
    "hrsh7th/cmp-path",
  },
  config = function()
    local cmp = require('cmp')
    cmp.setup({
      sources = {
        { name = 'nvim_lsp' }, -- LSP completions (from clangd)
        { name = 'buffer' },   -- Buffer word completions
        { name = 'path' },     -- File path completions
      },
      mapping = {
        ['<CR>'] = cmp.mapping.confirm({ select = true }), -- Confirm selection
        ['<C-Space>'] = cmp.mapping.complete(),            -- Trigger completion
      },
    })
  end,
}
