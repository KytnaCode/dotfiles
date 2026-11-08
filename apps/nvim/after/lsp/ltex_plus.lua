return {
  on_attach = function()
    require('ltex_extra').setup({
      load_langs = { 'en-US', 'es' },
    })
  end,
  settings = {
    ltex = {
      additionalRules = {
        motherTongue = 'es',
      },
      enabled = {
        -- Markup Languages
        'bibtex',
        'context',
        'context.tex',
        'html',
        'latex',
        'markdown',
        'org',
        'restructuredtext',
        'rsweave',

        -- Programming Languages
        'shellscript',
        'go',
        'haskell',
        'javascript',
        'javascriptreact',
        'lua',
        'python',
        'rust',
        'sql',
        'typescript',
        'typescriptreact',
      },
    },
  },
}
