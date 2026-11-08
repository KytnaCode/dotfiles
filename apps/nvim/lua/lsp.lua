local servers = {
  'bashls',
  'cssls',
  'gopls',
  -- 'harper_ls',
  'hls',
  'html',
  'jsonls',
  'lua_ls',
  'nginx_language_server',
  'nixd',
  'ltex_plus',
  -- 'pylsp',
  'basedpyright',
  'qmlls',
  'sqls',
  'systemd_lsp',
  'tailwindcss',
  'taplo',
  'texlab',
  'ts_ls',
  'yamlls',
}

for _, server in pairs(servers) do
  vim.lsp.enable(server)
end
