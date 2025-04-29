local ls = require("luasnip")
local s = ls.snippet
local i = ls.insert_node
local fmta = require("luasnip.extras.fmt").fmta

local page_templates = {
  s(
    { trig = "page_template", snippetType = "autosnippet" },
    fmta(
      [[
      \documentclass{article}
      
      % Encoding, language, and layout
      \usepackage[utf8]{inputenc}
      \usepackage[english]{babel}
      \usepackage{adjustbox}
      \usepackage{graphicx}
      \usepackage{float}
      \usepackage{hyperref}
      \usepackage{csquotes}
      
      % Math packages for equations, logic, set theory, and more
      \usepackage{amsmath, amssymb, amsthm, mathtools}
      \usepackage{stmaryrd}      % Additional symbols (logic, set theory)
      \usepackage{mathrsfs}      % Script fonts for advanced math notation
      \usepackage{esdiff}        % Elegant derivatives
      
      % Physics packages for electromagnetism and notation
      \usepackage{physics}       % Differential equations, derivatives, etc.
      \usepackage{siunitx}       % SI units
      \usepackage{bm}            % Bold math symbols (useful for vectors)
      
      % Bibliography
      \usepackage[backend=biber, style=apa]{biblatex}
      \addbibresource{references.bib}
      
      \title{<>}
      \author{<>}
      \date{<>}
      
      \begin{document}
      
      \maketitle
      
      \tableofcontents
      
      % Your content goes here
      
      \printbibliography[heading=bibintoc, title={References}]
      
      \end{document}
      ]],
      {
        i(1, "Document Title"),
        i(2, "Author Name"),
        i(3, "Date"),
      }
    )
  ),
}

return page_templates
