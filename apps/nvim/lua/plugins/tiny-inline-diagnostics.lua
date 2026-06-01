return {
  'rachartier/tiny-inline-diagnostic.nvim',
  event = 'VeryLazy',
  priority = 1000,
  config = function()
    require('tiny-inline-diagnostic').setup({
      preset = 'ghost',
      transparent_bg = true,
      options = {
        multilines = {
          enabled = true,
        },
        show_source = {
          enabled = true,
        },
      },
    })

    -- Disable Neovim's default virtual text diagnostics
    vim.diagnostic.config({ virtual_text = false })
  end,
}
