return {
  'neovim/nvim-lspconfig',
  dependencies = {
    'folke/neodev.nvim',
    { 'williamboman/mason.nvim', config = true },
    { 'j-hui/fidget.nvim',       opts = {} },
  },
  config = function()
    local on_attach = function(client, bufnr)
      local nmap = function(keys, func, desc)
        if desc then
          desc = 'LSP: ' .. desc
        end

        vim.keymap.set('n', keys, func, { buffer = bufnr, desc = desc })
      end

      nmap('<leader>rn', vim.lsp.buf.rename, '[R]e[n]ame')
      nmap('<leader>ca', vim.lsp.buf.code_action, '[C]ode [A]ction')

      nmap('gd', vim.lsp.buf.definition, '[G]oto [D]efinition')
      nmap('gr', require('telescope.builtin').lsp_references, '[G]oto [R]eferences')
      nmap('gI', vim.lsp.buf.implementation, '[G]oto [I]mplementation')
      nmap('<leader>D', vim.lsp.buf.type_definition, 'Type [D]efinition')
      nmap('<leader>ds', require('telescope.builtin').lsp_document_symbols, '[D]ocument [S]ymbols')
      nmap('<leader>ws', require('telescope.builtin').lsp_dynamic_workspace_symbols, '[W]orkspace [S]ymbols')
      nmap('K', vim.lsp.buf.hover, 'Hover Documentation')
      nmap('<C-k>', vim.lsp.buf.signature_help, 'Signature Documentation')
      nmap('gD', vim.lsp.buf.declaration, '[G]oto [D]eclaration')
      nmap('<leader>wa', vim.lsp.buf.add_workspace_folder, '[W]orkspace [A]dd Folder')
      nmap('<leader>wr', vim.lsp.buf.remove_workspace_folder, '[W]orkspace [R]emove Folder')
      nmap('<leader>wl', function()
        print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
      end, '[W]orkspace [L]ist Folders')

      vim.keymap.set({ 'n', 'i' }, '<c-k>', vim.lsp.buf.signature_help, { desc = 'Signature Documentation' })

      if client.server_capabilities.colorProvider then
        require("document-color").buf_attach(bufnr)
      end
    end

    require('neodev').setup()

    local capabilities = vim.lsp.protocol.make_client_capabilities()
    capabilities = require('cmp_nvim_lsp').default_capabilities(capabilities)

    local lsp = require 'lspconfig'

    local servers = {
      gopls = {},
      lua_ls = {
        Lua = {
          workspace = { checkThirdParty = false },
          telemetry = { enable = false },
        },
      },
      phpactor = {},
      rust_analyzer = {},
      tailwindcss = {},
    }

    for client in pairs(servers) do
      lsp[client].setup {
        on_attach = on_attach,
        capabilities = capabilities,
        settings = servers[client],
      }
    end

    lsp.volar.setup {
      filetypes = { 'typescript', 'javascript', 'javascriptreact', 'typescriptreact', 'vue', 'json' },
      capabilities = capabilities,
      on_attach = function(_, bufnr)
        for _, server in ipairs(vim.lsp.get_active_clients({ name = 'tsserver' })) do
          vim.lsp.get_client_by_id(server.id).stop()
        end
        on_attach(_, bufnr)
      end,
    }

    lsp.tsserver.setup {
      capabilities = capabilities,
      on_attach = function(client, bufnr)
        local volarEnabled = #vim.lsp.get_active_clients({ name = 'volar' }) > 0

        if volarEnabled then -- stop tsserver
          vim.lsp.get_client_by_id(client.id).stop()
          return
        end
        on_attach(_, bufnr)
      end,
    }
  end,
}
