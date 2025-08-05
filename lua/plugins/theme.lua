return {
  {
    'folke/tokyonight.nvim',
    priority = 1000, -- Make sure to load this before all the other start plugins.
    config = function()
      ---@diagnostic disable-next-line: missing-fields
      require('tokyonight').setup {
        styles = {
          comments = { italic = false }, -- Disable italics in comments
        },
      }
      vim.opt.fillchars = vim.opt.fillchars + { vert = '│', horiz = '━' }

      vim.cmd.colorscheme 'tokyonight-night'

      vim.api.nvim_set_hl(0, 'VertSplit', { fg = '#6fc3df', bg = 'NONE' })
      vim.api.nvim_set_hl(0, 'WinSeparator', { fg = '#6fc3df', bg = 'NONE' })
    end,
  },
}
