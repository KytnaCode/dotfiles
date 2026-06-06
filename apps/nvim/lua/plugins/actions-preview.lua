return {
  'aznhe21/actions-preview.nvim',
  opts = {
    highlight_comnand = {
      require('actions-preview.highlight').delta(),
      require('actions-preview.highlight').diff_so_fancy(),
      require('actions-preview.highlight').diff_highlight(),
    },
  },
}
