return {
  'nvim-lualine/lualine.nvim',
  dependencies = { 'nvim-tree/nvim-web-devicons' },
  opts = {
    component_separators = {
      left = '',
      right = '',
    },
    section_separators = {
      left = '',
      right = '',
    },
    sections = {
      lualine_a = { 'mode' },
      lualine_b = { 'branch diff diagnostics' },
      lualine_c = { 'filename' },
      lualine_x = { 'encoding' },
      lualine_y = { 'filetype' },
      lualine_z = { 'location' },
    },
    extensions = {
      'fugitive',
      'lazy',
      'neo-tree',
      'toggleterm',
      'trouble',
    },
  },
}
