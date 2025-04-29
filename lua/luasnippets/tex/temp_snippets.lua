local ls = require("luasnip")
    local s = ls.snippet
    local sn = ls.snippet_node
    local t = ls.text_node
    local i = ls.insert_node
    local c = ls.choice_node
    local fmta = require("luasnip.extras.fmt").fmta

local helpers = require('../../util_helper')
local get_visual = helpers.get_visual

local line_begin = require("luasnip.extras.expand_conditions").line_begin

-- Math context detection 
local tex = {}
tex.in_mathzone = function() return vim.fn['vimtex#syntax#in_mathzone']() == 1 end
tex.in_text = function() return not tex.in_mathzone() end


return {

  -- Equation, choice for labels
  s({trig="beq", dscr="Expands 'beq' into an equation environment, with a choice for labels", snippetType="autosnippet"},
    fmta(
      [[
        \begin{equation}<>
          <>
        \end{equation}
      ]],
      { c(1, 
            {
              sn(2,   -- Choose to specify an equation label
                {
                  t("\\label{eq:"),
                  i(1),
                  t("}"),
                }
              ),
              t([[]]), -- Choose no label
            },
            {}
          ),
        i(2) }
    )
  ),
}
