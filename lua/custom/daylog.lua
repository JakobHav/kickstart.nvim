local M = {}
local api = vim.api
local border_chars = { '╭', '─', '╮', '│', '╯', '─', '╰', '│' }

-------------------------------------------------------------------------------------
--- open window
local function open_floating_window(msg)
  local opts = {
    style = 'minimal',
    relative = 'editor',
    row = 10,
    col = 40,
    width = 120,
    height = 30,
    border = border_chars,
  }

  -- create a unlisted scratch buffer
  local buf = api.nvim_create_buf(false, true)

  -- create file window, enter the window, and use the options defined in opts
  local win = api.nvim_open_win(buf, true, opts)

  vim.bo[buf].bufhidden = 'hide'
  vim.wo[win].cursorcolumn = false
  vim.wo[win].signcolumn = 'no'

  api.nvim_set_hl(0, 'Float', { bg = '#1e1e2e', fg = '#ffffff' })
  api.nvim_set_hl(0, 'Border', { link = 'Normal', default = true })
  api.nvim_set_hl(0, 'Link', { link = 'Normal', default = true })

  vim.wo[win].winhl = 'NormalFloat:Float,FloatBorder:Border'
  vim.wo[win].winblend = 0
  vim.bo[buf].modifiable = true

  local function write_and_quit()
    local lines = api.nvim_buf_get_lines(buf, 2, -1, false)
    local text = table.concat(lines, '\n')

    -- you can process the text here
    print('Saved text: ' .. text)
    if api.nvim_win_is_valid(win) then
      api.nvim_win_close(win, true)
    end
  end
  -------------------------------------------------------------------------------------
  -- cycle through questions

  local question_index = 1
  local questions = { 'Was hast du heute gemacht?', 'Wie geht es dir heute?' }

  local function show_next_question()
    if question_index > #questions then
      quit_without_saving()
      write_and_quit()
    end
    --clear the buffer
    api.nvim_buf_set_lines(buf, 3, opts.height - 1, false, {})

    -- set the question at the top
    api.nvim_buf_set_lines(buf, 0, 1, false, { questions[question_index], '', '' })

    local empty_lines = vim.fn['repeat']({ '' }, opts.height - 2)
    api.nvim_buf_set_lines(buf, 3, 3, false, empty_lines)

    -- add instruction line at the bottom
    api.nvim_buf_set_lines(buf, opts.height - 1, opts.height - 1, false, { '[W]: Write, [Q]: Quit, [S]: Skip Question' })

    api.nvim_win_set_cursor(win, { 3, 0 })

    question_index = question_index + 1
  end

  show_next_question()

  -------------------------------------------------------------------------------------
  -- functions

  local function write_and_continue()
    local lines = api.nvim_buf_get_lines(buf, 2, -1, false)
    local text = table.concat(lines, '\n')
    show_next_question()

    print('Saved text: ' .. text)
  end

  local function quit_without_saving()
    if api.nvim_win_is_valid(win) then
      api.nvim_win_close(win, true)
    end
  end

  local function skip_question()
    show_next_question()
  end

  -----------------------------------------------------------------------------------

  -- set keybindings for this buffer
  local keymap_opts = { noremap = true, silent = true, buffer = buf }

  vim.keymap.set('n', 'w', write_and_continue, keymap_opts)
  vim.keymap.set('n', 'q', quit_without_saving, keymap_opts)
  vim.keymap.set('n', 's', skip_question, keymap_opts)

  -- enter insert mode automatically
  vim.cmd 'startinsert'

  return win, buf
end

M.open_floating_window = open_floating_window
return M
