return {
  'saghen/blink.cmp',
  version = '1.*',
  dependencies = {
    'L3MON4D3/LuaSnip',
    version = '2.*',
  },
  opts = {
    keymap = { preset = 'enter' },

    snippets = { preset = 'luasnip' },

    sources = {
      default = { 'lsp', 'path', 'snippets', 'buffer' },
      providers = {
        buffer = {
          opts = {
            get_bufnrs = function()
              return vim.tbl_filter(function(bufnr)
                return vim.bo[bufnr].buftype == ''
              end, vim.api.nvim_list_bufs())
            end,
          },
        },
      },
    },

    completion = {
      documentation = { window = { border = 'rounded' } },

      ghost_text = { enabled = false },

      menu = {
        border = 'rounded',
        draw = {
          components = {
            kind_icon = {
              text = function(ctx)
                return require('lspkind').symbol_map[ctx.kind] or ''
              end,
            },
          },
        },
      },
    },
  },
}
