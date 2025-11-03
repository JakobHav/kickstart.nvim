local toggle_bool = require 'toggle_bool'
local daylog = require 'daylog'
local builtin = require 'telescope.builtin'

-- Typst
vim.keymap.set('n', '<leader>p', '<cmd>TypstPreview<CR>', { desc = 'Typst [P]review on' })
vim.keymap.set('n', '<leader>ts', '<cmd>TypstPreviewStop<CR>', { desc = '[T]ypst [S]top Preview' })
vim.keymap.set('n', '<leader>tc', '<cmd>make<CR>', { desc = '[T]ypst [C]ompile' })

vim.keymap.set('n', '<leader>P', '<cmd>TypstPreview<CR>', { desc = 'Typst [P]review off' })

-- Git
local function cd_git()
  local path = vim.fn.expand '%:p:h' -- absolute path to current file's dir
  if path ~= '' then
    vim.fn.chdir(path)
    vim.cmd 'LazyGit'
  end
end
vim.keymap.set('n', '<leader>g', cd_git, { desc = 'Git' })

-- LSP

vim.keymap.set('n', '<leader>d', 'grD', { desc = '[D]efinition' })

-- Gitsigns

vim.keymap.set('n', '<leader>tg', '<cmd>Gitsigns toggle_signs<CR>', { desc = '[T]oggle [G]itsigns' })

-- Oil
vim.keymap.set('n', '-', '<CMD>Oil<CR>', { desc = 'Open Oil' })

-- Move through buffers
vim.keymap.set('n', '<Tab>', '<cmd>bnext<CR>', { desc = 'Next buffer' })
vim.keymap.set('n', '<S-Tab>', '<cmd>bprevious<CR>', { desc = 'Previous buffer' })

-- kill current buffer
vim.keymap.set('n', '<leader>q', '<cmd>bd!<CR>', { desc = '[Q]uit Current Buffer' })

-- Exit Terminal
vim.keymap.set('t', '<Esc>', [[<C-\><C-n>]], { desc = 'Terminal: Exit to normal mode' })

-- Cmd-Z/Redom, Cmd-S, Cmd-V
vim.keymap.set({ 'n', 'i' }, '<D-z>', 'u', { noremap = true })
vim.keymap.set({ 'n', 'i' }, '<D-Z>', '<C-r>', { noremap = true })

vim.keymap.set({ 'n', 'i' }, '<esc>z', 'u', { noremap = true })

vim.keymap.set({ 'n', 'i', 'v' }, '<D-s>', '<cmd>w<CR>')

vim.keymap.set({ 'i' }, '<C-v>', '<C-r>+', { desc = 'Paste' })
vim.keymap.set({ 'i' }, '<D-v>', '<C-r>+', { desc = 'Paste' })

-- Window Nav

vim.keymap.set({ 'n', 'i', 'v' }, '<C-h>', '<C-w><C-h>', { desc = 'Move focus to the left window' })
vim.keymap.set({ 'n', 'i', 'v' }, '<C-l>', '<C-w><C-l>', { desc = 'Move focus to the right window' })
vim.keymap.set({ 'n', 'i', 'v' }, '<C-j>', '<C-w><C-j>', { desc = 'Move focus to the lower window' })
vim.keymap.set({ 'n', 'i', 'v' }, '<C-k>', '<C-w><C-k>', { desc = 'Move focus to the upper window' })

vim.keymap.set({ 'n', 'i', 'v' }, '<C-enter>', '<C-w><C->><C-w><C->><C-w><C->>', { desc = 'Increase Width' })
vim.keymap.set({ 'n', 'i', 'v' }, '<C-esc>', '<C-w><C-<><C-w><C-<><C-w><C-<>', { desc = 'Decrease Width' })

-- Disable arrows in normal mode
vim.keymap.set('n', '<left>', '<cmd>echo "🟡 Use h to move!!"<CR>')
vim.keymap.set('n', '<right>', '<cmd>echo "🟡 Use l to move!!"<CR>')
vim.keymap.set('n', '<up>', '<cmd>echo "🟡 Use k to move!!"<CR>')
vim.keymap.set('n', '<down>', '<cmd>echo "🟡 Use j to move!!"<CR>')

-- Telescope
vim.keymap.set('n', '<leader>sh', builtin.help_tags, { desc = '[S]earch [H]elp' })
vim.keymap.set('n', '<leader>sk', builtin.keymaps, { desc = '[S]earch [K]eymaps' })
vim.keymap.set('n', '<leader><leader>', function()
  builtin.find_files { cwd = '~/Documents' }
end, { desc = 'Search Files' })
vim.keymap.set('n', '<leader>sf', builtin.find_files, { desc = '[S]earch [Files' })
vim.keymap.set('n', '<leader>ss', builtin.builtin, { desc = '[S]earch [S]elect Telescope' })
vim.keymap.set('n', '<leader>sw', builtin.grep_string, { desc = '[S]earch current [W]ord' })
vim.keymap.set('n', '<leader>sg', builtin.live_grep, { desc = '[S]earch by [G]rep' })
vim.keymap.set('n', '<leader>sd', builtin.diagnostics, { desc = '[S]earch [D]iagnostics' })
vim.keymap.set('n', '<leader>sr', builtin.resume, { desc = '[S]earch [R]esume' })
vim.keymap.set('n', '<leader>r', builtin.oldfiles, { desc = 'Search [R]ecent Files' })
vim.keymap.set('n', '<leader>sx', builtin.buffers, { desc = '[S]earch e[x]isting buffers' })
vim.keymap.set('n', '<leader>sv', '<cmd>find ~/.config/nvim/init.lua<CR>', { desc = '[Search] [V]IM Config' })

require('todo-comments').setup {
  search = {
    command = 'rg',
    args = {
      '--color=never',
      '--no-heading',
      '--with-filename',
      '--line-number',
      '--column',
      '--max-depth=5',
    },
    pattern = [[\b(KEYWORDS):]],
  },
}

vim.keymap.set('n', '<leader>sT', '<cmd>TodoTelescope cwd=~/Documents/<cr>', { desc = '[S]earch [T]ODOS' })
vim.keymap.set('n', '<leader>st', '<cmd>TodoTelescope cwd=~/Documents/ keywords=TODO,FIX<cr>', { desc = '[S]earch [T]ODO/FIX' })

-- Add Telescope
vim.keymap.set('n', '<leader><space>', function()
  builtin.current_buffer_fuzzy_find(require('telescope.themes').get_dropdown {
    winblend = 10,
    previewer = false,
  })
end, { desc = '[ ] Find' })

vim.keymap.set('n', '<leader>s/', function()
  builtin.live_grep {
    grep_open_files = true,
    prompt_title = 'Live Grep in Open Files',
  }
end, { desc = '[S]earch [/] in Open Files' })

-- Shortcut for searching your Neovim configuration files
vim.keymap.set('n', '<leader>sn', function()
  builtin.find_files { cwd = vim.fn.stdpath 'config' }
end, { desc = '[S]earch [N]eovim files' })

-- Comment
vim.keymap.set('n', '<leader>c', function()
  require('Comment.api').toggle.linewise.current()
end, { desc = 'Toggle [C]omment' })

vim.keymap.set('v', '<leader>c', function()
  local esc = vim.api.nvim_replace_termcodes('<ESC>', true, false, true)
  vim.api.nvim_feedkeys(esc, 'nx', false)
  require('Comment.api').toggle.linewise(vim.fn.visualmode())
end, { desc = 'Toggle [C]omment' })

-- Other
vim.keymap.set('n', '<Esc>', '<cmd>nohlsearch<CR>')
vim.keymap.set('n', '<leader>v', '<cmd>vsplit<CR>', { desc = '[V]Split' })
vim.keymap.set('n', '<leader>m', '<C-w>q', { desc = 'Close Split' })

vim.api.nvim_create_user_command('OpenDrawio', function()
  vim.fn.jobstart({ 'drawio', vim.fn.expand '%:p' }, { detach = true })
end, {})

-- Project Management
vim.api.nvim_set_keymap('n', '<leader>sp', "<cmd>lua require'telescope'.extensions.project.project{}<CR>", { noremap = true, silent = true })

-- Goto current file's directory
vim.keymap.set('n', '<leader><tab>', function()
  local path = vim.fn.expand '%:p:h' -- absolute path to current file's dir
  if path == '' then
    print '❌ No current file.'
    return
  end
  vim.fn.chdir(path) -- change working directory
  print '✅ Changed directory!'
end, { desc = 'Goto current file path' })

-- Copy Path
vim.keymap.set('n', '<leader>s<tab>', function()
  local path = vim.fn.expand '%:p:h'
  local home = vim.env.HOME
  local tilde_path = path:gsub('^' .. vim.pesc(home), '~')
  vim.fn.setreg('+', 'cd ' .. tilde_path)
  print '✅ Copied Path!'
end, { desc = 'Copy Path' })

-- Store the current state in a global variable
_G.diagnostics_update_in_insert = _G.diagnostics_update_in_insert or false

function ToggleUpdateInInsert()
  -- Flip the value
  _G.diagnostics_update_in_insert = not _G.diagnostics_update_in_insert

  -- Reconfigure diagnostics
  vim.diagnostic.config {
    virtual_text = true,
    signs = true,
    underline = true,
    update_in_insert = _G.diagnostics_update_in_insert,
  }

  -- Notify the user
  if _G.diagnostics_update_in_insert then
    vim.notify 'Diagnostics: update in Insert mode ENABLED'
  else
    vim.notify 'Diagnostics: update in Insert mode DISABLED'
  end
end

vim.keymap.set('n', '<leader>td', ToggleUpdateInInsert, { desc = '[T]oggle [d]iagnostics update_in_insert' })

-- Toggle Bool
vim.keymap.set('n', '<C-t>', toggle_bool.tb, { desc = 'Toggle true/false (ignore case)' })

vim.api.nvim_create_user_command('Daylog', function()
  daylog.open_floating_window()
end, {})
