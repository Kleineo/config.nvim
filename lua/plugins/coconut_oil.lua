return {
  'stevearc/oil.nvim',
  dependencies = { 'nvim-tree/nvim-web-devicons' },
  config = function()
    require 'oil'.setup {
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
    }

    local oil = require 'oil'
    vim.keymap.set('n', '<leader>pv', '<cmd>Oil<cr>', { desc = '[OIL] current dir' })
    vim.keymap.set('n', '<leader>ob', oil.toggle_float, { desc = '[OIL] floating window' })
    vim.keymap.set('n', '<leader>on', function() oil.toggle_float '~/.config/nvim' end, { desc = '[OIL] nvim repo' })
    vim.keymap.set('n', '<leader>o~', function() oil.toggle_float '~' end, { desc = '[OIL] home dir' })
  end,
}
