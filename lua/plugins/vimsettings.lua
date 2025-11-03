vim.o.hidden = true

vim.o.mouse = 'nvi'
vim.o.mousefocus = false

vim.g.mapleader = ','
vim.g.maplocalleader = ','

vim.g.have_nerd_font = false

vim.o.number = true
vim.o.relativenumber = true

vim.o.mouse = 'a'
vim.o.showmode = false

vim.schedule(function()
  vim.o.clipboard = 'unnamedplus'
end)

vim.o.breakindent = true
vim.o.undofile = true

-- Case-insensitive searching UNLESS \C or one or more capital letters in the search term
vim.o.ignorecase = true
vim.o.smartcase = true

-- Keep signcolumn on by default
vim.o.signcolumn = 'yes'

-- Decrease update time
vim.o.updatetime = 250

-- Decrease mapped sequence wait time
vim.o.timeoutlen = 300

-- Configure how new splits should be opened
vim.o.splitright = true
vim.o.splitbelow = true

--   and `:help lua-options-guide`
vim.o.list = true
vim.opt.listchars = { tab = '» ', trail = '·', nbsp = '␣' }

-- Preview substitutions live, as you type!
vim.o.inccommand = 'split'

vim.o.cursorline = true

-- Minimal number of screen lines to keep above and below the cursor.
vim.o.scrolloff = 1
vim.o.scroll = 0

-- if performing an operation that would fail due to unsaved changes in the buffer (like `:q`),
vim.o.confirm = true

vim.g.lazygit_floating_window_use_plenary = 1
vim.g.lazygit_floating_window_winblend = 10 -- transparency
vim.g.lazygit_floating_window_scaling_factor = 0.9
