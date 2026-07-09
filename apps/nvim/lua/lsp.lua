local servers = {
  'cssls',
  'gopls',
  'html',
  'hls',
  'jsonls',
  'lua_ls',
  'nixd',
  'qmlls',
  'tailwindcss',
  'taplo',
  'ts_ls',
  'yamlls',
}

for _, server in pairs(servers) do
  vim.lsp.enable(server)
end
