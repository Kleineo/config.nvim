require('lazy_setup')
require('remaps')
require('set')

-- See `:help vim.highlight.on_yank()`
local highlight_group = vim.api.nvim_create_augroup('YankHighlight', { clear = true })
vim.api.nvim_create_autocmd('TextYankPost', {
  callback = function()
    vim.highlight.on_yank()
  end,
  group = highlight_group,
  pattern = '*',
})

vim.cmd('highlight SignColumn ctermbg=none guibg=none')
vim.cmd('highlight LineNr ctermbg=none guibg=none')
vim.cmd('highlight CursorLineNr ctermbg=none guibg=none')
vim.cmd('highlight GitSignsAdd ctermbg=none guibg=none')

vim.api.nvim_set_hl(0, 'Normal', { bg = 'none' })
vim.api.nvim_set_hl(0, 'NormalFloat', { bg = 'none' })

-- The line beneath this is called `modeline`. See `:help modeline`
-- vim: ts=2 sts=2 sw=2 et
