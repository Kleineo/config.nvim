require('gitsigns').setup({
  signs = {
    add = { text = '+' },
    change = { text = '~' },
    delete = { text = '_' },
    topdelete = { text = '‾' },
    changedelete = { text = '~' },
  },
  current_line_blame = false,
  current_line_blame_opts = {
    virt_text = true,
    delay = 300,
  },
  current_line_blame_formatter = '<author>, <author_time:%R> - <summary>',
})
