local javascript_formatters = {
  'prettierd',
  'prettier',
  stop_after_first = true,
}

return {
  'stevearc/conform.nvim',
  event = { 'BufWritePre' },
  cmd = { 'ConformInfo' },
  ---@module "conform"
  ---@type conform.setupOpts
  opts = {
    formatters_by_ft = {
      lua = { 'stylua' },
      nix = { 'alejandra' },
      go = { 'golangci-lint' },
      javascript = javascript_formatters,
      javascriptreact = javascript_formatters,
      typescript = javascript_formatters,
      typescriptreact = javascript_formatters,
    },
    format_on_save = {
      timeout_ms = 500,
      lsp_format = 'fallback',
    },
  },
}
