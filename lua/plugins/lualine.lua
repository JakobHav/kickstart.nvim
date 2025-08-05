return {
  {
    'nvim-lualine/lualine.nvim',
    dependencies = { 'nvim-tree/nvim-web-devicons' },
    config = function()
      require('lualine').setup {
        options = {
          theme = 'auto',
          component_separators = { left = '', right = '' },
          section_separators = { left = '', right = '' },
          icons_enabled = true,
          globalstatus = true,
        },
        sections = {
          lualine_a = { 'mode' },
          lualine_b = { 'branch' },
          lualine_c = { 'filename' },
          lualine_x = { 'filetype' },
          lualine_y = { 'location' },
          lualine_z = { { 'datetime', style = '%H:%M Uhr' } },
        },
        tabline = {
          lualine_a = { { 'buffers', symbols = { alternate_file = '', directory = true } } },
          lualine_z = { 'tabs' },
        },
        extensions = { 'nvim-tree' },
      }
    end,
  },
}
