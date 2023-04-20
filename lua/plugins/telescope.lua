require('getOS')

local build = getOS() == 'Windows'
  and 'cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release && cmake --build build --config Release && cmake --install build --prefix build'
  or 'make'

return {
  { 'nvim-telescope/telescope.nvim',  version = '*', dependencies = { 'nvim-lua/plenary.nvim' } },

  {
    'nvim-telescope/telescope-fzf-native.nvim',
    build = build,
    cond = function()
      return vim.fn.executable 'make' == 1
    end,
  },
}
