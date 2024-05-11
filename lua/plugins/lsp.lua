return {
  'neovim/nvim-lspconfig',
  dependencies = {
    'folke/neodev.nvim',
    'williamboman/mason-lspconfig.nvim',
    'williamboman/mason.nvim',
    { 'j-hui/fidget.nvim', opts = {} },
  },
  config = function()
    local on_attach = function(client, bufnr)
      local nmap = function(keys, func, desc)
        if desc then
          desc = 'LSP: ' .. desc
        end

        vim.keymap.set('n', keys, func, { buffer = bufnr, desc = desc })
      end

      local telescope = require 'telescope.builtin'

      nmap('<leader>rn', vim.lsp.buf.rename, '[R]e[n]ame')
      nmap('<leader>ca', vim.lsp.buf.code_action, '[C]ode [A]ction')

      nmap('gd', telescope.lsp_definitions, '[G]oto [D]efinition')
      nmap('gr', telescope.lsp_references, '[G]oto [R]eferences')
      nmap('gI', telescope.lsp_implementations, '[G]oto [I]mplementation')
      nmap('<leader>D', telescope.lsp_type_definitions, 'Type [D]efinition')
      nmap('<leader>ds', telescope.lsp_document_symbols, '[D]ocument [S]ymbols')
      nmap('<leader>ws', telescope.lsp_dynamic_workspace_symbols, '[W]orkspace [S]ymbols')
      nmap('K', vim.lsp.buf.hover, 'Hover Documentation')
      nmap('<C-k>', vim.lsp.buf.signature_help, 'Signature Documentation')
      nmap('gD', vim.lsp.buf.declaration, '[G]oto [D]eclaration')

      nmap('<leader>f', function()
        vim.lsp.buf.format {
          timeout_ms = 2000,
          filter = function(cl)
            return cl.name ~= 'volar' and cl.name ~= 'tsserver'
          end,
        }
      end)


      vim.keymap.set({ 'n', 'i' }, '<c-k>', vim.lsp.buf.signature_help, { desc = 'Signature Documentation' })

      if client.server_capabilities.colorProvider then
        require 'document-color'.buf_attach(bufnr)
      end
    end

    require 'neodev'.setup()
    require 'mason'.setup()
    require 'mason-lspconfig'.setup()
    local lsp = require 'lspconfig'
    local mason_lspconfig = require 'mason-lspconfig'

    local capabilities = vim.lsp.protocol.make_client_capabilities()
    capabilities = require 'cmp_nvim_lsp'.default_capabilities(capabilities)

    local servers = {
      'cssls',
      'gopls',
      'lua_ls',
      'intelephense',
      'rust_analyzer',
      'tailwindcss',
      'emmet_language_server',
    }

    mason_lspconfig.setup {
      ensure_installed = servers,
    }

    -- for client in pairs(servers) do
    --   lsp[client].setup {
    --     on_attach = on_attach,
    --     capabilities = capabilities,
    --     settings = servers[client],
    --   }
    -- end

    mason_lspconfig.setup_handlers {
      function(server_name)
        lsp[server_name].setup {
          capabilities = capabilities,
          on_attach = on_attach,
          settings = servers[server_name],
          -- filetypes = (servers[server_name] or {}).filetypes,
        }
      end,

      ['emmet_language_server'] = function()
        lsp.emmet_language_server.setup {
          filetypes = { 'html', 'javascript', 'javascriptreact', 'css', 'less', 'sass', 'scss', 'typescriptreact', 'vue' },
          init_options = {
            includeLanguages = {
              javascriptreact = 'html',
              typescriptreact = 'html',
            },
          },
        }
      end,

      ['volar'] = function()
        lsp.volar.setup {
          filetypes = { 'typescript', 'javascript', 'javascriptreact', 'typescriptreact', 'vue', 'json' },
          capabilities = capabilities,
          on_attach = function(_, bufnr)
            -- stop tsserver if enabled
            for _, server in ipairs(vim.lsp.get_active_clients { name = 'tsserver' }) do
              vim.lsp.get_client_by_id(server.id).stop()
            end
            on_attach(_, bufnr)
          end,
        }
      end,

      ['tsserver'] = function()
        lsp.tsserver.setup {
          capabilities = capabilities,
          on_attach = function(client, bufnr)
            local volarEnabled = #vim.lsp.get_active_clients { name = 'volar' } > 0

            if volarEnabled then -- stop tsserver
              vim.lsp.get_client_by_id(client.id).stop()
              return
            end
            on_attach(_, bufnr)
          end,
        }
      end,
    }
  end,
}
