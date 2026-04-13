return {
  'NeogitOrg/neogit',
  dependencies = {
    'nvim-lua/plenary.nvim',
    'sindrets/diffview.nvim',
    'nvim-telescope/telescope.nvim',
  },
  opts = {
    integrations = {
      diffview = true,
      telescope = true,
    },
  },
  keys = {
    { '<leader>ng', '<cmd>Neogit<cr>', desc = 'Neogit' },
    { '<leader>nd', '<cmd>DiffviewOpen<cr>', desc = 'Diffview Open' },
  },
}
