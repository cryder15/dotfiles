return {
  {
    '3rd/diagram.nvim',
    dependencies = { '3rd/image.nvim' },
    opts = {
      renderer_options = {
        mermaid = {
          background = 'transparent',
          theme = 'dark',
        },
      },
    },
  },
  {
    '3rd/image.nvim',
    opts = {
      backend = 'kitty', -- Best for Ghostty
      integrations = {
        markdown = {
          enabled = true,
          clear_in_insert_mode = true, -- Cleaner editing experience
          filetypes = { 'markdown', 'vimwiki' },
        },
      },
      tmux_passthrough_enabled = true,
      max_width = 100,
      max_height = 20,
    },
  },
}
