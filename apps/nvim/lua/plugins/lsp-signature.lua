return {
  'ray-x/lsp_signature.nvim',
  event = 'InsertEnter',
  opts = {
    bind = true,
    handler_opts = {
      border = 'rounded',
    },
    toggle_key = '<C-K>',
    select_signature_key = '<C-J>',
    move_cursor_key = '<C-p>',
  },
}
