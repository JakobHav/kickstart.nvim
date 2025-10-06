return {
  {
    'stevearc/oil.nvim',
    dependencies = { 'nvim-tree/nvim-web-devicons' },
    lazy = false,
    config = function()
      require('oil').setup {
        view_options = {
          -- Show hidden files and directories
          show_hidden = true,

          -- Consider a file/folder hidden if it starts with a dot
          is_hidden_file = function(name, bufnr)
            -- Only hide if show_hidden is false
            return false
          end,

          -- Nothing is "always hidden"
          is_always_hidden = function(name, bufnr)
            return false
          end,
        },
      }
    end,
  },
}
