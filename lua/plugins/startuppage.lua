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
      local builtin = require 'telescope.builtin'
      dashboard.section.buttons.val = {
        dashboard.button('f', '  Find file', function()
          builtin.find_files { cwd = '~/Documents' }
        end),
        dashboard.button('r', '  Recent files', ':Telescope oldfiles<CR>'),
        dashboard.button('n', '  New file', ':ene <BAR> startinsert <CR>'),
        dashboard.button('p', '  Find project', ":lua require'telescope'.extensions.project.project{}<CR>"),
        dashboard.button('s', '  Settings', ':e $MYVIMRC<CR>'),
        dashboard.button('q', '  Quit NVIM', ':qa<CR>'),
      }

      -- Optional: footer message
      local hour = tonumber(os.date '%H')
      local msg

      if hour < 6 then
        msg = '🌑 Good Night! 🌑'
      elseif hour < 12 then
        msg = '☀️ Good morning! ☀️\n Have fun and drink Mate!'
      elseif hour > 12 and hour < 14 then
        msg = '🥗 Lunchtime! 🥗\n Mensa?'
      elseif hour < 18 then
        msg = '🕒 Afternoon! 🕒\n Spikeball?'
      else
        msg = '🌅 Good evening!🌅\n Long day today?'
      end

      dashboard.section.footer.val = msg

      -- Center the footer text
      dashboard.section.footer.opts = {
        position = 'center',
      }

      -- Add vertical padding before the footer
      dashboard.section.footer.padding = 3

      -- Apply layout
      require('alpha').setup(dashboard.opts)
      require('alpha').setup(dashboard.config)
    end,
  },
}
