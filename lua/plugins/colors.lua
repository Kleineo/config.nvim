return {
  -- {
  --   'rose-pine/neovim',
  --   name = 'rose-pine',
  --   priority = 1000,
  --   config = function()
  --     require('rose-pine').setup({
  --       variant = 'moon'
  --     })
  --     vim.cmd.colorscheme('rose-pine')
  --   end
  -- },
  {
      'navarasu/onedark.nvim',
      priority = 1000,
      config = function()
        vim.cmd.colorscheme 'onedark'
      end,
    },
}
