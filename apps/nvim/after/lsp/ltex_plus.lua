return {
  on_attach = function()
    require('ltex_extra').setup({
      load_langs = { 'en-US', 'es' },
    })
  end,
}
