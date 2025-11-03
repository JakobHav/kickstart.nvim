return {
  {
    'stevearc/conform.nvim',
    event = { 'BufWritePre' },
    cmd = { 'ConformInfo' },
    keys = {
      {
        '<leader>f',
        function()
          require('conform').format { async = true, lsp_format = 'fallback' }
        end,
        mode = '',
        desc = '[F]ormat buffer',
      },
    },
    opts = {
      notify_on_error = true,
      format_on_save = {
        timeout_ms = 500,
        lsp_format = 'fallback',
      },
      formatters_by_ft = {
        lua = { 'stylua' },
        python = { 'ruff', 'autopep8' },
        rust = { 'rustfmt' },
        cpp = { 'clang-format' },
        c = { 'clang-format' },
        java = { 'clang-format' },
        html = { 'prettier' },
        typescript = { 'prettier' },
        javascript = { 'prettier' },
        json = { 'prettier' },
        css = { 'prettier' },
      },
    },
  },
}
