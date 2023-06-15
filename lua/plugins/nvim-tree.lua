return {
  'nvim-tree/nvim-tree.lua',
  config = function()
    -- vim.g.loaded_netrw = 1
    -- vim.g.loaded_netrwPlugin = 1
    require('nvim-tree').setup {
      hijack_netrw = false,
      view = { width = 50 },
      renderer = {
        add_trailing = true,
        full_name = true,
      },
    }

    local tree = require('nvim-tree.api').tree

    vim.keymap.set('n', '<leader>n', function()
      tree.find_file { open = true, focus = true }
    end, { desc = 'Find file in NvimTree' })

    vim.keymap.set('n', '<leader>bt', tree.toggle)
    vim.keymap.set('n', '<leader>bc', tree.collapse_all)

    -- close all directories unrelated to current file
    vim.keymap.set('n', '<leader>ba', function() tree.collapse_all(true) end)
  end
}
