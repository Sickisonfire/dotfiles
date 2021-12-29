
if exists('g:vscode')
    "vs code stuff goes here
else
    "regular nvim stuff
    set path+=**
    set tabstop=4 softtabstop=4
    set shiftwidth=4
    set expandtab
    set smartindent
    set guicursor=
    set nu
    set relativenumber
    set hidden
    set noerrorbells
    set nohlsearch
    set expandtab
    set nowrap
    set incsearch
    set termguicolors
    set scrolloff=8
    set noshowmode
    set completeopt=menuone,noinsert,noselect
    set mouse=nv

    set noswapfile
    set nobackup
    set undodir=~/.vim/undodir
    set undofile

    " KEY MAPPINGS
    let mapleader = " "
    "exit insert mode aka spam kj  
    imap jj <ESC>
    imap jk <ESC>
    imap kj <ESC>

    " yank to eol
    nnoremap Y y$

    " keep selected line centered
    nnoremap n nzzzv
    nnoremap N Nzzzv
    nnoremap J mzJ`z

    " better undo
    inoremap , ,<C-g>u
    inoremap . .<C-g>u
    inoremap ! !<C-g>u
    inoremap ? ?<C-g>u

    " moving lines
    vnoremap J :m '>+1<CR>gv=gv
    vnoremap K :m '<-2<CR>gv=gv
    "nnoremap <leader>k :m .-2<CR>==
    "nnoremap <leader>j :m .+1<CR>==

    "replace word under cursor ( . to do it again)
    nnoremap cn *``cgn
    nnoremap cN *``cgN

    nnoremap <leader>u :UndotreeToggle <CR>
    nnoremap <leader>w :w <CR>
    nnoremap <leader>x :x <CR>
    nnoremap <leader>q :q <CR>
    nnoremap <leader>ps :lua require('telescope.builtin').grep_string({ search = vim.fn.input("Grep for > " )})<CR>
    nnoremap <C-p> <cmd>Telescope find_files<CR>

    " linecomment script; also for blockcomments in v mode
    function! ToggleLineComment()
        let line = getline('.')
        let firstChars = trim(line)[:1] 
        if firstChars ==# "//"
            execute "normal m`^xx``hh"
        else
            execute "normal m`^i//\<ESC>``ll"
        endif
    endfunction

    nnoremap <leader>r <cmd>!cargo run <CR>

    vnoremap <leader>f :call ToggleLineComment() <CR>
    nnoremap <leader>f :call ToggleLineComment() <CR>


    " window management
    nnoremap <leader>h :wincmd h<CR>
    nnoremap <leader>j :wincmd j <bar> :resize 50<CR>
    nnoremap <leader>k :wincmd k <bar> :resize 50<CR>
    nnoremap <leader>l :wincmd l<CR>
    nnoremap <leader>nvs :vsplit <CR>
    nnoremap <leader>ns :split <CR>
    nnoremap <leader>= :resize +10 <CR>
    nnoremap <leader>- :resize -10 <CR>
    nnoremap <leader>. :vert resize +10 <CR>
    nnoremap <leader>, :vert resize -10 <CR>
    
    "source this file
    nnoremap <leader>so :source ~/.config/nvim/init.vim <CR>


    " installs Plug if not yet done
    let data_dir = has('nvim') ? stdpath('data') . '/site' : '~/.vim'
    if empty(glob(data_dir . '/autoload/plug.vim'))
      silent execute '!curl -fLo '.data_dir.'/autoload/plug.vim --create-dirs  https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
      autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
    endif

    " PLUGINS
    call plug#begin('~/.vim/plugged')

    Plug 'joshdick/onedark.vim'
    Plug 'nvim-lua/plenary.nvim'
    Plug 'nvim-telescope/telescope.nvim'
    Plug 'neoclide/coc.nvim', {'branch': 'release'}
    Plug 'pangloss/vim-javascript'
    Plug 'leafgarland/typescript-vim'
    Plug 'MaxMEllon/vim-jsx-pretty'
    Plug 'peitalin/vim-jsx-typescript'
    Plug 'styled-components/vim-styled-components'
    Plug 'jparise/vim-graphql'
    Plug 'pantharshit00/vim-prisma'
    Plug 'tpope/vim-fugitive'
    Plug 'mbbill/undotree'
    Plug 'arcticicestudio/nord-vim'
    Plug 'iamcco/markdown-preview.nvim'
    Plug 'tikhomirov/vim-glsl'
    
    call plug#end()

    let g:onedark_terminal_italics = 1
    colorscheme nord 
    hi Normal guibg=none

    " CoC settings
    " for larger tsx files
    autocmd BufEnter *.{js,jsx,ts,tsx} :syntax sync fromstart
    autocmd BufEnter *.{js,jsx,ts,tsx} :syntax sync clear

    let g:coc_global_extensions = ['coc-tsserver']

    if isdirectory('./node_modules') && isdirectory('./node_modules/prettier')
        let g:coc_global_extensions += ['coc-prettier']
    endif
    if isdirectory('./node_modules') && isdirectory('./node_modules/eslint')
        let g:coc_global_extensions += ['coc-eslint']
    endif

    let g:coc_snippet_next = '<tab>'

    nmap <silent> gd <Plug>(coc-definition)
    nmap <silent> gy <Plug>(coc-type-definition)
    nmap <silent> gr <Plug>(coc-references)

    nnoremap <silent> K :call CocAction('doHover')<CR>
    nmap <silent> an <Plug>(coc-diagnostic-prev)
    nmap <silent> am <Plug>(coc-diagnostic-next)
    nmap <leader>do <Plug>(coc-codeaction)

    function! s:check_back_space() abort
      let col = col('.') - 1
        return !col || getline('.')[col - 1]  =~ '\s'
    endfunction

    inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<CR>"
    inoremap <silent><expr> <TAB>
          \ pumvisible() ? "\<C-n>" : 
          \ coc#expandableOrJumpable() ? "\<C-r>=coc#rpc#request('doKeymap', ['snippets-expand-jump',''])\<CR>" :
          \ <SID>check_back_space() ? "\<TAB>" :
          \ coc#refresh()

    inoremap <silent> <expr> <C-k> pumvisible() ? "\<C-p>" : "\<C-k>"  
    inoremap <silent> <expr> <C-j> pumvisible() ? "\<C-n>" : "\<C-j>"  
endif

