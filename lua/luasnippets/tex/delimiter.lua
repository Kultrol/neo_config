    local ls = require("luasnip")
    local s = ls.snippet
    local sn = ls.snippet_node
    local isn = ls.indent_snippet_node
    local t = ls.text_node
    local i = ls.insert_node
    local f = ls.function_node
    local c = ls.choice_node
    local d = ls.dynamic_node
    local r = ls.restore_node
    local events = require("luasnip.util.events")
    local ai = require("luasnip.nodes.absolute_indexer")
    local extras = require("luasnip.extras")
    local l = extras.lambda
    local rep = extras.rep
    local p = extras.partial
    local m = extras.match
    local n = extras.nonempty
    local dl = extras.dynamic_lambda
     local fmt = require("luasnip.extras.fmt").fmt
    local fmta = require("luasnip.extras.fmt").fmta
    local conds = require("luasnip.extras.expand_conditions")
    local postfix = require("luasnip.extras.postfix").postfix
    local types = require("luasnip.util.types")
    local parse = require("luasnip.util.parser").parse_snippet
    local ms = ls.multi_snippet
    local k = require("luasnip.nodes.key_indexer").new_key


local helpers = require('../../util_helper')
local get_visual = helpers.get_visual

-- Math context detection 
local tex = {}
tex.in_mathzone = function() return vim.fn['vimtex.syntax.in_mathzone']() == 1 end
tex.in_text = function() return not tex.in_mathzone() end

-- Return snippet tables
return
{
  -- LEFT/RIGHT PARENTHESES
  s({trig = "([^%a])l%(", regTrig = true, wordTrig = false, snippetType="autosnippet"},
    fmta(
      "<>\\left(<>\\right)",
      {
        f( function(_, snip) return snip.captures[1] end ),
        d(1, get_visual),
      }
    )
  ),
  -- LEFT/RIGHT SQUARE BRACES
  s({trig = "([^%a])l%[", regTrig = true, wordTrig = false, snippetType="autosnippet"},
    fmta(
      "<>\\left[<>\\right]",
      {
        f( function(_, snip) return snip.captures[1] end ),
        d(1, get_visual),
      }
    )
  ),
  -- LEFT/RIGHT CURLY BRACES
  s({trig = "([^%a])l%{", regTrig = true, wordTrig = false, snippetType="autosnippet"},
    fmta(
      "<>\\left\\{<>\\right\\}",
      {
        f( function(_, snip) return snip.captures[1] end ),
        d(1, get_visual),
      }
    )
  ),
  -- BIG PARENTHESES
  s({trig = "([^%a])b%(", regTrig = true, wordTrig = false, snippetType="autosnippet"},
    fmta(
      "<>\\big(<>\\big)",
      {
        f( function(_, snip) return snip.captures[1] end ),
        d(1, get_visual),
      }
    )
  ),
  -- BIG SQUARE BRACES
  s({trig = "([^%a])b%[", regTrig = true, wordTrig = false, snippetType="autosnippet"},
    fmta(
      "<>\\big[<>\\big]",
      {
        f( function(_, snip) return snip.captures[1] end ),
        d(1, get_visual),
      }
    )
  ),
  -- BIG CURLY BRACES
  s({trig = "([^%a])b%{", regTrig = true, wordTrig = false, snippetType="autosnippet"},
    fmta(
      "<>\\big\\{<>\\big\\}",
      {
        f( function(_, snip) return snip.captures[1] end ),
        d(1, get_visual),
      }
    )
  ),
  -- ESCAPED CURLY BRACES
  s({trig = "([^%a])\\%{", regTrig = true, wordTrig = false, snippetType="autosnippet", priority=2000},
    fmta(
      "<>\\{<>\\}",
      {
        f( function(_, snip) return snip.captures[1] end ),
        d(1, get_visual),
      }
    )
  ),
  -- LATEX QUOTATION MARK
  s({trig = "``", snippetType="autosnippet"},
    fmta(
      "``<>''",
      {
        d(1, get_visual),
      }
    )
  ),
}

