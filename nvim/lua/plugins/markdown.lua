return {
  {
    'MeanderingProgrammer/render-markdown.nvim',
    dependencies = { 'nvim-treesitter/nvim-treesitter', 'nvim-tree/nvim-web-devicons' },
    ft = { 'markdown', 'mermaid' },
    opts = {
      -- This handles the visual "polish" in the terminal
      heading = {
        sign = false,
        icons = { '󰲡 ', '󰲣 ', '󰲥 ', '󰲧 ', '󰲩 ', '󰲫 ' },
        backgrounds = {
          'RenderMarkdownH1Bg',
          'RenderMarkdownH2Bg',
        },
      },
      code = {
        sign = false,
        width = 'block',
        right_pad = 4,
      },
      checkbox = {
        enabled = true,
        unchecked = { icon = '󰄱 ' },
        checked = { icon = '󰄲 ' },
      },
    },
  },
}
