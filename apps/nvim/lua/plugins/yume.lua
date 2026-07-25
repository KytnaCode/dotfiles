return {
  'kytnacode/yume',
  lazy = false,
  priority = 1000,
  config = function()
    require('yume').setup({
      integrations = {
        neotree = true,
        bufferline = true,
      },
    })

    vim.cmd.colorscheme('yume')
  end,
}
