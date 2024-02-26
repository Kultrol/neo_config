--Lua Snips

require("luasnip").config.set_config({ -- Setting LuaSnip config

  -- Enable autotriggered snippets
  enable_autosnippets = true,

  -- Use Tab (or some other key if you prefer) to trigger visual selection
store_selection_keys = "<Tab>",
})


vim.cmd[[
  " Expand snippets or jump forward in insert mode with Tab
  imap <silent><expr> <Tab> luasnip#expand_or_jumpable() ? '<Plug>luasnip-expand-or-jump' : '<Tab>'
  " Jump forward through tabstops in insert and select mode with Control-j (to avoid conflicts with other mappings)
  imap <silent><expr> <C-j> luasnip#jumpable(1) ? '<Plug>luasnip-jump-next' : '<C-j>'
  smap <silent><expr> <C-j> luasnip#jumpable(1) ? '<Plug>luasnip-jump-next' : '<C-j>'
  " Jump backward through snippet tabstops with Shift-Tab
  imap <silent><expr> <S-Tab> luasnip#jumpable(-1) ? '<Plug>luasnip-jump-prev' : '<S-Tab>'
  smap <silent><expr> <S-Tab> luasnip#jumpable(-1) ? '<Plug>luasnip-jump-prev' : '<S-Tab>'
  " Cycle through choices with Control-k (to avoid overloading Control-f)
  imap <silent><expr> <C-k> luasnip#choice_active() ? '<Plug>luasnip-next-choice' : '<C-k>'
  smap <silent><expr> <C-k> luasnip#choice_active() ? '<Plug>luasnip-next-choice' : '<C-k>'
]]

local function load_snippets(path)
  local snippets = vim.fn.globpath(path, "**/*.lua", false, true)
  for _, snippet_file in ipairs(snippets) do
    -- Convert the absolute file path to a module name
    local module_name = snippet_file:match(".-lua/(.+).lua$"):gsub("/", ".")
    require(module_name)
  end
end

load_snippets(vim.fn.stdpath("config") .. "/lua/luasnippets")

