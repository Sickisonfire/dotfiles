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
    'nvim-treesitter/nvim-treesitter',
    build = ':TSUpdate'
  },
  'nvim-treesitter/nvim-treesitter-context',
  {
    'nvim-telescope/telescope.nvim',
    branch = '0.1.x',
    dependencies = { 'nvim-lua/plenary.nvim' },
  },
  { 'nvim-telescope/telescope-fzf-native.nvim',  build = 'cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release && cmake --build build --config Release && cmake --install build --prefix build' },
  { 'nvim-telescope/telescope-file-browser.nvim' },
  {
    'williamboman/mason.nvim',
    build = 'MasonUpdate',
    'williamboman/mason-lspconfig.nvim',
    'neovim/nvim-lspconfig',
    {
      "iamcco/markdown-preview.nvim",
      cmd = { "MarkdownPreviewToggle", "MarkdownPreview", "MarkdownPreviewStop" },
      ft = { "markdown" },
      build = function() vim.fn["mkdp#util#install"]() end,
    }
  },
  "nvim-tree/nvim-web-devicons",
  -- {
  --   "folke/trouble.nvim",
  --   opts = {},
  --   cmd = 'Trouble'
  -- },
  'NvChad/nvim-colorizer.lua',
})
--  use {
--    "ms-jpq/coq_nvim",
--    requires = {
--      { "ms-jpq/coq.artifacts", branch = "artifacts" },
--      {
--        "ms-jpq/coq.thirdparty",
--        branch = "3p",
--      },
--      {
--        "onsails/lspkind-nvim",
--        config = function()
--          require("lspkind").init()
--        end,
--      },
--      branch = "coq",
--    }
--  }
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
