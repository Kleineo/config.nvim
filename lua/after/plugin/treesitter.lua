require('nvim-treesitter.configs').setup {
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

  highlight = {
    enable = true,
    additional_vim_regex_highlighting = false,
  },
  indent = { enable = true, disable = { 'python' } },
  incremental_selection = {
    enable = true,
    keymaps = {
      init_selection = '<S-space>',
      node_incremental = '<S-space>',
      scope_incremental = '<S-s>',
      node_decremental = '<S-Z>',
    },
  },
  -- textobjects = {
  --   select = {
  --     enable = true,
  --     lookahead = true,
  --     keymaps = {
  --       -- You can use the capture groups defined in textobjects.scm
  --       ['aa'] = '@parameter.outer',
  --       ['ia'] = '@parameter.inner',
  --       ['af'] = '@function.outer',
  --       ['if'] = '@function.inner',
  --       ['ac'] = '@class.outer',
  --       ['ic'] = '@class.inner',
  --     },
  --   },
  --   move = {
  --     enable = true,
  --     set_jumps = true, -- whether to set jumps in the jumplist
  --     goto_next_start = {
  --       [']m'] = '@function.outer',
  --       [']]'] = '@class.outer',
  --     },
  --     goto_next_end = {
  --       [']M'] = '@function.outer',
  --       [']['] = '@class.outer',
  --     },
  --     goto_previous_start = {
  --       ['[m'] = '@function.outer',
  --       ['[['] = '@class.outer',
  --     },
  --     goto_previous_end = {
  --       ['[M'] = '@function.outer',
  --       ['[]'] = '@class.outer',
  --     },
  --   },
  --   swap = {
  --     enable = true,
  --     swap_next = {
  --       ['<leader>a'] = '@parameter.inner',
  --     },
  --     swap_previous = {
  --       ['<leader>A'] = '@parameter.inner',
  --     },
  --   },
  -- },
}

