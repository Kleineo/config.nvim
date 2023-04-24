vim.opt.guicursor = ''

vim.o.rnu = true
vim.o.nu = true

vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true

vim.o.smartindent = true
vim.o.autoindent = true

vim.opt.swapfile = false
vim.opt.backup = false
vim.opt.undodir = os.getenv('HOME') .. '/.vim/undodir'
vim.opt.undofile = true

vim.opt.hlsearch = false
vim.opt.incsearch = true

vim.opt.termguicolors = true

vim.opt.scrolloff = 8
vim.opt.signcolumn = 'yes'
vim.opt.isfname:append('@-@')

vim.o.updatetime = 50

-- vim.opt.colorcolumn = '80'

vim.o.mouse = 'a'

vim.o.ignorecase = true
vim.o.smartcase = true

vim.o.completeopt = 'menuone,noselect,preview'

