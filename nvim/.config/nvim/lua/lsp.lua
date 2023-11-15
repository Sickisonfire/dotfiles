require 'mason'.setup()

local handlers = {
  -- default/catch all
  function(server_name)
    require("lspconfig")[server_name].setup {}
  end,
  ["eslint"] = function()
    require 'lspconfig'.eslint.setup({
      on_attach = function(_, bufnr)
        vim.api.nvim_create_autocmd("BufWritePre", {
          buffer = bufnr,
          command = "EslintFixAll",
        })
      end,
      filetypes = {
        "javascript",
        "javascriptreact",
        "typescript",
        "typescriptreact",
        "vue",
        "html",
        "markdown",
        "json",
        "jsonc",
        "yaml",
        "astro"
      },
      settings = {
        format = true,
        experimental = { useFlatConfig = true },
        rulesCustomizations = {
          { ["rule"] = "style/*",   ["severity"] = "off" },
          { ["rule"] = "*-indent",  ["severity"] = "off" },
          { ["rule"] = "*-spacing", ["severity"] = "off" },
          { ["rule"] = "*-spaces",  ["severity"] = "off" },
          { ["rule"] = "*-order",   ["severity"] = "off" },
          { ["rule"] = "*-dangle",  ["severity"] = "off" },
          { ["rule"] = "*-newline", ["severity"] = "off" },
          { ["rule"] = "*quotes",   ["severity"] = "off" },
          { ["rule"] = "*semi",     ["severity"] = "off" }
        },
      }
    })
  end,
  ["lua_ls"] = function()
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
  end
}


require 'mason-lspconfig'.setup({ handlers = handlers })

-- global keymaps
vim.keymap.set('n', 'go', vim.diagnostic.open_float)
vim.keymap.set('n', 'gk', vim.diagnostic.goto_prev)
vim.keymap.set('n', 'gj', vim.diagnostic.goto_next)
vim.keymap.set('n', 'gq', vim.diagnostic.setloclist)

-- buffer local keymaps
vim.api.nvim_create_autocmd('LspAttach', {
  group = vim.api.nvim_create_augroup('UserLspConfig', {}),
  callback = function(ev)
    local opts = { buffer = ev.buf }
    vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, opts)
    vim.keymap.set('n', 'gd', vim.lsp.buf.definition, opts)
    vim.keymap.set('n', 'K', vim.lsp.buf.hover, opts)
    vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, opts)
    vim.keymap.set('n', '<C-k>', vim.lsp.buf.signature_help, opts)
    -- vim.keymap.set('n', '<leader>gnw', vim.lsp.buf.add_workspace_folder, opts)
    -- vim.keymap.set('n', '<leader>gwr', vim.lsp.buf.remove_workspace_folder, opts)
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

-- fmt on save
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

print("lsp config reloaded")
