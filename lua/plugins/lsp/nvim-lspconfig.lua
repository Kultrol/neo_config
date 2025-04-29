return {
  "neovim/nvim-lspconfig",
  dependencies = { "hrsh7th/cmp-nvim-lsp" },
  config = function()
    -- Set up LSP capabilities for autocompletion
    local capabilities = require('cmp_nvim_lsp').default_capabilities()

    -- Define key mappings for LSP actions
    local on_attach = function(client, bufnr)
      local opts = { buffer = bufnr, noremap = true, silent = true }
      vim.keymap.set('n', 'gd', vim.lsp.buf.definition, opts) -- Go to definition
      vim.keymap.set('n', 'K', vim.lsp.buf.hover, opts)       -- Show hover info
      -- Add more mappings as desired
    end

    -- Existing Lua LSP setup (keep this if already working)
    require('lspconfig').lua_ls.setup{
      capabilities = capabilities,
      on_attach = on_attach,
    }

    -- C++ LSP setup with clangd
    require('lspconfig').clangd.setup{
      capabilities = capabilities,
      on_attach = on_attach,
      cmd = { "clangd", "--background-index" }, -- Optional: speeds up indexing
    }
  end,
}
