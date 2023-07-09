require('utils')

local get_build = function()
  if (GetOS() == 'Windows') then
    return
    'cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release && cmake --build build --config Release && cmake --install build --prefix build'
  else
    return 'make'
  end
end

local ex_to_current_file = function()
  local cur_file = vim.fn.expand('%:t')
  vim.cmd.Ex()
  vim.fn.search('^' .. cur_file .. '$')
end

return {
  'nvim-telescope/telescope-ui-select.nvim',
  'nvim-telescope/telescope-file-browser.nvim',
  { 'nvim-telescope/telescope-fzf-native.nvim', build = get_build() },

  {
    'nvim-telescope/telescope.nvim',
    version = '*',
    dependencies = { 'nvim-lua/plenary.nvim', 'nvim-tree/nvim-web-devicons' },
    config = function()
      require "telescope".setup {
        extensions = {
          ["ui-select"] = {
            require("telescope.themes").get_dropdown {}
          },
          file_browser = {
            theme = "ivy",
            -- hijack_netrw = true,
            mappings = {
              ["i"] = {
                -- your custom insert mode mappings
              },
              ["n"] = {
                -- your custom normal mode mappings
              },
            }
          }
        }
      }

      local builtin = require('telescope.builtin')

      vim.keymap.set('n', '<leader>pv', ex_to_current_file)
      vim.keymap.set('n', '<leader>pf', builtin.find_files, { desc = 'Project Files' })
      vim.keymap.set('n', '<C-p>', builtin.git_files, { desc = 'Search Git files' })
      vim.keymap.set('n', '<leader>pw', function()
        builtin.grep_string({ search = vim.fn.input('Grep > ') })
      end, { desc = 'Find word' })

      vim.keymap.set('n', '<leader>ph', builtin.help_tags, { desc = 'Search Help' })
      vim.keymap.set('n', '<leader>pg', builtin.live_grep, { desc = 'Search by Grep' })
      vim.keymap.set('n', '<leader>pd', builtin.diagnostics, { desc = 'Search Diagnostics' })
      vim.keymap.set('n', '<leader>?', builtin.oldfiles, { desc = '[?] Find recently opened files' })
      vim.keymap.set('n', '<leader>pr', require('telescope.builtin').resume, { desc = '[S]earch [R]esume' })

      vim.keymap.set('n', '<leader><space>', function()
        builtin.buffers {
          only_cwd = true,
          sort_lastused = true,
        }
      end, { desc = '[ ] Find existing buffers' })

      vim.keymap.set('n', '<leader>/', function()
        builtin.current_buffer_fuzzy_find(require('telescope.themes').get_dropdown {
          winblend = 10,
          previewer = builtin.file_browser,
        })
      end, { desc = '[/] Fuzzily search in current buffer' })

      vim.keymap.set("n", "<leader>pb", require "telescope".extensions.file_browser.file_browser,
        { desc = 'Telescope browser', noremap = true })

      require('telescope').load_extension('fzf')
      require('telescope').load_extension('file_browser')
      require('telescope').load_extension('ui-select')
    end
  },
}
