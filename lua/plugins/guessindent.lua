return {
  {
    'NMAC427/guess-indent.nvim',
    event = 'BufReadPre',
    config = function()
      require('guess-indent').setup {
        auto_cmd = true,
        override_editorconfig = false,
      }
    end,
  },
}
