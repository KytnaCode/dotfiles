local M = {}

--- @param table table
function M.print_table(table, ident)
  for key, value in pairs(table) do
    if type(value) == "table" then
      print((ident or "") .. key .. " = {")
      M.print_table(value, (ident or "") .. "  ")
      print((ident or "") .. "}")
    else
      print((ident or "") .. key .. " = " .. tostring(value))
    end
  end
end

return M
