return {
  'mfussenegger/nvim-lint',
  lazy = true,
  config = function()
    require('lint').linters_by_ft = {
      lua = { 'selene' },
      nix = { 'deadnix', 'statix' },
    }
  end,
}
