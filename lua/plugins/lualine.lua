local function lsp_status()
  local bufnr = vim.api.nvim_get_current_buf()
  local clients = vim.lsp.get_active_clients { bufnr = bufnr }
  if next(clients) == nil then
    return ''
  end

  local lsp_names = {}
  for _, client in pairs(clients) do
    table.insert(lsp_names, client.name)
  end

  return table.concat(lsp_names, ', ')
end

return {
  'nvim-lualine/lualine.nvim',
  lazy = false,
  opts = {
    options = {
      icons_enabled = false,
      theme = 'auto',
      component_separators = { left = '', right = '' },
      globalstatus = true,
    },
    sections = {
      lualine_a = {},
      lualine_b = {},
      lualine_c = {
        'branch',
        'diff',
        'diagnostics',
        { 'filename', path = 1 },
      },

      lualine_x = {
        { lsp_status, icons_enabled = true, icon = ' LSP:' },
        -- 'encoding',
        -- 'fileformat',
        -- 'filetype',
      },
    }
  },
}
