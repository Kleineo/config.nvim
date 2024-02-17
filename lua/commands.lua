vim.api.nvim_create_user_command('CopyPath', function()
  local path = vim.fn.expand '%'
  vim.fn.setreg('+', path)
  vim.notify('Copied "' .. path .. '" to the clipboard!')
end, {})

vim.api.nvim_create_user_command('CopyPathFull', function()
  local path = vim.fn.expand '%:p'
  vim.fn.setreg('+', path)
  vim.notify('Copied "' .. path .. '" to the clipboard!')
end, {})

vim.api.nvim_create_user_command('CopyFileName', function()
  local file = vim.fn.expand '%:t'
  vim.fn.setreg('+', file)
  vim.notify('Copied "' .. file .. '" to the clipboard!')
end, {})

vim.api.nvim_create_user_command('WordWrapToggle', function()
  local wrapped = vim.api.nvim_get_option_value('wrap', {})
  vim.opt.wrap = not wrapped
end, {})

vim.api.nvim_create_user_command('W', 'write', {})

vim.keymap.set('n', '<leader>^', '<cmd>CreateFileInCurrentDir<cr>')

vim.api.nvim_create_user_command('CreateFileInCurrentDir', function()
  local name = vim.fn.input 'New File Name > '
  local dir = vim.fn.expand '%:p:h'
  local file = dir .. '/' .. name

  if name == '' then
    return
  end

  vim.cmd 'redraw'
  vim.cmd('edit ' .. file)
  vim.notify('Created New File: ' .. file)
end, {})
