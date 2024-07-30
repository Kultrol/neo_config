local ls = require("luasnip")
    local s = ls.snippet
    local i = ls.insert_node
    local f = ls.function_node
    local d = ls.dynamic_node
  local t = ls.text_node
    local extras = require("luasnip.extras")
    local rep = extras.rep
    local fmta = require("luasnip.extras.fmt").fmta



local helpers = require('../../util_helper')
local get_visual = helpers.get_visual

-- Math context detection
local tex = {}
tex.in_mathzone = function() return vim.fn['vimtex#syntax#in_mathzone']() == 1 end
tex.in_text = function() return not tex.in_mathzone() end



local line_begin = require("luasnip.extras.expand_conditions").line_begin

return{
	s({trig = "([^%a])ovl", wordTrig = false, regTrig = true, snippetType="autosnippet"},
    fmta(
      "<>\\overline{<>}",
      {
        f( function(_, snip) return snip.captures[1] end ),
        d(1, get_visual),
      }
    ),
    {condition = tex.in_mathzone}
  ),
  -- SUBSET, i.e. \subset
  s({trig = "sbb", snippetType="autosnippet"},
    {
      t("\\subset "),
    },
    {
	    condition = tex.in_mathzone
    }),
	s({trig = "unn", snippetType="autosnippet"},
	{
		t("\\cup"),
	}, {condition = tex.in_mathzone}),
	s({trig = "inter", snippetType="autosnippet"},
	{
		t("\\cap"),
	}, {condition = tex.in_mathzone}),
--Piecewise Snippet
s({trig="piw", snippetType="autosnippet"},
      fmta( [[
      \[ {<>} = \begin{cases}
      {<>}, & {<>}\\
      {<>}, & {<>}
	\end{cases}
	\]
      ]],
        {
          i(1),
	  i(2),
	  i(3),
	  i(4),
	  i(5)
        }
      ),
      {condition = tex.in_mathzone}
    ),
}
