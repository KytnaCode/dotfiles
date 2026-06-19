local servers = {
  'cssls',
  'gopls',
  'jsonls',
  'lua_ls',
  'nixd',
  'ts_ls',
  'qmlls',
  'taplo',
  'html',
  'yamlls',
}

for _, server in pairs(servers) do
  vim.lsp.enable(server)
end
