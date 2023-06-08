return {
  { 'norcalli/nvim-colorizer.lua', config = function() require 'colorizer'.setup() end },
  {
    'mrshmllow/document-color.nvim',
    config = function()
      require("document-color").setup {
        mode = 'foreground'
      }
    end
  },
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
