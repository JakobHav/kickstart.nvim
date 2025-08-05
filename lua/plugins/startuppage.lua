return {
  {
    'goolord/alpha-nvim',
    dependencies = { 'nvim-tree/nvim-web-devicons' },
    config = function()
      local dashboard = require 'alpha.themes.dashboard'

      -- -- Customize the header (optional)
      -- dashboard.section.header.val = {
      --   '  ⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣀⣤⣴⣶⣶⣦⣤⣀⠀⠀⠀⠀⠀⠀⠀',
      --   '  ⠀⠀⠀⠀⠀⠀⠀⢀⣴⣿⡿⠛⠉⠙⠛⠻⣿⣿⣦⡀⠀⠀⠀⠀',
      --   '  ⠀⠀⠀⠀⠀⠀⢠⣿⣿⠋⠀⠀⠀⠀⠀⠀⠈⢿⣿⣿⡄⠀⠀⠀',
      --   '  ⠀⠀⠀⠀⠀⠀⣼⣿⡇⠀⠀⣠⣶⣶⣦⠀⠀⢸⣿⣿⣧⠀⠀⠀',
      --   '  ⠀⠀⠀⠀⠀⠀⢿⣿⣧⠀⠀⠈⠻⠿⠋⠀⠀⣼⣿⣿⡿⠀⠀⠀',
      --   '  ⠀⠀⠀⠀⠀⠀⠈⠻⣿⣷⣄⠀⠀⠀⠀⣠⣾⣿⠟⠁⠀⠀⠀⠀',
      --   '  ⠀⠀⠀⠀⠀⠀⠀⠀⠙⠻⢿⣿⣶⣶⣿⠿⠛⠁⠀⠀⠀⠀⠀⠀',
      -- }

      -- Customize the buttons here
      dashboard.section.buttons.val = {
        dashboard.button('f', '  Find file', ':Telescope find_files<CR>'),
        dashboard.button('r', '  Recent files', ':Telescope oldfiles<CR>'),
        dashboard.button('n', '  New file', ':ene <BAR> startinsert <CR>'),
        dashboard.button('p', '  Find project', ":lua require'telescope'.extensions.project.project{}<CR>"),
        dashboard.button('F', '  Open folder (Documents)', ':Telescope find_files cwd=~/Documents<CR>'),
        dashboard.button('s', '  Settings', ':e $MYVIMRC<CR>'),
        dashboard.button('q', '  Quit NVIM', ':qa<CR>'),
      }

      -- Optional: footer message
      dashboard.section.footer.val = 'Have a productive day!'

      -- Apply layout
      require('alpha').setup(dashboard.config)
    end,
  },
}
