vim.cmd [[packadd packer.nvim]]

require('packer').startup(function()
  use 'wbthomason/packer.nvim'


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

  use 'tami5/lspsaga.nvim'
  use "lukas-reineke/lsp-format.nvim"

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
  -- using coq for now
  --
  --use 'hrsh7th/nvim-cmp'
  --use 'saadparwaiz1/cmp_luasnip'
  --use 'hrsh7th/cmp-nvim-lsp'
  --use { 'tzachar/cmp-tabnine', run = './install.sh', requires = 'hrsh7th/nvim-cmp' }
  --use 'L3MON4D3/LuaSnip'
  --use 'rafamadriz/friendly-snippets'

  -- using treesitter for now
  --
  --use 'pangloss/vim-javascript'
  --use 'leafgarland/typescript-vim'
  --use 'MaxMEllon/vim-jsx-pretty'
  --use 'peitalin/vim-jsx-typescript'
  --use 'styled-components/vim-styled-components'
  --use 'jparise/vim-graphql'
  --use 'pantharshit00/vim-prisma'
  --use 'tikhomirov/vim-glsl'

  use 'tpope/vim-fugitive'
  use 'mbbill/undotree'
  use 'tpope/vim-commentary'
  use 'iamcco/markdown-preview.nvim'
  use 'andymass/vim-matchup'
  use 'arcticicestudio/nord-vim'
  use 'joshdick/onedark.vim'

  use { 'nvim-treesitter/nvim-treesitter', run = ':TSUpdate' }

end)

