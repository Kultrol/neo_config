local ls = require("luasnip")
local s = ls.snippet
local t = ls.text_node
local i = ls.insert_node
local f = ls.function_node
local d = ls.dynamic_node
local fmta = require("luasnip.extras.fmt").fmta

local tex = {}
tex.in_mathzone = function()
    return vim.fn['vimtex#syntax#in_mathzone']() == 1
end

local helpers = require('../../util_helper')
local get_visual = helpers.get_visual



return {
  -- 2x2 Matrix
  s("mat2", fmta([[
    \begin{bmatrix}
      <> & <> \\
      <> & <>
    \end{bmatrix}
  ]], {i(1), i(2), i(3), i(4)}), {condition = tex.in_mathzone}),

  -- 2x2 Augmented Matrix
  s("amat2", fmta([[
    \left[\begin{array}{cc|c}
      <> & <> & <> \\
      <> & <> & <>
    \end{array}\right]
  ]], {i(1), i(2), i(3), i(4), i(5), i(6)}), {condition = tex.in_mathzone}),

  -- 3x3 Matrix
  s("mat3", fmta([[
    \begin{bmatrix}
      <> & <> & <> \\
      <> & <> & <> \\
      <> & <> & <>
    \end{bmatrix}
  ]], {i(1), i(2), i(3), i(4), i(5), i(6), i(7), i(8), i(9)}), {condition = tex.in_mathzone}),

  -- 3x3 Augmented Matrix
  s("amat3", fmta([[
    \left[\begin{array}{ccc|c}
      <> & <> & <> & <> \\
      <> & <> & <> & <> \\
      <> & <> & <> & <>
    \end{array}\right]
  ]], {i(1), i(2), i(3), i(4), i(5), i(6), i(7), i(8), i(9), i(10), i(11), i(12)}), {condition = tex.in_mathzone}),

  -- 4x4 Matrix
  s("mat4", fmta([[
    \begin{bmatrix}
      <> & <> & <> & <> \\
      <> & <> & <> & <> \\
      <> & <> & <> & <> \\
      <> & <> & <> & <>
    \end{bmatrix}
  ]], {i(1), i(2), i(3), i(4), i(5), i(6), i(7), i(8), i(9), i(10), i(11), i(12), i(13), i(14), i(15), i(16)}), {condition = tex.in_mathzone}),

  -- 4x4 Augmented Matrix
  s("amat4", fmta([[
    \left[\begin{array}{cccc|c}
      <> & <> & <> & <> & <> \\
      <> & <> & <> & <> & <> \\
      <> & <> & <> & <> & <> \\
      <> & <> & <> & <> & <>
    \end{array}\right]
  ]], {i(1), i(2), i(3), i(4), i(5), i(6), i(7), i(8), i(9), i(10), i(11), i(12), i(13), i(14), i(15), i(16), i(17), i(18), i(19), i(20)}), {condition = tex.in_mathzone}),

  -- Matrix Transpose
  s("trans", fmta([[
    \left( <> \right)^T
  ]], {i(1)}), {condition = tex.in_mathzone}),

  -- Matrix Inverse
  s("inv", fmta([[
    \left( <> \right)^{-1}
  ]], {i(1)}), {condition = tex.in_mathzone}),

  -- Vector Matrix (n rows or columns)
  s("vecmat", fmta([[
    \begin{bmatrix}
      <> \\
      \vdots \\
      <>
    \end{bmatrix}
  ]], {i(1), i(2)}), {condition = tex.in_mathzone}),
 -- VECTOR, i.e. \vec
  s({trig = "([^%a])vv", wordTrig = false, regTrig = true, snippetType="autosnippet"},
    fmta(
      "<>\\vec{<>}",
      {
        f( function(_, snip) return snip.captures[1] end ),
        d(1, get_visual),
      }
    ),
    {condition = tex.in_mathzone}
  ),
  -- DEFAULT UNIT VECTOR WITH SUBSCRIPT, i.e. \unitvector_{}
  s({trig = "([^%a])ue", wordTrig = false, regTrig = true, snippetType="autosnippet"},
    fmta(
      "<>\\unitvector_{<>}",
      {
        f( function(_, snip) return snip.captures[1] end ),
        d(1, get_visual),
      }
    ),
    {condition = tex.in_mathzone}
  ),
  -- UNIT VECTOR WITH HAT, i.e. \uvec{}
  s({trig = "([^%a])uv", wordTrig = false, regTrig = true, snippetType="autosnippet"},
    fmta(
      "<>\\uvec{<>}",
      {
        f( function(_, snip) return snip.captures[1] end ),
        d(1, get_visual),
      }
    ),
    {condition = tex.in_mathzone}
  ),
   -- DOT PRODUCT, i.e. \cdot
  s({trig = ",.", snippetType="autosnippet"},
    {
      t("\\cdot "),
    }
  ),
  -- CROSS PRODUCT, i.e. \times
  s({trig = "xx", snippetType="autosnippet"},
    {
      t("\\times "),
    }
  ),
}
