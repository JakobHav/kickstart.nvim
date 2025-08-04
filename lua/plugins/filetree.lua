return {
  {
    -- File Tree
    'nvim-neo-tree/neo-tree.nvim',
    branch = 'v3.x',
    dependencies = {
      'nvim-lua/plenary.nvim',
      'nvim-tree/nvim-web-devicons', -- for file icons
      'MunifTanjim/nui.nvim',
    },
    config = function()
      require('neo-tree').setup {
        close_if_last_window = true, -- Close Neo-tree if it's the last window
        popup_border_style = 'rounded',
        enable_git_status = true,
        enable_diagnostics = true,
        default_component_configs = {
          indent = { padding = 0 },
          icon = {
            folder_closed = '',
            folder_open = '',
            folder_empty = 'ﰊ',
            default = '',
            folder_empty_open = '',
          },
        },
        window = {
          position = 'right',
          width = 30,
          mappings = {
            ['<space>'] = 'toggle_node',
            ['<cr>'] = 'open',
            ['<esc>'] = 'close_window',
          },
        },
      }
    end,
  },
}
