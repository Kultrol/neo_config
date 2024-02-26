-- lua/keymaps/mappings.lua
local map = vim.api.nvim_set_keymap
local opts = { noremap = true, silent = true }

-- Example mappings
-- Telescope
map('n', '<leader>ff', '<cmd>Telescope find_files<cr>', opts)
map('n', '<leader>te', '<cmd>Telescope<cr>', opts)
map('n', '<leader>fg', '<cmd>Telescope live_grep<cr>', opts)

-- NvimTree
map('n', '<leader>nvt', '<cmd>NvimTreeToggle<cr>', opts)
map('n','<leader>nvf', '<cmd>NvimTreeRefresh<cr>', opts)

-- Markdown Preview
map('n', '<leader>mp', '<cmd>MarkdownPreview<cr>', opts)

-- VimWiki
map('n', '<leader>ww', '<cmd>VimWikiIndex<cr>', opts)

--VimTex
map('n', '<leader>lbc', '<cmd>VimtexCompile<cr>', opts)
map('n', '<leader>lv', '<cmd>VimtexView<cr>', opts)
map('n', '<leader>lec', '<cmd>VimtexStop<cr>', opts)
map('n', '<leader>lcc', '<cmd>VimtexClean<cr>', opts)
