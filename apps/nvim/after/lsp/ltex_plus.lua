local filetypes = {
  -- Markup Languages
  'asciidoc',
  'bib',
  'context',
  'gitcommit',
  'html',
  'markdown',
  'org',
  'pandoc',
  'plaintex',
  'quarto',
  'mail',
  'mdx',
  'rmd',
  'rnoweb',
  'rst',
  'tex',
  'latex',
  'text',
  'typst',
  'xhtml',

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
}

return {
  on_attach = function()
    require('ltex_extra').setup({
      load_langs = { 'en-US', 'es' },
    })
  end,
  filetypes = filetypes,
  settings = {
    ltex = {
      additionalRules = {
        motherTongue = 'es',
      },
      languageToolHttpServerUri = 'http://localhost:8081/',
      enabled = filetypes,
    },
  },
}
