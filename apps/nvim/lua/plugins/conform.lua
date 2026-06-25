---@param bufnr integer
---@param ... string
---@return string
local function first(bufnr, ...)
  local conform = require('conform')
  for i = 1, select('#', ...) do
    local formatter = select(i, ...)
    if conform.get_formatter_info(formatter, bufnr).available then
      return formatter
    end
  end
  return select(1, ...)
end

local javascript_formatters = function(bufnr)
  return {
    first(bufnr, 'prettierd', 'prettier'),
    'eslint_d',
  }
end

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
