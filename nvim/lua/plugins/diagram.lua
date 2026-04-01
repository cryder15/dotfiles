local function kitty_graphics_supported()
  local term = vim.env.TERM or ''
  local term_program = vim.env.TERM_PROGRAM or ''
  return term:find 'kitty' ~= nil
    or term_program == 'ghostty'
    or term_program == 'WezTerm'
    or vim.env.GHOSTTY_RESOURCES_DIR ~= nil
end

return {
  {
    '3rd/diagram.nvim',
    cond = kitty_graphics_supported,
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
    cond = kitty_graphics_supported,
    opts = {
      backend = 'kitty',
      integrations = {
        markdown = {
          enabled = true,
          clear_in_insert_mode = true,
          filetypes = { 'markdown', 'vimwiki' },
        },
      },
      tmux_passthrough_enabled = true,
      max_width = 100,
      max_height = 20,
    },
  },
}
