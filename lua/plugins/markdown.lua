return {
  {
    'iamcco/markdown-preview.nvim',
    cmd = { 'MarkdownPreviewToggle', 'MarkdownPreview', 'MarkdownPreviewStop' },
    build = 'cd app && yarn install',
    config = function()
      vim.g.mkdp_filetypes = { 'markdown' }
      vim.g.mkdp_auto_open = 0

      vim.g.mkdp_markdown_css = vim.fn.expand '~/.config/nvim/md.css'

      vim.g.mkdp_port = 8080
      vim.g.mkdp_open_to_the_world = 0
      vim.g.mkdp_browser = ''

      vim.g.mkdp_browserfunc = 'NoBrowserLaunch' -- custom function
      vim.cmd [[
      function! NoBrowserLaunch(url)
        " do nothing
      echo "Markdown preview URL: " . a:url
      endfunction
    ]]
    end,
    ft = { 'markdown' },
  },
}
