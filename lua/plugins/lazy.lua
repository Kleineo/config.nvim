return {
  'tpope/vim-fugitive',
  'tpope/vim-sleuth',
  'theprimeagen/vim-be-good',
  'mbbill/undotree',
  'windwp/nvim-ts-autotag',

  { 'numToStr/Comment.nvim',       opts = {} },
  { 'norcalli/nvim-colorizer.lua', config = function() require 'colorizer'.setup() end },
  { 'windwp/nvim-autopairs',       config = function() require('nvim-autopairs').setup {} end },
  { 'folke/todo-comments.nvim',    config = function() require('todo-comments').setup {} end },
  { 'folke/trouble.nvim',          config = function() require('trouble').setup {} end },
  { 'dmmulroy/tsc.nvim',           config = function() require('tsc').setup {} end },

  {
    'folke/which-key.nvim',
    config = function()
      vim.o.timeout = true
      vim.o.timeoutlen = 300
      require("which-key").setup({
        window = { position = 'top' } })
    end,
  },

  {
    'laytan/tailwind-sorter.nvim',
    dependencies = { 'nvim-treesitter/nvim-treesitter', 'nvim-lua/plenary.nvim' },
    build = 'cd formatter && npm i && npm run build',
    config = function()
      require('tailwind-sorter').setup {
        on_save_enabled = true,
        on_save_pattern = { '*.html', '*.js', '*.jsx', '*.ts', '*.tsx', '*.vue' },
      }
    end
  },
}
