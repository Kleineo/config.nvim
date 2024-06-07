vim.keymap.set('n', '<leader>u', vim.cmd.UndotreeToggle)
vim.keymap.set('n', '<leader>gs', function()
  vim.cmd.Git()
  vim.cmd 'wincmd H'
end)

vim.keymap.set('n', 'Q', '<nop>')
vim.keymap.set('n', '<Enter>', '<nop>')
vim.keymap.set({ 'n', 'v' }, '<Space>', '<Nop>', { silent = true })

vim.keymap.set('n', '<leader>{', 'va{Vy')
vim.keymap.set('n', '<leader>(', 'va(Vy')

vim.keymap.set('v', 'J', ":m '>+1<CR>gv=gv")
vim.keymap.set('v', 'K', ":m '<-2<CR>gv=gv")

vim.keymap.set('v', 'y', 'ygv<Esc>')
vim.keymap.set('n', 'Y', 'yg$')
vim.keymap.set('n', 'J', 'mzJ`z')
vim.keymap.set('n', '<C-d>', '<C-d>zz')
vim.keymap.set('n', '<C-u>', '<C-u>zz')
vim.keymap.set('n', 'n', 'nzzzv')
vim.keymap.set('n', 'N', 'Nzzzv')

vim.keymap.set('v', '<', '<gv', { noremap = true, silent = false })
vim.keymap.set('v', '>', '>gv', { noremap = true, silent = false })

-- yanking, deleting
vim.keymap.set('x', '<leader>p', '"_dP')
vim.keymap.set('n', '<leader>Y', '"+Y')
vim.keymap.set('n', '<leader>y', '"+y')
vim.keymap.set('v', '<leader>y', '"+y')
vim.keymap.set('n', '<leader>d', '"_d')
vim.keymap.set('v', '<leader>d', '"_d')
vim.keymap.set('v', '<leader>c', '"_c')

-- tabs
vim.keymap.set('n', 'Tn', '<cmd>tabnext<cr>')
vim.keymap.set('n', 'Tp', '<cmd>tabprevious<cr>')

-- todo
-- vim.keymap.set('n', '<C-k>', '<cmd>cnext<CR>zz')
-- vim.keymap.set('n', '<C-j>', '<cmd>cprev<CR>zz')
-- vim.keymap.set('n', '<leader>k', '<cmd>lnext<CR>zz')
-- vim.keymap.set('n', '<leader>j', '<cmd>lprev<CR>zz')

-- vim.keymap.set('n', '<C-h>', ':wincmd h<CR>')
-- vim.keymap.set('n', '<C-j>', ':wincmd j<CR>')
-- vim.keymap.set('n', '<C-k>', ':wincmd k<CR>')
-- vim.keymap.set('n', '<C-l>', ':wincmd l<CR>')

vim.keymap.set('n', '<A-H>', require('smart-splits').resize_left)
vim.keymap.set('n', '<A-J>', require('smart-splits').resize_down)
vim.keymap.set('n', '<A-K>', require('smart-splits').resize_up)
vim.keymap.set('n', '<A-L>', require('smart-splits').resize_right)
-- moving between splits
vim.keymap.set('n', '<A-h>', require('smart-splits').move_cursor_left) -- alt + h
vim.keymap.set('n', '<A-j>', require('smart-splits').move_cursor_down) -- alt + j
vim.keymap.set('n', '<A-k>', require('smart-splits').move_cursor_up) -- alt + k
vim.keymap.set('n', '<A-l>', require('smart-splits').move_cursor_right) -- alt + l
vim.keymap.set('n', '<A-/>', require('smart-splits').move_cursor_previous) -- alt + /
-- swapping buffers between windows
vim.keymap.set('n', '<leader><leader>h', require('smart-splits').swap_buf_left)
vim.keymap.set('n', '<leader><leader>j', require('smart-splits').swap_buf_down)
vim.keymap.set('n', '<leader><leader>k', require('smart-splits').swap_buf_up)
vim.keymap.set('n', '<leader><leader>l', require('smart-splits').swap_buf_right)


-- tmux
vim.keymap.set('n', '<C-f>', '<cmd>silent !tmux neww tmux-sessionizer<CR>')


vim.keymap.set('n', '<leader>fs', ':%s/\\<<C-r><C-w>\\>/<C-r><C-w>/gI<Left><Left><Left>')
vim.keymap.set('n', '<leader>ls', ':s/\\<<C-r><C-w>\\>/<C-r><C-w>/gI<Left><Left><Left>')
vim.keymap.set('n', '<leader>x', '<cmd>!rhmod +x %<CR>', { silent = true })


-- Remap for dealing with word wrap
vim.keymap.set('n', 'k', "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true })
vim.keymap.set('n', 'j', "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true })


-- todo
vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, { desc = 'Go to previous diagnostic message' })
vim.keymap.set('n', ']d', vim.diagnostic.goto_next, { desc = 'Go to next diagnostic message' })
vim.keymap.set('n', '<leader>e', vim.diagnostic.open_float, { desc = 'Open floating diagnostic message' })
vim.keymap.set('n', '<leader>q', vim.diagnostic.setloclist, { desc = 'Open diagnostics list' })


-- todo
vim.keymap.set('n', '<leader>xx', '<cmd>TroubleToggle<cr>', { silent = true, noremap = true })
vim.keymap.set('n', '<leader>xw', '<cmd>TroubleToggle workspace_diagnostics<cr>', { silent = true, noremap = true })
vim.keymap.set('n', '<leader>xd', '<cmd>TroubleToggle document_diagnostics<cr>', { silent = true, noremap = true })
vim.keymap.set('n', '<leader>xl', '<cmd>TroubleToggle loclist<cr>', { silent = true, noremap = true })
vim.keymap.set('n', '<leader>xq', '<cmd>TroubleToggle quickfix<cr>', { silent = true, noremap = true })
vim.keymap.set('n', 'gR', '<cmd>TroubleToggle lsp_references<cr>', { silent = true, noremap = true })


-- go remaps
vim.keymap.set('n', '<leader>er', 'oif err != nil {<Enter>}<Esc>O')
vim.keymap.set('n', '<leader>ej', '_yiw~$a `json:"<Esc>pa"`<Esc>V=')
