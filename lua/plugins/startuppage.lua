return {
  {
    'goolord/alpha-nvim',
    dependencies = { 'nvim-tree/nvim-web-devicons' },
    config = function()
      local dashboard = require 'alpha.themes.dashboard'

      -- Customize the buttons here
      local builtin = require 'telescope.builtin'
      dashboard.section.buttons.val = {
        dashboard.button('<space>', '🟡 Find file', function()
          builtin.find_files { cwd = '~/Documents' }
        end),
        dashboard.button('r', '♻️ Recent files', ':Telescope oldfiles<CR>'),
        dashboard.button('n', '📄 New file', ':ene <BAR> startinsert <CR>'),
        dashboard.button('p', '📪 Find project', ":lua require'telescope'.extensions.project.project{}<CR>"),
        dashboard.button('s', '⚙️ Settings', ':e $MYVIMRC<CR>'),
        dashboard.button('q', '❌ Quit NVIM', ':qa<CR>'),
      }
      local function center_multiline(lines)
        local centered = {}
        local pad = 0
        for count, line in ipairs(lines) do
          line = tostring(line)
          local halfline = math.floor(vim.fn.strdisplaywidth(line) / 2)
          table.insert(centered, string.rep(' ', pad - halfline) .. line)
          if count == 1 then
            pad = halfline
          end
        end
        return table.concat(centered, '\n')
      end

      -- Footer msg
      local hour = tonumber(os.date '%H')
      local time = tostring(os.date '%H:%M')
      local msg

      if hour < 6 then
        msg = {
          '🌕 Gute Nacht, Jakob! 🌕',
        }
      elseif hour < 12 then
        msg = {
          '☀️ Guten Morgen! ☀️',
          'Viel Spaß und trink Mate!',
        }
      elseif hour < 14 then
        msg = {
          '🥗 Zeit fürs Mittagessen!! 🥗',
          'Mensa?',
        }
      elseif hour < 18 then
        msg = {
          '🌱 Schönen Nachmittag! 🌱',
          'Spikeball?',
        }
      elseif hour < 22 then
        msg = {
          '☀️ Entspannten Abend, Jakob! ☀️',
          'Es ist ' .. time,
        }
      else
        msg = {
          '🌅 Gute Nacht! Heute Lang? 🌅',
          'Es ist schon ' .. time,
        }
      end

      -- center these sections horizontally

      dashboard.section.footer.val = center_multiline(msg)

      dashboard.section.footer.opts = { position = 'center' }

      -- final layout: header, small gap, buttons, big gap pushing footer down, footer
      dashboard.opts.layout = {
        { type = 'padding', val = 4 }, -- top padding
        dashboard.section.header,
        { type = 'padding', val = 3 },
        dashboard.section.buttons,
        { type = 'padding', val = 5 },
        dashboard.section.footer,
      }

      -- only call setup once with the final opts
      require('alpha').setup(dashboard.opts)
    end,
  },
}
