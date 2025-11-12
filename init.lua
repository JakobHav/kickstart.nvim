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

  {
    'stevearc/conform.nvim',
    event = { 'BufWritePre' },
    cmd = { 'ConformInfo' },
    keys = {
      {
        '<leader>f',
        function()
          require('conform').format { async = true, lsp_format = 'fallback' }
        end,
        mode = '',
        desc = '[F]ormat buffer',
      },
    },
    opts = {
      notify_on_error = true,
      format_on_save = {
        timeout_ms = 500,
        lsp_format = 'fallback',
      },
      formatters_by_ft = {
        lua = { 'stylua' },
        python = { 'ruff', 'autopep8' },
        rust = { 'rustfmt' },
        cpp = { 'clang-format' },
        c = { 'clang-format' },
        java = { 'clang-format' },
        html = { 'prettier' },
        typescript = { 'prettier' },
        javascript = { 'prettier' },
        json = { 'prettier' },
        css = { 'prettier' },
        markdown = { 'marksman' },
      },
    },
  },
  require 'plugins/nvim-lspconfig', -- LSP Config + Conform (Format)

  require 'plugins/blink', -- Autocompletion

  require 'plugins/other', -- various small independent plugins/modules

  require 'plugins/treesitter', -- Highlight, edit, and navigate code

  require 'plugins/theme', -- Theme

  require 'plugins/startuppage', -- Startup

  require 'plugins/multiline', -- multiline cursur

  require 'plugins/markdown', -- MD Preview
}

-- Vim prefs
require 'plugins/vimsettings'

-- Keymaps
require 'plugins/keymaps'

-- vim: ts=2 sts=2 sw=2 et
