return {
  {
    'chomosuke/typst-preview.nvim',
    lazy = false, -- or ft = 'typst'
    version = '1.*',
    opts = {}, -- lazy.nvim will implicitly calls `setup {}`
    config = function()
      require('typst-preview').setup {
        -- Custom format string to open the output link provided with %s
        -- Example: open_cmd = 'firefox %s -P typst-preview --class typst-preview'
        open_cmd = '',
        port = 8000,
      }
    end,
  },
}
