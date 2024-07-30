local ls = require("luasnip")
local s = ls.snippet
local t = ls.text_node
local i = ls.insert_node
local d = ls.dynamic_node
local sn = ls.snippet_node

local tex = {}

tex.in_mathzone = function()
    return vim.fn['vimtex#syntax#in_mathzone']() == 1
end

local function generate_matrix_nodes(rows, cols)
    local nodes = {}
    for r = 1, rows do
        for c = 1, cols do
            table.insert(nodes, i((r - 1) * cols + c, ""))
            if c < cols then
                table.insert(nodes, t(" & "))
            end
        end
        if r < rows then
            table.insert(nodes, t(" \\\\ "))
        end
    end
    return nodes
end

local function matrix_snippet(args, snip)
    local rows = tonumber(snip.captures[1])
    local cols = tonumber(snip.captures[2])
    local nodes = generate_matrix_nodes(rows, cols)
    table.insert(nodes, 1, t("\\begin{bmatrix}"))
    table.insert(nodes, t("\\end{bmatrix}"))
    return sn(nil, nodes)
end

local function augmented_matrix_snippet(args, snip)
    local rows = tonumber(snip.captures[1])
    local cols = tonumber(snip.captures[2])
    local nodes = generate_matrix_nodes(rows, cols)
    table.insert(nodes, 1, t("\\left[\\begin{array}{" .. string.rep("c", cols - 1) .. "|c}"))
    table.insert(nodes, t("\\end{array}\\right]"))
    return sn(nil, nodes)
end

return {
    -- General matrix snippet
    s({trig = "(%d+)mat(%d+)", regTrig = true, condition = tex.in_mathzone},
      d(1, matrix_snippet, {})),

    -- General augmented matrix snippet
    s({trig = "(%d+)amat(%d+)", regTrig = true, condition = tex.in_mathzone},
      d(1, augmented_matrix_snippet, {})),
}
