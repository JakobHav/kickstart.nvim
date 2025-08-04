package.path = package.path .. ';/Users/jakobhaverkamp/.config/nvim/lua/custom/?.lua'

-- Plugins w Lazyvim
local lazypath = vim.fn.stdpath 'data' .. '/lazy/lazy.nvim'
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  local lazyrepo = 'https://github.com/folke/lazy.nvim.git'
  local out = vim.fn.system { 'git', 'clone', '--filter=blob:none', '--branch=stable', lazyrepo, lazypath }
  if vim.v.shell_error ~= 0 then
    error('Error cloning lazy.nvim:\n' .. out)
  end
end

---@type vim.Option
local rtp = vim.opt.rtp
rtp:prepend(lazypath)

require('lazy').setup {

  require 'plugins/theme', -- Theme

  require 'plugins/noice', -- Noice

  require 'plugins/oil', -- Oil

  require 'plugins/filetree', -- Neo-Tree filetree

  require 'plugins/comment', -- Comment

  require 'plugins/lazygit', -- Git

  require 'plugins/lualine', -- lualine

  require 'plugins/guessindent', -- Guess Indent

  require 'plugins/gitsigns', -- Gitsigns

  require 'plugins/typst', -- Typst

  require 'plugins/whichkey', -- Whichkey

  require 'plugins/telescope', -- Fuzzy Finder (files, lsp, etc)

  require 'plugins/lazydev', -- LSP Plugins

  require 'plugins/nvim-lspconfig', -- LSP Config

  require 'plugins/conform', -- Autoformat

  require 'plugins/blink', -- Autocompletion

  require 'plugins/other', -- various small independent plugins/modules

  require 'plugins/treesitter', -- Highlight, edit, and navigate code
}

-- Vim prefs
require 'plugins/vimsettings'

-- Keymaps
require 'plugins/keymaps'

-- vim: ts=2 sts=2 sw=2 et
