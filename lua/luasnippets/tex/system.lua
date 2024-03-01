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

local line_begin = require("luasnip.extras.expand_conditions").line_begin

-- Math context detection 
local tex = {}
tex.in_mathzone = function() return vim.fn['vimtex.syntax.in_mathzone']() == 1 end
tex.in_text = function() return not tex.in_mathzone() end

-- Return snippet tables
return
  {
    -- ANNOTATE (custom command for annotating equation derivations)
    s({trig = "ann", snippetType="autosnippet"},
      fmta(
        [[
      \annotate{<>}{<>}
      ]],
        {
          i(1),
          d(2, get_visual),
        }
      )
    ),
    -- REFERENCE
    s({trig = " RR", snippetType="autosnippet", wordTrig=false},
      fmta(
        [[
      ~\ref{<>}
      ]],
        {
          d(1, get_visual),
        }
      )
    ),
    -- DOCUMENTCLASS
    s({trig = "dcc", snippetType="autosnippet"},
      fmta(
        [=[
        \documentclass[<>]{<>}
        ]=],
        {
          i(1, "a4paper"),
          i(2, "article"),
        }
      ),
      { condition = line_begin }
    ),
    -- USE A LATEX PACKAGE
    s({trig = "pack", snippetType="autosnippet"},
      fmta(
        [[
        \usepackage{<>}
        ]],
        {
          d(1, get_visual),
        }
      ),
      { condition = line_begin }
    ),
    -- INPUT a LaTeX file
    s({trig = "inn", snippetType="autosnippet"},
      fmta(
        [[
      \input{<><>}
      ]],
        {
          i(1, "~/dotfiles/config/latex/templates/"),
          i(2)
        }
      ),
      { condition = line_begin }
    ),
    -- LABEL
    s({trig = "lbl", snippetType="autosnippet"},
      fmta(
        [[
      \label{<>}
      ]],
        {
          d(1, get_visual),
        }
      )
    ),
    -- HPHANTOM
    s({trig = "hpp", snippetType="autosnippet"},
      fmta(
        [[
      \hphantom{<>}
      ]],
        {
          d(1, get_visual),
        }
      )
    ),
    s({trig = "TODOO", snippetType="autosnippet"},
      fmta(
        [[\TODO{<>}]],
        {
          d(1, get_visual),
        }
      )
    ),
    s({trig="nc"},
      fmta(
        [[\newcommand{<>}{<>}]],
        {
          i(1),
          i(2)
        }
      ),
      {condition = line_begin}
    ),
    s({trig="sii", snippetType="autosnippet"},
      fmta(
        [[\si{<>}]],
        {
          i(1),
        }
      )
    ),
    s({trig="qtt"},
      fmta(
        [[\qty{<>}{<>}]],
        {
          i(1),
          i(2)
        }
      )
    ),
    -- URL 
    s({trig="url"},
      fmta(
        [[\url{<>}]],
        {
          d(1, get_visual),
        }
      )
    ),
    -- href command with URL in visual selection
    s({trig="LU", snippetType="autosnippet"},
      fmta(
        [[\href{<>}{<>}]],
        {
          d(1, get_visual),
          i(2)
        }
      )
    ),
    -- href command with text in visual selection
    s({trig="LL", snippetType="autosnippet"},
      fmta(
        [[\href{<>}{<>}]],
        {
          i(1),
          d(2, get_visual)
        }
      )
    ),
    -- HSPACE
    s({trig="hss", snippetType="autosnippet"},
      fmta(
        [[\hspace{<>}]],
        {
          d(1, get_visual),
        }
      )
    ),
    -- VSPACE
    s({trig="vss", snippetType="autosnippet"},
      fmta(
        [[\vspace{<>}]],
        {
          d(1, get_visual),
        }
      )
    ),
    -- SECTION
    s({trig="h1", snippetType="autosnippet"},
      fmta(
        [[\section{<>}]],
        {
          d(1, get_visual),
        }
      )
    ),
    -- SUBSECTION
    s({trig="h2", snippetType="autosnippet"},
      fmta(
        [[\subsection{<>}]],
        {
          d(1, get_visual),
        }
      )
    ),
    -- SUBSUBSECTION
    s({trig="h3", snippetType="autosnippet"},
      fmta(
        [[\subsubsection{<>}]],
        {
          d(1, get_visual),
        }
      )
    ),
  }
