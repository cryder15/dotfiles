return {
  'linrongbin16/gitlinker.nvim',
  cmd = 'GitLink',
  opts = {},
  keys = {
    { '<leader>yg', '<cmd>GitLink<cr>', mode = { 'n', 'v' }, desc = 'Yank git link' },
    { '<leader>yG', '<cmd>GitLink!<cr>', mode = { 'n', 'v' }, desc = 'Open git link in browser' },
  },
}
