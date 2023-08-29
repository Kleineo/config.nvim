return {
  { 'norcalli/nvim-colorizer.lua', opts = {} },
  {
    'mrshmllow/document-color.nvim',
    opts = {
      mode = 'single'
    }
  },

  {
    'folke/tokyonight.nvim',
    priority = 1000,
    lazy = false,
    config = function()
      vim.cmd.colorscheme('tokyonight-night')
    end
  },
}
