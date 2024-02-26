local ls = require("luasnip")

-- Define a snippet for the 'tex' filetype
ls.add_snippets("tex", {
    ls.snippet("sec", {
        ls.text_node("\\section{"),
        ls.insert_node(1, "Section Name"),
        ls.text_node("}"),
        ls.insert_node(0) -- Position the cursor inside the section body
    }),
    -- You can add more snippets for 'tex' here
})

