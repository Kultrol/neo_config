-- ~/.config/nvim/lua/luasnippets/exa/utility_snippets.lua

local ls = require("luasnip")

-- Import snippet node constructors
local s  = ls.snippet        -- Top-level snippet
local sn = ls.snippet_node   -- Snippet node (for nested or choice expansions)
local t  = ls.text_node      -- Text node
local i  = ls.insert_node    -- Insert node
local c  = ls.choice_node    -- Choice node
local d  = ls.dynamic_node   -- Dynamic node
local fmta = require("luasnip.extras.fmt").fmta

-- Optionally, import helper functions
local helpers = require('../../util_helper')
local get_visual = helpers.get_visual

-- For restricting expansion to line beginnings or math zones in LaTeX (if needed)
local line_begin = require("luasnip.extras.expand_conditions").line_begin

-- Example of detecting math context in LaTeX (via vimtex)
local tex = {
  in_mathzone = function() return vim.fn['vimtex#syntax#in_mathzone']() == 1 end,
  in_text     = function() return not tex.in_mathzone() end,
}

-- Define snippets
local section_snippets = {
  -- SECTION
  s(
    { trig = "h1", snippetType = "autosnippet" },
    fmta("\\section{<>}", { d(1, get_visual) })
  ),

  -- SUBSECTION
  s(
    { trig = "h2", snippetType = "autosnippet" },
    fmta("\\subsection{<>}", { d(1, get_visual) })
  ),

  -- SUBSUBSECTION
  s(
    { trig = "h3", snippetType = "autosnippet" },
    fmta("\\subsubsection{<>}", { d(1, get_visual) })
  ),

  -- Equation environment with label choice
  s(
    { trig = "beq", dscr = "Equation environment with optional label", snippetType = "autosnippet" },
    fmta(
      [[
      \begin{equation}<>
        <>
      \end{equation}
      ]],
      {
        c(1, {
            -- Choice 1: with label
            sn(nil, {
              t("\\label{eq:"),
              i(1),
              t("}"),
            }),
            -- Choice 2: no label
            t(""),
          }),
        i(2),
      }
    )
  ),
}

-- Return snippet table
return section_snippets
