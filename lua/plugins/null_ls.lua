return {
  'jose-elias-alvarez/null-ls.nvim',
  config = function()
    local null_ls = require 'null-ls'

    null_ls.setup {
      sources = {
        null_ls.builtins.diagnostics.eslint_d, -- try running `eslint_d restart` if broken
        null_ls.builtins.diagnostics.sqlfluff.with({
          extra_args = { "--dialect", "postgres" },
        }),

        -- null_ls.builtins.formatting.prettierd, -- waiting for v3 support: https://github.com/fsouza/prettierd/issues/565
        null_ls.builtins.formatting.prettier,
        null_ls.builtins.formatting.phpcsfixer,
        null_ls.builtins.formatting.sqlfluff.with({
          extra_args = { "--dialect", "postgres" },
        }),
      }
    }
  end,
}
