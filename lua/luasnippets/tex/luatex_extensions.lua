local ls = require("luasnip")
    local s = ls.snippet
    local d = ls.dynamic_node
    local fmta = require("luasnip.extras.fmt").fmta

local helpers = require('../../util_helper')
local get_visual = helpers.get_visual
local line_begin = require("luasnip.extras.expand_conditions").line_begin

-- Return snippet tables
return
  {
    -- tex.sprint
    s({trig = "tpp", snippetType="autosnippet"},
      fmta(
      [[
        tex.sprint(<>)
      ]],
        {
          d(1, get_visual),
        }
      )
    ),
  }
