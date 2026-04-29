return {
  'SuperBo/fugit2.nvim',
  dependencies = {
    'MunifTanjim/nui.nvim',
    'nvim-tree/nvim-web-devicons',
    'nvim-lua/plenary.nvim',
    'sindrets/diffview.nvim',
  },
  cmd = { 'Fugit2', 'Fugit2Diff', 'Fugit2Graph', 'Fugit2Rebase' },
  opts = {
    -- Add safety configuration to prevent nil access errors
    width = 100,
    height = 60,
    blame = {
      enabled = true,
    },
    git = {
      -- Ensure git operations are handled safely
      timeout = 30000,
    },
  },
  keys = {
    { '<leader>ng', function()
        local ok, err = pcall(vim.cmd, 'Fugit2')
        if not ok then
          vim.notify('Fugit2 error: ' .. tostring(err), vim.log.levels.ERROR)
        end
      end, desc = 'Fugit2 (safe)' },
    { '<leader>nd', '<cmd>DiffviewOpen<cr>', desc = 'Diffview Open' },
    { '<leader>nG', function()
        local ok, err = pcall(vim.cmd, 'Fugit2Graph')
        if not ok then
          vim.notify('Fugit2Graph error: ' .. tostring(err), vim.log.levels.ERROR)
        end
      end, desc = 'Fugit2 Graph (safe)' },
  },
}
