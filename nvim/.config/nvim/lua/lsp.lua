require 'mason'.setup()
require 'mason-lspconfig'.setup()


require 'lspconfig'.lua_ls.setup({
  settings = {
    Lua = {
      runtime = {
        version = 'LuaJIT',
      },
      diagnostics = {
        globals = {
          'vim',
        },
      },
      workspace = {
        library = vim.api.nvim_get_runtime_file("", true),
      },
    },
  },
})

require 'lspconfig'.rust_analyzer.setup({})
require 'lspconfig'.custom_elements_ls.setup({})
require 'lspconfig'.zls.setup({})

vim.keymap.set('n', 'go', vim.diagnostic.open_float)
vim.keymap.set('n', 'gk', vim.diagnostic.goto_prev)
vim.keymap.set('n', 'gj', vim.diagnostic.goto_next)
vim.keymap.set('n', 'gq', vim.diagnostic.setloclist)

-- Use LspAttach autocommand to only map the following keys
-- after the language server attaches to the current buffer
vim.api.nvim_create_autocmd('LspAttach', {
  group = vim.api.nvim_create_augroup('UserLspConfig', {}),
  callback = function(ev)
    -- Buffer local mappings.
    -- See `:help vim.lsp.*` for documentation on any of the below functions
    local opts = { buffer = ev.buf }
    vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, opts)
    vim.keymap.set('n', 'gd', vim.lsp.buf.definition, opts)
    vim.keymap.set('n', 'K', vim.lsp.buf.hover, opts)
    vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, opts)
    vim.keymap.set('n', '<C-k>', vim.lsp.buf.signature_help, opts)
    vim.keymap.set('n', '<leader>gnw', vim.lsp.buf.add_workspace_folder, opts)
    vim.keymap.set('n', '<leader>gwr', vim.lsp.buf.remove_workspace_folder, opts)
    vim.keymap.set('n', '<leader>gwl', function()
      print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
    end, opts)
    vim.keymap.set('n', '<leader>D', vim.lsp.buf.type_definition, opts)
    -- vim.keymap.set('n', 'gr', vim.lsp.buf.rename, opts)
    vim.keymap.set({ 'n', 'v' }, 'do', vim.lsp.buf.code_action, opts)
    vim.keymap.set('n', 'gh', vim.lsp.buf.references, opts)
    vim.keymap.set('n', '<leader>f', function()
      vim.lsp.buf.format { async = true }
    end, opts)
  end,
})

vim.api.nvim_create_autocmd('BufWritePre', {
  group = vim.api.nvim_create_augroup("UserLspConfig", {
    clear = false
  }),
  callback = function()
    vim.lsp.buf.format { async = false }
  end
})



require('coq_3p') {
  { src = "figlet", short_name = "BIG", trigger = "!big" },
}
