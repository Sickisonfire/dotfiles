local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)


require("lazy").setup({
  {
    "nvim-treesitter/nvim-treesitter",
    branch = 'master',
    lazy = false,
    build = ":TSUpdate",
  },
  'nvim-treesitter/nvim-treesitter-context',
  {
    'nvim-telescope/telescope.nvim',
    tag = 'v0.2.0',
    dependencies = { 'nvim-lua/plenary.nvim' },
  },
  { 'nvim-telescope/telescope-fzf-native.nvim',  build = 'cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release && cmake --build build --config Release && cmake --install build --prefix build' },
  { 'nvim-telescope/telescope-file-browser.nvim' },

  { 'williamboman/mason.nvim',                   opts = {} },
  {
    -- possible to remove soon. only manages the autostart of lsp servers. can
    -- probably easily be replaced with vim.lsp.enable
    "mason-org/mason-lspconfig.nvim",
    opts = {},
    dependencies = {
      { "mason-org/mason.nvim", opts = {} },
      "neovim/nvim-lspconfig",
    },
  },
  {
    "iamcco/markdown-preview.nvim",
    cmd = { "MarkdownPreviewToggle", "MarkdownPreview", "MarkdownPreviewStop" },
    ft = { "markdown" },
    build = function() vim.fn["mkdp#util#install"]() end,
  },
  "nvim-tree/nvim-web-devicons",
  -- {
  --   "folke/trouble.nvim",
  --   opts = {},
  --   cmd = 'Trouble'
  -- },
  'NvChad/nvim-colorizer.lua',
  {
    "hrsh7th/nvim-cmp",
    lazy = false,
    priority = 100,
    dependencies = {
      {
        "onsails/lspkind.nvim",
        config = function()
          require("lspkind").init()
        end,
      },
      "hrsh7th/cmp-nvim-lsp",
      "hrsh7th/cmp-path",
      "hrsh7th/cmp-buffer",
      {
        "L3MON4D3/LuaSnip",
        version = "v2.*",
        build = "make install_jsregexp"
      },
      "saadparwaiz1/cmp_luasnip",
    },
    config = function()
      require "completion"
    end,
  },

  { 'akinsho/toggleterm.nvim', version = "*", config = true }
})
--  -- Debuging
--  use "mfussenegger/nvim-dap"
--  use { "rcarriga/nvim-dap-ui", requires = { "mfussenegger/nvim-dap" } }
--  use "theHamsta/nvim-dap-virtual-text"
--  use "nvim-telescope/telescope-dap.nvim"
--
--  -- debuggers
--  use { "mxsdev/nvim-dap-vscode-js", requires = { "mfussenegger/nvim-dap" } }
--  use {
--    "microsoft/vscode-js-debug",
--    opt = true,
--    run = "npm install --legacy-peer-deps && npx gulp vsDebugServerBundle && mv dist out"
--  }
--  use 'tpope/vim-fugitive'
--  use 'mbbill/undotree'
--
--  use "windwp/nvim-ts-autotag"
--end)
