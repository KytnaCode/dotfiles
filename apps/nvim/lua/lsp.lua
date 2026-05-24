local servers = {
  'lua_ls',
  'jsonls',
  'taplo',
  'nixd',
}

for _, server in pairs(servers) do
  vim.lsp.enable(server)
end
