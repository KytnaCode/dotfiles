local ls = require('luasnip')
local fmta = require('luasnip.extras.fmt').fmta
local s = ls.snippet
local i = ls.insert_node
local t = ls.text_node
local d = ls.dynamic_node
local helpers = require('luasnip-helpers')
local get_visual = helpers.get_visual
local read_block = helpers.read_block

return {
  s(
    'main',
    fmta(
      [[
  func main() {
    <>
  }
  ]],
      {
        i(0),
      }
    )
  ),
  s(
    'fn',
    fmta(
      [[
  func <>(<>) <> {
    <>
  }
  ]],
      {
        i(1, 'name'),
        i(2),
        i(3),
        d(4, get_visual),
      }
    )
  ),
  s(
    'if',
    fmta(
      [[
  if <> {
    <>
  }
  ]],
      {
        i(1),
        d(2, get_visual),
      }
    )
  ),
  s(
    'ifel',
    fmta(
      [[
  if <> {
    <>
  } else {
    <>
  }
  ]],
      {
        i(1),
        i(0),
        i(2),
      }
    )
  ),
  s(
    'ife',
    fmta(
      [[
  if err != nil {
    <>
  }
  ]],
      {
        i(0),
      }
    )
  ),
  s(
    'ifei',
    fmta(
      [[
  if err := <>; err != nil {
    <>
  }
  ]],
      {
        d(1, get_visual),
        i(0),
      }
    )
  ),
  s(
    'go',
    fmta(
      [[
    go func() {
      <>
    }()
  ]],
      {
        d(1, get_visual),
      }
    )
  ),
  s(
    'dfr',
    fmta('defer <>', {
      d(1, get_visual),
    })
  ),
  s(
    'def',
    fmta('<> := <>', {
      i(1, 'x'),
      d(2, get_visual),
    })
  ),
  s(
    'for',
    fmta(
      [[
  for {
    <>
  }
  ]],
      {
        i(0),
      }
    )
  ),
  s(
    'forr',
    fmta(
      [[
  for range <> {
    <>
  }
  ]],
      {
        i(1),
        i(0),
      }
    )
  ),
  s(
    'fore',
    fmta(
      [[
  for <>, <> := range <> {
    <>
  }
  ]],
      {
        i(1, 'index'),
        i(2, 'value'),
        i(3),
        i(0),
      }
    )
  ),
  s(
    'sel',
    fmta(
      [[
  select {
    case <>:
      <>
  }
  ]],
      {
        i(1),
        i(0),
      }
    )
  ),
  s(
    'struct',
    fmta(
      [[
    type <> struct {
      <>
    }
    ]],
      {
        i(1),
        i(0),
      }
    )
  ),
  s(
    'iface',
    fmta(
      [[
      type <> interface {
        <>
      }
    ]],
      {
        i(1),
        i(0),
      }
    )
  ),
  s(
    'talias',
    fmta(
      [[
    type <> = <>
    ]],
      {
        i(1),
        i(0),
      }
    )
  ),
  s(
    'meth',
    fmta(
      [[
      func (<> <>) <>(<>) <> {
        <>
      }
    ]],
      {
        i(2, 'recv'),
        i(3, 'type'),
        i(1, 'name'),
        i(4),
        i(5),
        i(0),
      }
    )
  ),
  s('cxbg', { t('context.Background()') }),
  s('cxsig', {
    t('ctx, cancel := signal.NotifyContext(context.Background(), os.Interrupt)', 'defer cancel()'),
  }),
  s(
    'test',
    fmta(
      [[
    func Test<>(t *testing.T) {
      t.Parallel()

      <>
    }
    ]],
      {
        i(1),
        i(0),
      }
    )
  ),
  s('cxcan', fmta('ctx, cancel := context.WithCancel(<>)', { i(1) })),
  s('cxtime', fmta('ctx, cancel := context.WithTimeout(<>, <>)', { i(1), i(2) })),
  s('cancel', {
    t('defer cancel()'),
  }),
  s('errCh', fmta('errCh := make(chan error, <>)', { i(1, '1') })),
  s('bListenAndServe', fmta(read_block('go', 'listen_and_serve', '<>'), {})),
  s('bArgon2id', fmta(read_block('go', 'argon2id', '<>'), {})),
}
