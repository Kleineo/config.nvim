return {
  -- /git
  'tpope/vim-fugitive',
  'tpope/vim-sleuth',
  'lewis6991/gitsigns.nvim',

  {
    'nvim-treesitter/nvim-treesitter',
    dependencies = { 'nvim-treesitter/nvim-treesitter-textobjects' },
    build = ":TSUpdate",
  },

  'nvim-treesitter/playground',

  {
    'hrsh7th/nvim-cmp',
    dependencies = { 'hrsh7th/cmp-nvim-lsp', 'L3MON4D3/LuaSnip', 'saadparwaiz1/cmp_luasnip' },
  },


  -- /misc 
  {
    'folke/which-key.nvim',
    config = function()
      vim.o.timeout = true
      vim.o.timeoutlen = 300
      require("which-key").setup({
        window = { position = 'top' }
      })
    end,
  },

  {
    'nvim-lualine/lualine.nvim',
    opts = {
      options = {
        icons_enabled = false,
        theme = 'onedark',
        component_separators = '🐱',
        section_separators = '',
      },
      sections = {
        lualine_a = {
          {
            'filename',
            path = 1,
          }
        }
      }
    },
  },

  { 'numToStr/Comment.nvim', opts = {} },
  'theprimeagen/harpoon',
  'theprimeagen/vim-be-good',
  'mbbill/undotree',
}

