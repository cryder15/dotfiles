return {
  'ruifm/gitlinker.nvim',
  dependencies = {
    { 'nvim-lua/plenary.nvim' },
  },
  config = function()
    require('gitlinker').setup {
      -- Set your custom keybind here
      mappings = '<leader>yg',
    }
  end,
}

