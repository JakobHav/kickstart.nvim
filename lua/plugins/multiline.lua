return {
  {
    'mg979/vim-visual-multi',
    branch = 'master',
    init = function()
      vim.g.VM_maps = {
        ['Add Cursor Down'] = '<M-down>',
        ['Add Cursor Up'] = '<M-up>',
      }
    end,
  },
}
