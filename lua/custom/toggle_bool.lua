local M = {}

local function toggle_true_false_ignore_case()
  local row, col = unpack(vim.api.nvim_win_get_cursor(0))
  local line = vim.api.nvim_get_current_line()

  local from = math.max(1, col - 5)
  local to = math.min(#line, col + 5)
  local snippet = line:sub(from, to)

  -- Find 'true' or 'false' case-insensitive
  local s, e, word = snippet:lower():find 'true'
  local replaced_word, replacement

  if s then
    -- Preserve original case style
    local original = snippet:sub(s, e)
    replacement = original:match '^%u' and 'False' or 'false'
    -- Replace in snippet
    snippet = snippet:sub(1, s - 1) .. replacement .. snippet:sub(e + 1)
  else
    s, e = snippet:lower():find 'false'
    if s then
      local original = snippet:sub(s, e)
      replacement = original:match '^%u' and 'True' or 'true'
      snippet = snippet:sub(1, s - 1) .. replacement .. snippet:sub(e + 1)
    else
      return -- no true/false nearby
    end
  end

  local new_line = line:sub(1, from - 1) .. snippet .. line:sub(to + 1)
  vim.api.nvim_set_current_line(new_line)
end

M.tb = toggle_true_false_ignore_case
return M
