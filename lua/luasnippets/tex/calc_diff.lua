local ls = require("luasnip")
    local s = ls.snippet
    local t = ls.text_node
    local i = ls.insert_node
    local f = ls.function_node
    local d = ls.dynamic_node
    local fmta = require("luasnip.extras.fmt").fmta

local helpers = require('../../util_helper')
local get_visual = helpers.get_visual

-- Math context detection 
local tex = {}
tex.in_mathzone = function ()
    local in_math = vim.fn['vimtex#syntax#in_mathzone']() == 1
    return in_math
end


tex.in_text = function() return not tex.in_mathzone() end

return{
	  -- DERIVATIVE with denominator only
  s({trig = "([^%a])dV", wordTrig = false, regTrig = true, snippetType="autosnippet"},
    fmta(
      "<>\\dvOne{<>}",
      {
        f( function(_, snip) return snip.captures[1] end ),
        d(1, get_visual),
      }
    ),
    {condition = tex.in_mathzone}
  ),
  -- DERIVATIVE with numerator and denominator
  s({trig = "([^%a])dvv", wordTrig = false, regTrig = true, snippetType="autosnippet"},
    fmta(
      "<>\\dv{<>}{<>}",
      {
        f( function(_, snip) return snip.captures[1] end ),
        i(1),
        i(2)
      }
    ),
    {condition = tex.in_mathzone}
  ),
  -- DERIVATIVE with numerator, denominator, and higher-order argument
  s({trig = "([^%a])ddv", wordTrig = false, regTrig = true, snippetType="autosnippet"},
    fmta(
      "<>\\dvN{<>}{<>}{<>}",
      {
        f( function(_, snip) return snip.captures[1] end ),
        i(1),
        i(2),
        i(3),
      }
    ),
    {condition = tex.in_mathzone}
  ),
  -- PARTIAL DERIVATIVE with denominator only
  s({trig = "([^%a])pV", wordTrig = false, regTrig = true, snippetType="autosnippet"},
    fmta(
      "<>\\pdvOne{<>}",
      {
        f( function(_, snip) return snip.captures[1] end ),
        d(1, get_visual),
      }
    ),
    {condition = tex.in_mathzone}
  ),
  -- PARTIAL DERIVATIVE with numerator and denominator
  s({trig = "([^%a])pvv", wordTrig = false, regTrig = true, snippetType="autosnippet"},
    fmta(
      "<>\\pdv{<>}{<>}",
      {
        f( function(_, snip) return snip.captures[1] end ),
        i(1),
        i(2)
      }
    ),
    {condition = tex.in_mathzone}
  ),
  -- PARTIAL DERIVATIVE with numerator, denominator, and higher-order argument
  s({trig = "([^%a])ppv", wordTrig = false, regTrig = true, snippetType="autosnippet"},
    fmta(
      "<>\\pdvN{<>}{<>}{<>}",
      {
        f( function(_, snip) return snip.captures[1] end ),
        i(1),
        i(2),
        i(3),
      }
    ),
    {condition = tex.in_mathzone}
  ),
  -- SUM with lower limit
  s({trig = "([^%a])sM", wordTrig = false, regTrig = true, snippetType="autosnippet"},
    fmta(
      "<>\\sum_{<>}",
      {
        f( function(_, snip) return snip.captures[1] end ),
        i(1),
      }
    ),
    {condition = tex.in_mathzone}
  ),
  -- SUM with upper and lower limit
  s({trig = "([^%a])smm", wordTrig = false, regTrig = true, snippetType="autosnippet"},
    fmta(
      "<>\\sum_{<>}^{<>}",
      {
        f( function(_, snip) return snip.captures[1] end ),
        i(1),
        i(2),
      }
    ),
    {condition = tex.in_mathzone}
  ),
  -- INTEGRAL with upper and lower limit
  s({trig = "([^%a])intt", wordTrig = false, regTrig = true, snippetType="autosnippet"},
    fmta(
      "<>\\int_{<>}^{<>}",
      {
        f( function(_, snip) return snip.captures[1] end ),
        i(1),
        i(2),
      }
    ),
    {condition = tex.in_mathzone}
  ),
  -- INTEGRAL from positive to negative infinity
  s({trig = "([^%a])intf", wordTrig = false, regTrig = true, snippetType="autosnippet"},
    fmta(
      "<>\\int_{\\infty}^{\\infty}",
      {
        f( function(_, snip) return snip.captures[1] end ),
      }
    ),
    {condition = tex.in_mathzone}
  ),
   -- DIFFERENTIAL, i.e. \diff
  s({trig = "df", snippetType="autosnippet", priority=2000, snippetType="autosnippet"},
    {
      t("\\diff"),
    },
    {condition = tex.in_mathzone}
  ),
  -- BASIC INTEGRAL SYMBOL, i.e. \int
  s({trig = "in1", snippetType="autosnippet"},
    {
      t("\\int"),
    },
    {condition = tex.in_mathzone}
  ),
  -- DOUBLE INTEGRAL, i.e. \iint
  s({trig = "in2", snippetType="autosnippet"},
    {
      t("\\iint"),
    },
    {condition = tex.in_mathzone}
  ),
  -- TRIPLE INTEGRAL, i.e. \iiint
  s({trig = "in3", snippetType="autosnippet"},
    {
      t("\\iiint"),
    },
    {condition = tex.in_mathzone}
  ),
  -- CLOSED SINGLE INTEGRAL, i.e. \oint
  s({trig = "oi1", snippetType="autosnippet"},
    {
      t("\\oint"),
    },
    {condition = tex.in_mathzone}
  ),
  -- CLOSED DOUBLE INTEGRAL, i.e. \oiint
  s({trig = "oi2", snippetType="autosnippet"},
    {
      t("\\oiint"),
    },
    {condition = tex.in_mathzone}
  ),
  -- GRADIENT OPERATOR, i.e. \grad
  s({trig = "gdd", snippetType="autosnippet"},
    {
      t("\\grad "),
    },
    {condition = tex.in_mathzone}
  ),
  -- CURL OPERATOR, i.e. \curl
  s({trig = "cll", snippetType="autosnippet"},
    {
      t("\\curl "),
    },
    {condition = tex.in_mathzone}
  ),
  -- DIVERGENCE OPERATOR, i.e. \divergence
  s({trig = "DI", snippetType="autosnippet"},
    {
      t("\\div "),
    },
    {condition = tex.in_mathzone}
  ),
  -- LAPLACIAN OPERATOR, i.e. \laplacian
  s({trig = "laa", snippetType="autosnippet"},
    {
      t("\\laplacian "),
    },
    {condition = tex.in_mathzone}
  ),
}
