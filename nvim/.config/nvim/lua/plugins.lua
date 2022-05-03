
vim.cmd [[packadd packer.nvim]]

require('packer').startup(function ()
    use 'wbthomason/packer.nvim'

    use 'nvim-lua/plenary.nvim'
    use 'nvim-lua/popup.nvim'
    use 'nvim-telescope/telescope.nvim'
    --use 'neoclide/coc.nvim', {'branch': 'release'}
    --use 'fannheyward/telescope-coc.nvim'

use {'nvim-telescope/telescope-fzf-native.nvim',  run = 'make' }
    use { "nvim-telescope/telescope-file-browser.nvim" }

    -- LSP 
    use {
        "williamboman/nvim-lsp-installer",
        {
            "neovim/nvim-lspconfig",
        }
    }
    use 'glepnir/lspsaga.nvim'

    use "hrsh7th/nvim-cmp" --completion
    use {'tzachar/cmp-tabnine', run='./install.sh', requires = 'hrsh7th/nvim-cmp'}

    use 'pangloss/vim-javascript'
    use 'leafgarland/typescript-vim'
    use 'MaxMEllon/vim-jsx-pretty'
    use 'peitalin/vim-jsx-typescript'
    use 'styled-components/vim-styled-components'
    use 'jparise/vim-graphql'
    use 'pantharshit00/vim-prisma'
    use 'tikhomirov/vim-glsl'

    use 'tpope/vim-fugitive'
    use 'mbbill/undotree'
    use 'tpope/vim-commentary'
    use 'iamcco/markdown-preview.nvim'
    use 'andymass/vim-matchup'
    use 'arcticicestudio/nord-vim'
    use 'joshdick/onedark.vim'
end)

require('telescope').load_extension('fzf')
--require('telescope').load_extension('coc')
