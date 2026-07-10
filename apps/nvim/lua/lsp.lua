local servers = {
  'cssls',
  'gopls',
  'harper_ls',
  'hls',
  'html',
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
