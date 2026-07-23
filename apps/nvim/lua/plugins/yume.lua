return {
  'kytnacode/yume',
  lazy = false,
  priority = 1000,
  config = function()
    require('yume').setup({
      integrations = {
        neotree = true,
      },
    })

    vim.cmd.colorscheme('yume')
  end,
}
