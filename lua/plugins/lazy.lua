return {
  'tpope/vim-fugitive',
  'tpope/vim-sleuth',
  'lewis6991/gitsigns.nvim',
  'theprimeagen/vim-be-good',
  'mbbill/undotree',

  { 'numToStr/Comment.nvim', opts = {} },
  { "windwp/nvim-autopairs", config = function() require("nvim-autopairs").setup {} end },
  {
    'folke/which-key.nvim',
    config = function()
      vim.o.timeout = true
      vim.o.timeoutlen = 300
      require("which-key").setup({
        window = { position = 'top' } })
    end,
  },
}
