return {
  'SuperBo/fugit2.nvim',
  dependencies = {
    'MunifTanjim/nui.nvim',
    'nvim-tree/nvim-web-devicons',
    'nvim-lua/plenary.nvim',
    'sindrets/diffview.nvim',
  },
  cmd = { 'Fugit2', 'Fugit2Diff', 'Fugit2Graph', 'Fugit2Rebase' },
  opts = {},
  keys = {
    { '<leader>ng', '<cmd>Fugit2<cr>', desc = 'Fugit2' },
    { '<leader>nd', '<cmd>DiffviewOpen<cr>', desc = 'Diffview Open' },
    { '<leader>nG', '<cmd>Fugit2Graph<cr>', desc = 'Fugit2 Graph' },
  },
}
