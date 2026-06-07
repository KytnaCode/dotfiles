local ls = require('luasnip')
local fmt = require('luasnip.extras.fmt').fmt
local s = ls.snippet
local i = ls.insert_node
local d = ls.dynamic_node
local get_visual = require('luasnip-helpers').get_visual

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
  s(
    'if',
    fmt(
      [[
      if {} then
        {}
      end
      ]],
      {
        i(1),
        d(2, get_visual),
      }
    )
  ),
  s(
    'ifel',
    fmt(
      [[
      if {} then
        {}
      else
        {}
      end
      ]],
      {
        i(1),
        i(0),
        i(2),
      }
    )
  ),
}
