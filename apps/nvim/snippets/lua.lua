local ls = require('luasnip')
local fmt = require('luasnip.extras.fmt').fmt
local s = ls.snippet
local sn = ls.snippet_node
local i = ls.insert_node
local d = ls.dynamic_node

local get_visual = function(_, parent)
  if #parent.snippet.env.LS_SELECT_RAW > 0 then
    return sn(nil, i(1, parent.snippet.env.LS_SELECT_RAW))
  else -- If LS_SELECT_RAW is empty, return a blank insert node
    return sn(nil, i(1))
  end
end

return {
  s(
    'fn',
    fmt(
      [[
    function {}()
      {}
    end
    ]],
      {
        i(1),
        d(2, get_visual),
      }
    )
  ),
}
