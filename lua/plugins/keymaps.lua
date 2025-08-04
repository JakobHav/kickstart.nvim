local toggle_bool = require 'toggle_bool'
local builtin = require 'telescope.builtin'

-- Typst
vim.keymap.set('n', '<leader>p', ':TypstWatch<CR>', { desc = 'Typst [P]review' })

-- Git
vim.keymap.set('n', '<leader>gg', '<cmd>LazyGit<CR>', { desc = 'Open Git' })

-- Oil
vim.keymap.set('n', '-', '<CMD>Oil<CR>', { desc = 'Open Oil' })

-- Move through buffers
vim.keymap.set('n', '<Tab>', ':bnext<CR>', { desc = 'Next buffer' })
vim.keymap.set('n', '<S-Tab>', ':bprevious<CR>', { desc = 'Previous buffer' })

-- kill current buffer
vim.keymap.set('n', '<leader>q', ':bd!<CR>', { desc = '[Q]uit Current Buffer' })

-- Exit Terminal
vim.keymap.set('t', '<Esc>', [[<C-\><C-n>]], { desc = 'Terminal: Exit to normal mode' })

-- Toggle Bool
vim.keymap.set('n', '<C-t>', toggle_bool.tb, { desc = 'Toggle true/false (ignore case)' })

-- Cmd-Z/Redom, Cmd-S, Cmd-V
vim.keymap.set({ 'n', 'i' }, '<D-z>', 'u', { noremap = true })
vim.keymap.set({ 'n', 'i' }, '<D-Z>', '<C-r>', { noremap = true })

vim.keymap.set({ 'n', 'i', 'v' }, '<D-s>', '<cmd>w<CR>')
vim.keymap.set({ 'i' }, '<C-v>', '<C-r>+', { desc = 'Paste' })
vim.keymap.set({ 'i' }, '<D-v>', '<C-r>+', { desc = 'Paste' })

-- Window Nav
vim.keymap.set({ 'n', 'i', 'v' }, '<C-b>', '<cmd>Neotree toggle<CR>', { noremap = true, silent = true })
vim.keymap.set({ 'n', 'i', 'v' }, '<C-n>', '<cmd>vsplit | terminal<CR>', { noremap = true, silent = true })

vim.keymap.set({ 'n', 'i', 'v' }, '<C-h>', '<C-w><C-h>', { desc = 'Move focus to the left window' })
vim.keymap.set({ 'n', 'i', 'v' }, '<C-l>', '<C-w><C-l>', { desc = 'Move focus to the right window' })
vim.keymap.set({ 'n', 'i', 'v' }, '<C-j>', '<C-w><C-j>', { desc = 'Move focus to the lower window' })
vim.keymap.set({ 'n', 'i', 'v' }, '<C-k>', '<C-w><C-k>', { desc = 'Move focus to the upper window' })

vim.keymap.set({ 'n', 'i', 'v' }, '<C-enter>', '<C-w><C->><C-w><C->><C-w><C->>', { desc = 'Increase Width' })
vim.keymap.set({ 'n', 'i', 'v' }, '<C-esc>', '<C-w><C-<><C-w><C-<><C-w><C-<>', { desc = 'Decrease Width' })

-- Disable arrows in normal mode
vim.keymap.set('n', '<left>', '<cmd>echo "Use h to move!!"<CR>')
vim.keymap.set('n', '<right>', '<cmd>echo "Use l to move!!"<CR>')
vim.keymap.set('n', '<up>', '<cmd>echo "Use k to move!!"<CR>')
vim.keymap.set('n', '<down>', '<cmd>echo "Use j to move!!"<CR>')

-- Telescope
vim.keymap.set('n', '<leader>sh', builtin.help_tags, { desc = '[S]earch [H]elp' })
vim.keymap.set('n', '<leader>sk', builtin.keymaps, { desc = '[S]earch [K]eymaps' })
vim.keymap.set('n', '<leader><leader>', builtin.find_files, { desc = 'Search Files' })
vim.keymap.set('n', '<leader>sf', builtin.find_files, { desc = '[S]earch [Files' })
vim.keymap.set('n', '<leader>ss', builtin.builtin, { desc = '[S]earch [S]elect Telescope' })
vim.keymap.set('n', '<leader>sw', builtin.grep_string, { desc = '[S]earch current [W]ord' })
vim.keymap.set('n', '<leader>sg', builtin.live_grep, { desc = '[S]earch by [G]rep' })
vim.keymap.set('n', '<leader>sd', builtin.diagnostics, { desc = '[S]earch [D]iagnostics' })
vim.keymap.set('n', '<leader>sr', builtin.resume, { desc = '[S]earch [R]esume' })
vim.keymap.set('n', '<leader>r', builtin.oldfiles, { desc = 'Search [R]ecent Files' })
vim.keymap.set('n', '<leader><space>', builtin.buffers, { desc = '[ ] Find existing buffers' })
vim.keymap.set({ 'n' }, '<leader>sv', '<cmd>find ~/.config/nvim/init.lua<CR>', { desc = '[Search] [V]IM Config' })

-- Add Telescope
vim.keymap.set('n', '<leader>0', function()
  builtin.current_buffer_fuzzy_find(require('telescope.themes').get_dropdown {
    winblend = 10,
    previewer = false,
  })
end, { desc = '[/] Fuzzily search in current buffer' })

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
end, { desc = 'Toggle comment (line)' })

vim.keymap.set('v', '<leader>c', function()
  local esc = vim.api.nvim_replace_termcodes('<ESC>', true, false, true)
  vim.api.nvim_feedkeys(esc, 'nx', false)
  require('Comment.api').toggle.linewise(vim.fn.visualmode())
end, { desc = 'Toggle comment (visual)' })

-- Toggle gitsigns
vim.keymap.set('n', '<leader>tg', function()
  require('gitsigns').toggle_signs()
end, { desc = 'Toggle GitSigns' })

-- Other
vim.keymap.set('n', '<Esc>', '<cmd>nohlsearch<CR>')
vim.keymap.set('n', '<leader>v', '<cmd>[v]split<CR>')
