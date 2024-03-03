local M = {}

local ls = require("luasnip") -- LuaSnip
local sn = ls.snippet_node -- Snippet node
local i = ls.insert_node -- Insert node: Import `i` from LuaSnip

function M.get_ISO_8601_date()
    return os.date("%Y-%m-%d")
end

function M.get_visual(args, parent)
    if (#parent.snippet.env.LS_SELECT_RAW > 0) then
        return sn(nil, i(1, parent.snippet.env.LS_SELECT_RAW))
    else
        return sn(nil, i(1, ''))
    end
end

return M

