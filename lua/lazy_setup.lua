vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

local lazypath = vim.fn.stdpath 'data' .. '/lazy/lazy.nvim'
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system {
    'git',
    'clone',
    '--filter=blob:none',
    'https://github.com/folke/lazy.nvim.git',
    '--branch=stable',
    lazypath,
  }
end
vim.opt.rtp:prepend(lazypath)


require('lazy').setup({
  spec = {
    { import = 'plugins' }
  }
})

require('neodev').setup()
pcall(require('telescope').load_extension, 'fzf')

require('after.plugin.gitsigns')
require('after.plugin.telescope')
require('after.plugin.treesitter')
require('after.plugin.harpoon')
require('after.plugin.lsp')
