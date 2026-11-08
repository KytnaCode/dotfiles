return {
  'mfussenegger/nvim-lint',
  config = function()
    require('lint').linters_by_ft = {
      go = { 'golangcilint' },
      javascript = { 'eslint_d' },
      javascriptreact = { 'eslint_d' },
      lua = { 'selene' },
      nix = { 'deadnix', 'statix' },
      python = { 'ruff' },
      sh = { 'shellcheck' },
      typescript = { 'eslint_d' },
      typescriptreact = { 'eslint_d' },
    }
  end,
}
