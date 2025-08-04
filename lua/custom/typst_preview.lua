local M = {}
local pid = nil

function M.start_watch()
  local file = vim.fn.expand '%:p'
  if not file:match '%.typ$' then
    print 'Not a .typ file.'
    return
  end

  -- Kill any previous watcher
  if pid then
    vim.fn.jobstop(pid)
    pid = nil
  end

  -- Launch typst watch in background
  local output = file:gsub('%.typ$', 'test.pdf')
  pid = vim.fn.jobstart({ 'typst', 'watch', file, output }, {
    stdout_buffered = true,
    stderr_buffered = true,
    on_exit = function(_, code, _)
      if code ~= 0 then
        print('typst watch exited with code', code)
      end
    end,
  })

  print('Started typst watch for: ' .. file)
end

function M.compile()
  local file = vim.fn.expand '%:p'
  if not file:match '%.typ$' then
    print 'Not a .typ file.'
    return
  end

  -- Kill any previous watcher
  if pid then
    vim.fn.jobstop(pid)
    pid = nil
  end

  -- Launch typst watch in background
  local output = file:gsub('%.typ$', 'test.pdf')
  pid = vim.fn.jobstart({ 'typst', 'compile', file, output }, {
    stdout_buffered = true,
    stderr_buffered = true,
    on_exit = function(_, code, _)
      if code ~= 0 then
        print('typst watch exited with code', code)
      end
    end,
  })

  print('Started typst watch for: ' .. file)
end

function M.stop_watch()
  if pid then
    vim.fn.jobstop(pid)
    print 'Stopped typst watch.'
    pid = nil
  end
end

return M
