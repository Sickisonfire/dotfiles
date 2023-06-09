vim.cmd [[packadd packer.nvim]]

require('packer').startup(function()
  use 'wbthomason/packer.nvim'
  use 'ellisonleao/gruvbox.nvim' 

  use 'NvChad/nvim-colorizer.lua'
  
  use 'nvim-lua/plenary.nvim'
  use 'nvim-lua/popup.nvim'
  use 'nvim-telescope/telescope.nvim'

  use { 'nvim-telescope/telescope-fzf-native.nvim', run = 'make' }
  use { "nvim-telescope/telescope-file-browser.nvim" }

  -- LSP
  use {
    "williamboman/nvim-lsp-installer",
    { "neovim/nvim-lspconfig", }
  }

  use "lukas-reineke/lsp-format.nvim"
  use({
    "glepnir/lspsaga.nvim",
    branch = "main",
    config = function()
      require("lspsaga").setup({})
    end,
    requires = { { "nvim-tree/nvim-web-devicons" } }
  })
  use {
    "ms-jpq/coq_nvim",
    requires = {
      { "ms-jpq/coq.artifacts", branch = "artifacts" },
      { "ms-jpq/coq.thirdparty",
        branch = "3p",
      },
      {
        "onsails/lspkind-nvim",
        config = function()
          require("lspkind").init()
        end,
      },
      branch = "coq",
    }
  }
  -- Debuging
  use "mfussenegger/nvim-dap"
  use { "rcarriga/nvim-dap-ui", requires = { "mfussenegger/nvim-dap" } }
  use "theHamsta/nvim-dap-virtual-text"
  use "nvim-telescope/telescope-dap.nvim"

  -- debuggers
  use { "mxsdev/nvim-dap-vscode-js", requires = { "mfussenegger/nvim-dap" } }
  use {
    "microsoft/vscode-js-debug",
    opt = true,
    run = "npm install --legacy-peer-deps && npx gulp vsDebugServerBundle && mv dist out" 
  }
  use {
    "folke/trouble.nvim",
    requires = "nvim-tree/nvim-web-devicons",
    config = function()
      require("trouble").setup {} 
    end
  }
  use 'tpope/vim-fugitive'
  use 'mbbill/undotree'
  use 'tpope/vim-commentary'
  use({
    "iamcco/markdown-preview.nvim",
    run = function() vim.fn["mkdp#util#install"]() end,
  })
  use 'arcticicestudio/nord-vim'

  use "windwp/nvim-ts-autotag"
  use { 'nvim-treesitter/nvim-treesitter', run = ':TSUpdate' }

end)

