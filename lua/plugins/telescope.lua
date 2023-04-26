require('utils')

local build = GetOS() == 'Windows'
    and
    'cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release && cmake --build build --config Release && cmake --install build --prefix build'
    or 'make'

return {
  {
    'nvim-telescope/telescope.nvim',
    version = '*',
    dependencies = { 'nvim-lua/plenary.nvim', 'nvim-tree/nvim-web-devicons' },
    config = function()
      local builtin = require('telescope.builtin')

      vim.keymap.set('n', '<leader>pv', vim.cmd.Ex)
      vim.keymap.set('n', '<leader>pf', builtin.find_files, { desc = 'Project Files' })
      vim.keymap.set('n', '<C-p>', builtin.git_files, { desc = 'Search Git files' })
      vim.keymap.set('n', '<leader>pw', function()
        builtin.grep_string({ search = vim.fn.input('Grep > ') })
      end, { desc = 'Find word' })

      vim.keymap.set('n', '<leader>ph', builtin.help_tags, { desc = 'Search Help' })
      vim.keymap.set('n', '<leader>pg', builtin.live_grep, { desc = 'Search by Grep' })
      vim.keymap.set('n', '<leader>pd', builtin.diagnostics, { desc = 'Search Diagnostics' })

      vim.keymap.set('n', '<leader>?', builtin.oldfiles, { desc = '[?] Find recently opened files' })
      vim.keymap.set('n', '<leader><space>', builtin.buffers, { desc = '[ ] Find existing buffers' })
      vim.keymap.set('n', '<leader>/', function()
        builtin.current_buffer_fuzzy_find(require('telescope.themes').get_dropdown {
          winblend = 10,
          previewer = false,
        })
      end, { desc = '[/] Fuzzily search in current buffer' })


      require('telescope').load_extension('fzf')
    end
  },

  {
    'nvim-telescope/telescope-fzf-native.nvim',
    build = build,
    cond = function()
      return vim.fn.executable 'make' == 1
    end,
  },
}
