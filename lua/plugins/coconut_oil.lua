return {
  'stevearc/oil.nvim',
  dependencies = { 'nvim-tree/nvim-web-devicons' },
  opts = {
    columns = { 'icon' },
    skip_confirm_for_simple_edits = true,

    keymaps = {
      ['<C-s>'] = false,
      ['<C-e>'] = 'actions.select_split',
      ['<C-h>'] = false,
      ['<C-p>'] = false,
      ['<C-t>'] = 'actions.preview',
      ['.'] = 'actions.toggle_hidden',
    },

    float = {
      padding = 10,
      max_width = 150,
      win_options = {
        winblend = 0,
      },
    },
  },
}
