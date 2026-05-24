return {
  'akinsho/bufferline.nvim',
  version = '*',
  dependencies = 'nvim-tree/nvim-web-devicons',
  opts = {
    options = {
      close_command = 'Bdelete: %d',
      right_mouse_command = 'Bdelete: %d',
      middle_mouse_command = 'Bwipeout: %d',
      offsets = {
        {
          filetype = 'neo-tree',
          text = 'Tree',
          text_align = 'left',
          separator = 'true',
        },
      },
    },
  },
}
