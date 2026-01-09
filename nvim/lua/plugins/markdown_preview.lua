return {
  {
    'iamcco/markdown-preview.nvim',
    cmd = { 'MarkdownPreviewToggle', 'MarkdownPreview', 'MarkdownPreviewStop' },
    ft = { 'markdown', 'mermaid' },
    build = 'cd app && npm install',
    init = function()
      vim.g.mkdp_filetypes = { 'markdown', 'mermaid' }
    end,
    -- THIS SECTION ADDS THE KEYBINDING
    keys = {
      {
        '<leader>mp',
        '<cmd>MarkdownPreviewToggle<cr>',
        desc = 'Toggle Markdown Preview',
      },
    },
    config = function()
      vim.g.mkdp_preview_options = {
        mmarkdown = {
          mermaid = {
            theme = 'dark',
          },
        },
      }
      vim.g.mkdp_theme = 'dark'
    end,
  },
}
