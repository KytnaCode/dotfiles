return {
  'nvimdev/lspsaga.nvim',
  opts = {
    implements = {
      enable = false,
    },
    lightbulb = {
      virtual_text = false,
    },
  },
  dependencies = {
    'nvim-treesitter/nvim-treesitter',
    'nvim-tree/nvim-web-devicons',
  },
}
