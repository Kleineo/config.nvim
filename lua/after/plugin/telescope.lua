pcall(require('telescope').load_extension, 'fzf')
require('telescope').setup({
  defaults = {
    mappings = {
      i = {
        ['<C-u>'] = false,
        ['<C-d>'] = false,
      },
    },
  }
})

-- return {
--   'nvim-telescope/telescope.nvim',
--   version = '*', dependencies = { 'nvim-lua/plenary.nvim' },
--   config = function ()
--     require('telescope').setup {
--       defaults = {
--         mappings = {
--           i = {
--             ['<C-u>'] = false,
--             ['<C-d>'] = false,
--           },
--         },
--       },
--     }
--   end
-- }
