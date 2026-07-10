return {
  root_dir = function()
    return vim.fn.executable('gopls') == 1 and vim.fn.executable('go') == 1
  end,
}
