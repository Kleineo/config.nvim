return {
  'mrshmllow/document-color.nvim',
  { 'norcalli/nvim-colorizer.lua', config = function() require 'colorizer'.setup() end },

  {
    -- 'folke/tokyonight.nvim',
    -- 'rose-pine/neovim',
    -- 'mofiqul/dracula',
    -- 'sainnhe/sonokai',
    'rebelot/kanagawa.nvim',
    name = 'kanagawa',
    priority = 1000,
    config = function()
      vim.cmd.colorscheme('kanagawa')
    end
  },
}
