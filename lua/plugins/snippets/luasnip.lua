return {
  "L3MON4D3/LuaSnip",
  dependencies = {
    "rafamadriz/friendly-snippets",
  },
  event = "InsertEnter",
  config = function()
    local luasnip = require("luasnip")
    require("luasnip").filetype_extend("plaintex", {"tex"})

    luasnip.config.set_config({
      history = true,
      enable_autosnippets = true,
      update_events = "TextChanged,TextChangedI",
      store_selection_keys = "<Tab>",
    })

    local function map(mode, lhs, rhs, opts)
      local options = {silent = true, noremap = true}
      if opts then options = vim.tbl_extend('force', options, opts) end
      vim.api.nvim_set_keymap(mode, lhs, rhs, options)
    end

    map('i', '<Tab>', "luasnip#expand_or_jumpable() ? '<Plug>luasnip-expand-or-jump' : '<Tab>'", {expr = true})
    map('s', '<Tab>', "luasnip#jumpable(1) ? '<Plug>luasnip-jump-next' : '<Tab>'", {expr = true})
    map('i', '<S-Tab>', "luasnip#jumpable(-1) ? '<Plug>luasnip-jump-prev' : '<S-Tab>'", {expr = true})
    map('s', '<S-Tab>', "luasnip#jumpable(-1) ? '<Plug>luasnip-jump-prev' : '<S-Tab>'", {expr = true})

    require("luasnip.loaders.from_lua").load({ paths = { vim.fn.stdpath("config") .. "/lua/luasnippets" } })
  end,
}
