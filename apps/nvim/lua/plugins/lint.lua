return {
  'mfussenegger/nvim-lint',
  config = function()
    require('lint').linters_by_ft = {
      lua = { 'selene' },
      nix = { 'deadnix', 'statix' },
      go = { 'golangcilint' },
    }
  end,
}
