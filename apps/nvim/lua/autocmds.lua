local group = vim.api.nvim_create_augroup
local cmd = vim.api.nvim_create_autocmd

local lint_group = 'NvimLint'

group(lint_group, { clear = true })

cmd('BufWritePost', {
  desc = 'lints current buffer',
  group = lint_group,
  callback = function()
    local should_not_lint = vim.b.disable_lint

    if should_not_lint == nil then
      should_not_lint = vim.g.disable_lint
    end

    if should_not_lint == 1 then
      return
    end

    require('lint').try_lint()
  end,
})

local number_group = 'RelativeNumber'

group(number_group, { clear = true })

cmd('ModeChanged', {
  group = number_group,
  desc = 'dynamically set relative number',
  pattern = { '*:n', '*:v' },
  callback = function()
    vim.wo.relativenumber = true
  end,
})

cmd('ModeChanged', {
  group = number_group,
  desc = 'dynamically set relative number',
  pattern = { '*:i' },
  callback = function()
    vim.wo.relativenumber = false
  end,
})

local session_group = 'Sessions'

group(session_group, { clear = true })

local function file_exists(f)
  if vim.uv.fs_stat(f) == nil then
    return false
  end

  return true
end

local function is_buf_empty(bufnr)
  local lines = vim.api.nvim_buf_get_lines(bufnr, 0, -1, false)

  if #lines == 0 then
    return true
  end

  for _, line in ipairs(lines) do
    if #line > 0 then
      return false
    end
  end

  return true
end

cmd('VimLeavePre', {
  group = session_group,
  desc = 'automatically store sessions',
  callback = function()
    local shouldCloseWin = function(win)
      if win == nil then
        return false
      end

      if vim.api.nvim_win_get_config(win).relative ~= '' then
        return true
      end

      local buf = vim.api.nvim_win_get_buf(win)

      if vim.bo[buf].filetype == 'neo-tree' then
        return true
      end
    end

    local shouldCloseBuf = function(buf)
      if vim.bo[buf].buftype ~= '' then
        return true
      end

      if not file_exists(vim.api.nvim_buf_get_name(buf)) then
        return true
      end

      return false
    end

    local is_session_empty = true

    for _, win in ipairs(vim.api.nvim_list_wins()) do
      if shouldCloseWin(win) then
        vim.api.nvim_win_close(win, false)
      end
    end

    for _, buf in ipairs(vim.api.nvim_list_bufs()) do
      local is_empty = true

      if vim.api.nvim_buf_is_valid(buf) and vim.api.nvim_buf_is_loaded(buf) then
        is_empty = false
      end

      if not is_buf_empty(buf) then
        is_empty = false
      end

      if shouldCloseBuf(buf) then
        vim.api.nvim_buf_delete(buf, { force = true })
        is_empty = true
      end

      is_session_empty = is_empty and is_session_empty
    end

    if not is_session_empty then
      require('mini.sessions').write('Session.vim')
    end
  end,
})
