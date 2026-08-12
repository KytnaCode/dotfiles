local M = {}

local ls = require('luasnip')
local i = ls.insert_node
local sn = ls.snippet_node

--- get_separator_pattern matches a string of characters to be escaped, characters are escaped
--- for fmt or fmta luasnip functions, for example '<>' will replace all occurrences of '<' with
--- '<<' and all occurrences of '>' with '>>'.
--- @param separators string - list of characters to escape.
--- @return string - lua pattern to match separators.
local function get_separator_pattern(separators)
  local pattern = '['

  for char in string.gmatch(separators, '.') do
    pattern = pattern .. char
  end

  pattern = pattern .. ']'

  return pattern
end

function M.get_visual(_, parent)
  if #parent.snippet.env.LS_SELECT_RAW > 0 then
    return sn(nil, i(1, parent.snippet.env.LS_SELECT_RAW))
  else -- If LS_SELECT_RAW is empty, return a blank insert node
    return sn(nil, i(1))
  end
end

--- read_block reads a snippet block from `<config_path>/snippet_blocks/<language>/<name>.snippet`
--- escapes occurrences of the given separators if any.
--- @param language string - snippet language, it doesn't necessary need to match filetype,
---   but it's recommended.
--- @param name string - snippet block name without the `.snippet` extension.
--- @param separators? string - an optional list of separators characters to escape.
--- @return string - the snippet block content, escaped if necessary.
function M.read_block(language, name, separators)
  local config_dir = vim.fn.stdpath('config')

  local snippet_file = string.format('%s.snippet', name)

  local block_path = vim.fs.joinpath(config_dir, 'snippet_blocks', language, snippet_file)

  local content = vim.fn.readblob(block_path)

  local seps = separators or '<>'

  if #seps == 0 then
    return content
  end

  local pattern = get_separator_pattern(seps)

  local escaped = string.gsub(content, pattern, '%1%1')

  return escaped
end

return M
