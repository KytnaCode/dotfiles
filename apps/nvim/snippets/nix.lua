local ls = require('luasnip')
local fmt = require('luasnip.extras.fmt').fmt
local s = ls.snippet
local i = ls.insert_node
local t = ls.text_node
local d = ls.dynamic_node
local get_visual = require('luasnip-helpers').get_visual

return {
  s(
    'wth',
    fmt(
      [[
    with {}; {}
    ]],
      {
        i(1),
        i(0),
      }
    )
  ),
  s('wthp', {
    t({ 'with pkgs; [', '\t' }),
    i(0),
    t({ '', ']' }),
  }),
  s('let', {
    t({ 'let', '\t' }),
    i(0),
    t({ '', 'in ' }),
    d(1, get_visual),
  }),
  s('slinux', { t('x86_64-linux') }),
}
