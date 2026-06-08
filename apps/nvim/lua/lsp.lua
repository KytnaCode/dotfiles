local servers = {
  'gopls',
  'jsonls',
  'lua_ls',
  'nixd',
  'qmlls',
  'taplo',
  'yamlls',
}

for _, server in pairs(servers) do
  vim.lsp.enable(server)
end
