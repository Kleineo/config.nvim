return {
  { 'norcalli/nvim-colorizer.lua',   opts = {} },
  { 'mrshmllow/document-color.nvim', opts = { mode = 'single' } }, -- for tailwind classes

  {
    'sainnhe/everforest',
    lazy = false,
    -- "catppuccin/nvim",
    name = 'everforest',
    priority = 1000,
    config = function()
      vim.g.everforest_background = 'hard'
      vim.g.everforest_better_performance = 1
      vim.g.everforest_enable_italic = 1
      vim.cmd.colorscheme 'everforest'
    end
  },
}
