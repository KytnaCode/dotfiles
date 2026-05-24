local servers = {
  'lua_ls',
  'jsonls',
  'nixd',
}

for _, server in pairs(servers) do
  vim.lsp.enable(server)
end
