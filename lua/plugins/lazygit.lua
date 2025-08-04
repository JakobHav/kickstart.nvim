return {
  {
    'kdheepak/lazygit.nvim',
    cmd = 'LazyGit',
    keys = {
      { '<leader>gg', '<cmd>LazyGit<cr>', desc = 'Open Lazygit' },
    },
    dependencies = {
      'nvim-lua/plenary.nvim',
    },
  },
}
