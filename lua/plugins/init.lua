return {
  'tpope/vim-fugitive',
  'tpope/vim-sleuth',
  'sindrets/diffview.nvim',

  'theprimeagen/vim-be-good',
  'mbbill/undotree',
  'leafOfTree/vim-matchtag',

  'Eandrju/cellular-automaton.nvim',

  { 'numToStr/Comment.nvim',    opts = {} },
  { 'folke/todo-comments.nvim', opts = {} },
  { 'folke/trouble.nvim',       opts = { height = 15, } },

  {
    'iamcco/markdown-preview.nvim',
    cmd = { 'MarkdownPreviewToggle', 'MarkdownPreview', 'MarkdownPreviewStop' },
    build = 'cd app && yarn install',
    init = function()
      vim.g.mkdp_filetypes = { 'markdown' }
    end,
    ft = { 'markdown' },
  },

  {
    'OlegGulevskyy/better-ts-errors.nvim',
    dependencies = { 'MunifTanjim/nui.nvim' },
    config = {
      keymaps = {
        toggle = '<leader>ts',
        go_to_definition = '<leader>td'
      }
    },
  },

  {
    'dmmulroy/tsc.nvim',
    config = function()
      require 'tsc'.setup {
        bin_path = 'node_modules/.bin/tsc'
      }
    end
  },

  {
    'folke/which-key.nvim',
    config = function()
      vim.o.timeout = true
      vim.o.timeoutlen = 300
      require 'which-key'.setup {
        window = { position = 'top' }
      }
    end,
  },

  {
    'laytan/tailwind-sorter.nvim',
    dependencies = { 'nvim-treesitter/nvim-treesitter', 'nvim-lua/plenary.nvim' },
    build = 'cd formatter && npm i && npm run build',
    opts = {
      on_save_enabled = true,
      on_save_pattern = { '*.html', '*.js', '*.jsx', '*.ts', '*.tsx', '*.vue' },
    },
  },
}
