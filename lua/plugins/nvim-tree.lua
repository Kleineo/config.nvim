return {
  'nvim-tree/nvim-tree.lua',
  config = function()
    require('nvim-tree').setup {}

    vim.keymap.set('n', '<leader>b', require('nvim-tree.api').tree.toggle)
  end
}
