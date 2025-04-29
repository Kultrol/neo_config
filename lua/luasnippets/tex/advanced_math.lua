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




return
{
    -- Modified SUPERSCRIPT for exponent notation
    s(
        { trig = "([%w%)%]%}])'e", wordTrig = false, regTrig = true, snippetType = "autosnippet" },
        fmta(
            "<>^{<>}",
            {
                f(function(_, snip) return snip.captures[1] end),
                d(1, get_visual),
            }
        ),
        { condition = tex.in_mathzone }
    ),
    -- Modified SUBSCRIPT for subscript notation
    s(
      { trig = "([%w%)%]%}]);b", wordTrig = false, regTrig = true, snippetType = "autosnippet" },
      fmta(
          "<>_{<>}",
          {
              f(function(_, snip) return snip.captures[1] end),
              d(1, get_visual),
          }
      ),
      { condition = tex.in_mathzone }
  ),
  -- TEXT SUBSCRIPT
  s({trig = 'sd', snippetType="autosnippet", wordTrig=false},
    fmta("_{\\mathrm{<>}}",
      { d(1, get_visual) }
    ),
    {condition = tex.in_mathzone}
  ),
   -- FRACTION
  s({trig = "([^%a])ff", wordTrig = false, regTrig = true, snippetType="autosnippet"},
    fmta(
      "<>\\frac{<>}{<>}",
      {
        f( function(_, snip) return snip.captures[1] end ),
        d(1, get_visual),
        i(2),
      }
    ),
    {condition = tex.in_mathzone}
  ),
  -- ANGLE
  s({trig = "([^%a])gg", regTrig = true, wordTrig = false, snippetType="autosnippet"},
    fmta(
      "<>\\ang{<>}",
      {
        f( function(_, snip) return snip.captures[1] end ),
        d(1, get_visual),
      }
    ),
    {condition = tex.in_mathzone}
  ),
  -- ABSOLUTE VALUE
  s({trig = "([^%a])aa", regTrig = true, wordTrig = false, snippetType="autosnippet"},
    fmta(
      "<>\\abs{<>}",
      {
        f( function(_, snip) return snip.captures[1] end ),
        d(1, get_visual),
      }
    ),
    {condition = tex.in_mathzone}
  ),
  -- SQUARE ROOT
  s({trig = "([^%\\])sq", wordTrig = false, regTrig = true, snippetType="autosnippet"},
    fmta(
      "<>\\sqrt{<>}",
      {
        f( function(_, snip) return snip.captures[1] end ),
        d(1, get_visual),
      }
    ),
    {condition = tex.in_mathzone}
  ),
  -- BINOMIAL SYMBOL
  s({trig = "([^%\\])bnn", wordTrig = false, regTrig = true, snippetType="autosnippet"},
    fmta(
      "<>\\binom{<>}{<>}",
      {
        f( function(_, snip) return snip.captures[1] end ),
        i(1),
        i(2),
      }
    ),
    {condition = tex.in_mathzone}
  ),
  -- LOGARITHM WITH BASE SUBSCRIPT
  s({trig = "([^%a%\\])ll", wordTrig = false, regTrig = true, snippetType="autosnippet"},
    fmta(
      "<>\\log_{<>}",
      {
        f( function(_, snip) return snip.captures[1] end ),
        i(1),
      }
    ),
    {condition = tex.in_mathzone}
  ),
 -- BOXED command
  s({trig = "([^%a])bb", wordTrig = false, regTrig = true, snippetType="autosnippet"},
    fmta(
      "<>\\boxed{<>}",
      {
        f( function(_, snip) return snip.captures[1] end ),
        d(1, get_visual)
      }
    ),
    {condition = tex.in_mathzone}
  ),
  --
  -- BEGIN STATIC SNIPPETS
  --

 -- PARALLEL SYMBOL, i.e. \parallel
  s({trig = "||", snippetType="autosnippet"},
    {
      t("\\parallel"),
    }
  ),
  -- CDOTS, i.e. \cdots
  s({trig = "cdd", snippetType="autosnippet"},
    {
      t("\\cdot"),
    }
  ),
  -- LDOTS, i.e. \ldots
  s({trig = "ldd", snippetType="autosnippet"},
    {
      t("\\ldots"),
    }
  ),
  -- EQUIV, i.e. \equiv
  s({trig = "eqq", snippetType="autosnippet"},
    {
      t("\\equiv "),
    }
  ),
  -- SETMINUS, i.e. \setminus
  s({trig = "stm", snippetType="autosnippet"},
    {
      t("\\setminus "),
    }
  ),
 -- APPROX, i.e. \approx
  s({trig = "px", snippetType="autosnippet"},
    {
      t("\\approx "),
    },
    {condition = tex.in_mathzone}
  ),
  -- PROPTO, i.e. \propto
  s({trig = "pt", snippetType="autosnippet"},
    {
      t("\\propto "),
    },
    {condition = tex.in_mathzone}
  ),
  -- COLON, i.e. \colon
  s({trig = "::", snippetType="autosnippet"},
    {
      t("\\colon "),
    }
  ),
  -- Greater than >
  s({trig = "gth", snippetType="autosnippet"},
  {
	  t(">"),
  }),
  --Less than <
  s({trig = "lth", snippetType="autosnippet"},
  {
	  t("<"),
  }),
--Greater than or equal to >=
  s({trig = "gqth", snippetType="autosnippet"},
  {
	  t("\\geq"),
  }),
  --Less than or equalt to <=
  s({trig = "lqth", snippetType="autosnippet"},
  {
	  t("\\leq"),
  }),
}
