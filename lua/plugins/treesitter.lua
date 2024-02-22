return {
  'windwp/nvim-ts-autotag',

  {
    'nvim-treesitter/nvim-treesitter',
    dependencies = { 'nvim-treesitter/nvim-treesitter-textobjects' },
    build = ':TSUpdate',
    config = function()
      -- require 'nvim-treesitter.install'.compilers = { 'zig' }
      require 'nvim-treesitter.configs'.setup {
        ensure_installed = {
          'c', 'cpp',
          'css',
          'go',
          'html',
          'javascript',
          'lua',
          'rust',
          'tsx',
          'typescript',
          'vimdoc',
          'vim',
          'vue',
        },
        auto_install = true,
        sync_install = false,
        ignore_install = {},
        modules = {},

        autotag = { enable = true },
        highlight = {
          enable = true,
          additional_vim_regex_highlighting = false,
        },
        indent = {
          enable = true, disable = { 'python' }
        },
        incremental_selection = {
          enable = true,
          keymaps = {
            init_selection = '<C-space>',
            node_incremental = '<C-space>',
            node_decremental = '<C-Z>',
          },
        },
        swap = {
          enable = true,
          swap_next = {
            ['<leader>z'] = '@parameter.inner',
          },
          swap_previous = {
            ['<leader>Z'] = '@parameter.inner',
          },
        },
      }
    end
  },

  {
    'HiPhish/rainbow-delimiters.nvim',
    config = function()
      local rainbow_delimiters = require 'rainbow-delimiters'
      vim.g.rainbow_delimiters = {
        strategy = {
          [''] = rainbow_delimiters.strategy['global'],
          vim = rainbow_delimiters.strategy['local'],
        },
        query = {
          [''] = 'rainbow-delimiters',
          lua = 'rainbow-parens',
          jsx = 'rainbow-parens',
          tsx = 'rainbow-parens',
          vue = 'rainbow-parens',
          html = 'rainbow-parens',
        },
        priority = {
          [''] = 110,
          lua = 210,
        },

        highlight = {
          'RainbowDelimiterGreen',
          'RainbowDelimiterYellow',
          'RainbowDelimiterBlue',
          'RainbowDelimiterViolet',
          'RainbowDelimiterCyan',
        },
      }
    end
  },

  {
    'nvim-treesitter/nvim-treesitter-context',
    config = function()
      local ctx = require 'treesitter-context'
      ctx.setup {
        max_lines = 3,
        trim_scope = 'outer',
      }
      vim.keymap.set('n', '[c', ctx.go_to_context, { silent = true })
    end
  },

  'nvim-treesitter/playground',
}
