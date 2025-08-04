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
      vim.cmd.colorscheme 'tokyonight-night'
      opts = {
        config = function()
          -- Set thick block characters for vertical and horizontal splits
          vim.opt.fillchars = vim.opt.fillchars + { vert = '▉', horiz = '━' }

          -- Highlight VertSplit with a bright color (adjust the hex color as you like)
          vim.cmd 'highlight VertSplit guibg=NONE guifg=#ffffff'
        end,
      }
    end,
  },
}
