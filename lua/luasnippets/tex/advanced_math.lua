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
  -- SUPERSCRIPT
  s({trig = "([%w%)%]%}])'", wordTrig=false, regTrig = true, snippetType="autosnippet"},
    fmta(
      "<>^{<>}",
      {
        f( function(_, snip) return snip.captures[1] end ),
        d(1, get_visual),
      }
    ),
    {condition = tex.in_mathzone}
  ),
  -- SUBSCRIPT
  s({trig = "([%w%)%]%}]);", wordTrig=false, regTrig = true, snippetType="autosnippet"},
    fmta(
      "<>_{<>}",
      {
        f( function(_, snip) return snip.captures[1] end ),
        d(1, get_visual),
      }
    ),
    {condition = tex.in_mathzone}
  ),
  -- SUBSCRIPT AND SUPERSCRIPT
  s({trig = "([%w%)%]%}])__", wordTrig=false, regTrig = true, snippetType="autosnippet"},
    fmta(
      "<>^{<>}_{<>}",
      {
        f( function(_, snip) return snip.captures[1] end ),
        i(1),
        i(2),
      }
    ),
    {condition = tex.in_mathzone}
  ),
  -- TEXT SUBSCRIPT
  s({trig = 'sd', snippetType="autosnippet", wordTrig=false},
    fmta("_{\\mathrm{<>}}",
      { d(1, get_visual) }
    ),
    {condition = tex.in_mathzone}
  ),
  -- SUPERSCRIPT SHORTCUT
  -- Places the first alphanumeric character after the trigger into a superscript.
  s({trig = '([%w%)%]%}])"([%w])', regTrig = true, wordTrig = false, snippetType="autosnippet"},
    fmta(
      "<>^{<>}",
      {
        f( function(_, snip) return snip.captures[1] end ),
        f( function(_, snip) return snip.captures[2] end ),
      }
    ),
    {condition = tex.in_mathzone}
  ),
  -- SUBSCRIPT SHORTCUT
  -- Places the first alphanumeric character after the trigger into a subscript.
  s({trig = '([%w%)%]%}]):([%w])', regTrig = true, wordTrig = false, snippetType="autosnippet"},
    fmta(
      "<>_{<>}",
      {
        f( function(_, snip) return snip.captures[1] end ),
        f( function(_, snip) return snip.captures[2] end ),
      }
    ),
    {condition = tex.in_mathzone}
  ),
  -- EULER'S NUMBER SUPERSCRIPT SHORTCUT
  s({trig = '([^%a])ee', regTrig = true, wordTrig = false, snippetType="autosnippet"},
    fmta(
      "<>e^{<>}",
      {
        f( function(_, snip) return snip.captures[1] end ),
        d(1, get_visual)
      }
    ),
    {condition = tex.in_mathzone}
  ),
  -- ZERO SUBSCRIPT SHORTCUT
  s({trig = '([%a%)%]%}])00', regTrig = true, wordTrig = false, snippetType="autosnippet"},
    fmta(
      "<>_{<>}",
      {
        f( function(_, snip) return snip.captures[1] end ),
        t("0")
      }
    ),
    {condition = tex.in_mathzone}
  ),
  -- MINUS ONE SUPERSCRIPT SHORTCUT
  s({trig = '([%a%)%]%}])11', regTrig = true, wordTrig = false, snippetType="autosnippet"},
    fmta(
      "<>_{<>}",
      {
        f( function(_, snip) return snip.captures[1] end ),
        t("-1")
      }
    ),
    {condition = tex.in_mathzone}
  ),
  -- J SUBSCRIPT SHORTCUT (since jk triggers snippet jump forward)
  s({trig = '([%a%)%]%}])JJ', wordTrig = false, regTrig = true, snippetType="autosnippet"},
    fmta(
      "<>_{<>}",
      {
        f( function(_, snip) return snip.captures[1] end ),
        t("j")
      }
    ),
    {condition = tex.in_mathzone}
  ),
  -- PLUS SUPERSCRIPT SHORTCUT
  s({trig = '([%a%)%]%}])%+%+', regTrig = true, wordTrig = false, snippetType="autosnippet"},
    fmta(
      "<>^{<>}",
      {
        f( function(_, snip) return snip.captures[1] end ),
        t("+")
      }
    ),
    {condition = tex.in_mathzone}
  ),
  -- COMPLEMENT SUPERSCRIPT
  s({trig = '([%a%)%]%}])CC', regTrig = true, wordTrig = false, snippetType="autosnippet"},
    fmta(
      "<>^{<>}",
      {
        f( function(_, snip) return snip.captures[1] end ),
        t("\\complement")
      }
    ),
    {condition = tex.in_mathzone}
  ),
  -- CONJUGATE (STAR) SUPERSCRIPT SHORTCUT
  s({trig = '([%a%)%]%}])%*%*', regTrig = true, wordTrig = false, snippetType="autosnippet"},
    fmta(
      "<>^{<>}",
      {
        f( function(_, snip) return snip.captures[1] end ),
        t("*")
      }
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
      t("\\cdots"),
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
  -- SUBSET, i.e. \subset
  s({trig = "sbb", snippetType="autosnippet"},
    {
      t("\\subset "),
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
  -- IMPLIES, i.e. \implies
  s({trig = ">>", snippetType="autosnippet"},
    {
      t("\\implies "),
    }
  ),
}
