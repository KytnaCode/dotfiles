local ls = require('luasnip')
local fmt = require('luasnip.extras.fmt').fmt
local s = ls.snippet
local i = ls.insert_node

return {
  s(
    'html5',
    fmt(
      [[
  <!DOCTYPE html>
  <html>
    <head>
      <meta charset="UTF-8" />
      <title>{}</title>
    </head>

    <body>
      {}
    </body>
  </html>
  ]],
      {
        i(1),
        i(0),
      }
    )
  ),
}
