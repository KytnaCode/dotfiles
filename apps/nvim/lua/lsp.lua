local servers = {
  'gopls',
  'lua_ls',
  'jsonls',
  'taplo',
  'qmlls',
  'nixd',
}

for _, server in pairs(servers) do
  vim.lsp.enable(server)
end
