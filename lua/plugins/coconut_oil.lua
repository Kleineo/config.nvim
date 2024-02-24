return {
  'stevearc/oil.nvim',
  dependencies = { 'nvim-tree/nvim-web-devicons' },
  opts = {
    columns = { 'icon' },
    skip_confirm_for_simple_edits = true,
    keymaps = {
      ['<C-s>'] = 'actions.select_split',
      ['<C-h>'] = 'actions.select_vsplit',
      ['<C-v>'] = 'actions.preview',
      ['<C-e>'] = 'actions.preview_scroll_up',
      ['<C-y>'] = 'actions.preview_scroll_down',
      ['<C-p>'] = false,
      ['.'] = 'actions.toggle_hidden',
      ['g.'] = false,
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
