local lsp_installer = require 'nvim-lsp-installer'
local lspconfig = require 'lspconfig'
local coq = require 'coq'

-- Add additional capabilities supported by nvim-cmp
--local capabilities = vim.lsp.protocol.make_client_capabilities()
--capabilities = require('cmp_nvim_lsp').update_capabilities(capabilities)
require("lspsaga").setup()
require("lsp-format").setup {}

local on_attach = function(client)
  require('lsp-format').on_attach(client)

  local keymap = vim.keymap
  keymap.set("n", "gr", "<cmd>Lspsaga rename<cr>", { silent = true, noremap = true })
  keymap.set("n", "do", "<cmd>Lspsaga code_action<cr>", { silent = true, noremap = true })
  keymap.set("x", "do", ":<c-u>Lspsaga range_code_action<cr>", { silent = true, noremap = true })
  keymap.set("n", "K", "<cmd>Lspsaga hover_doc<cr>", { silent = true, noremap = true })
  keymap.set("n", "go", "<cmd>Lspsaga show_line_diagnostics<cr>", { silent = true, noremap = true })
  keymap.set("n", "gj", "<cmd>Lspsaga diagnostic_jump_next<cr>", { silent = true, noremap = true })
  keymap.set("n", "gk", "<cmd>Lspsaga diagnostic_jump_prev<cr>", { silent = true, noremap = true })
  keymap.set("n", "gd", "<cmd>Lspsaga goto_definition<cr>", { silent = true, noremap = true })
  keymap.set("n", "gh", "<cmd>Lspsaga lsp_finder<cr>", { silent = true, noremap = true })
  -- keymap.set("n", "<C-u>", "<cmd>lua require('lspsaga.action').smart_scroll_with_saga(-1, '<c-u>')<cr>", {})
  -- keymap.set("n", "<C-d>", "<cmd>lua require('lspsaga.action').smart_scroll_with_saga(1, '<c-d>')<cr>", {})
end
-- LSP
local function setup_servers()
  lsp_installer.setup()
  local servers = require('nvim-lsp-installer.servers').get_installed_server_names()
  for _, server in pairs(servers) do
    local cfg = {}

    if server == 'sumneko_lua' then
      cfg = {
        settings = {
          Lua = {
            diagnostics = { globals = { 'vim', 'use' } }
          }
        }
      }
    end

    if server == 'emmet_ls' then
      cfg = {
        filetypes = { 'html', 'typescriptreact', 'javascriptreact', 'css', 'sass', 'scss', 'less' },
      }

    end

    lspconfig[server].setup(coq.lsp_ensure_capabilities(vim.tbl_deep_extend('force',
      {
        --capabilities = capabilities,
        on_attach = on_attach

      }, cfg or {})))
  end
end

setup_servers()

require('coq_3p') {
  { src = "figlet", short_name = "BIG", trigger = "!big" },
}


