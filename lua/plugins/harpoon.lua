return {
  'theprimeagen/harpoon',
  branch = 'harpoon2',
  config = function()
    local harpoon = require 'harpoon'

    harpoon:setup {
      settings = {
        sync_on_ui_close = true,
      },
    }

    local toggle_opts = {
      border = 'rounded',
      title_pos = 'center',
      ui_width_ratio = 0.4,
    }

    vim.keymap.set('n', '<leader>a', function() harpoon:list():append() end)
    vim.keymap.set('n', '<C-n>', function() harpoon.ui:toggle_quick_menu(harpoon:list(), toggle_opts) end)

    vim.keymap.set('n', '<C-m>', function() harpoon:list():select(1) end)
    vim.keymap.set('n', '<C-,>', function() harpoon:list():select(2) end)
    vim.keymap.set('n', '<C-.>', function() harpoon:list():select(3) end)
    vim.keymap.set('n', '<C-/>', function() harpoon:list():select(4) end)
    vim.keymap.set('n', '<C-;>', function() harpoon:list():select(5) end)
  end
}
