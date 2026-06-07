return {
  'L3MON4D3/LuaSnip',
  name = 'luasnip',
  version = 'v2.*',
  build = 'make install_jsregexp',
  config = function()
    require('luasnip').setup({
      cut_selection_keys = '<Tab>',
    })

    require('luasnip.loaders.from_lua').lazy_load({ paths = './snippets' })
  end,
}
