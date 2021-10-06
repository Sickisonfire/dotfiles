
"-------------------------------------------------------------------
"  PLUGINS
"-------------------------------------------------------------------
set nocompatible
filetype off

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
"whatever
Plugin 'VundleVim/Vundle.vim'
Plugin 'tpope/vim-fugitive'
Plugin 'fatih/vim-go'
Plugin 'tpope/vim-surround'

Plugin 'junegunn/fzf'
Plugin 'raimondi/delimitmate'
Plugin 'nicwest/vim-http'
Plugin 'ziglang/zig.vim'
Plugin 'neoclide/coc.nvim', {'branch': 'release'}
Plugin 'elixir-editors/vim-elixir'
Plugin 'iamcco/markdown-preview.nvim' 
"NERDTREE STUFF
Plugin 'preservim/nerdtree'
Plugin 'ryanoasis/vim-devicons'

"JS/TS
Plugin 'pangloss/vim-javascript'
Plugin 'leafgarland/typescript-vim'
Plugin 'MaxMEllon/vim-jsx-pretty'
Plugin 'peitalin/vim-jsx-typescript'
Plugin 'styled-components/vim-styled-components'
Plugin 'jparise/vim-graphql'
"COLORS
Plugin 'joshdick/onedark.vim'
Plugin 'morhetz/gruvbox'
Plugin 'sainnhe/edge'
Plugin 'sainnhe/sonokai'
Plugin 'dracula/vim', { 'name': 'dracula' }

call vundle#end()
filetype plugin on
"filetype plugin indent on

"-------------------------------------------------------------------
" Vim Settings 
"-------------------------------------------------------------------
syntax on
set encoding=UTF-8
let mapleader = " "
set noerrorbells
set smartindent
set tabstop=4 softtabstop=4
set shiftwidth=4
set expandtab
set showcmd
set showmatch
set ignorecase
set smartcase
set incsearch
set autowrite
set hidden
set mouse=a
set nu
set nowrap
set ruler

set nobackup
set undodir=~/.vim/undodir
set undofile

set rtp+=~/.fzf

let g:go_fmt_command = "goimports"

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


"-------------------------------------------------------------------
" COLORS 
"-------------------------------------------------------------------

" sonokai settings
let g:sonokai_style = 'andromeda'
let g:sonokai_enable_italic = 1
let g:sonokai_disable_italic_comment = 1
" edge settings
let g:edge_style = 'neon'
let g:edge_enable_italic = 1
let g:edge_disable_italic_comment = 1

let g:onedark_terminal_italics = 1
set background=dark
"available: edge, sonokai, onedark, gruvbox, dracula
colorscheme onedark 
hi Normal ctermbg=none 


"-------------------------------------------------------------------
" Mappings 
"-------------------------------------------------------------------
nnoremap <leader>s :source ~/.vimrc<CR>
nmap <C-p> :FZF<CR>
"exit insert mode aka spam kj  
imap jj <ESC>
imap jk <ESC>
imap kj <ESC>

nnoremap <leader>h :wincmd h<CR>
nnoremap <leader>j :wincmd j<CR>
nnoremap <leader>k :wincmd k<CR>
nnoremap <leader>l :wincmd l<CR>
nnoremap <leader>r :GoRun %<CR>
nnoremap <leader>w :w <CR>
nnoremap <leader>x :x <CR>
nnoremap <leader>q :q <CR>

nnoremap <leader>n :NERDTreeToggle<CR> 
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gr <Plug>(coc-references)

nnoremap <silent> K :call CocAction('doHover')<CR>
nmap <silent> ak <Plug>(coc-diagnostic-prev)
nmap <silent> aj <Plug>(coc-diagnostic-next)
nmap <leader>do <Plug>(coc-codeaction)

function! s:check_back_space() abort
  let col = col('.') - 1
    return !col || getline('.')[col - 1]  =~ '\s'
endfunction

inoremap <silent><expr> <Tab> pumvisible() ? "\<C-n>" : <SID>check_back_space() ? "\<Tab>" : coc#refresh()
function! ShowDocIfNoDiagnostic(timer_id)
  if (coc#float#has_float() == 0)
   silent call CocActionAsync('doHover')
  endif
endfunction

function! s:show_hover_doc()
  call timer_start(500, 'ShowDocIfNoDiagnostic')
endfunction

autocmd CursorHoldI * :call <SID>show_hover_doc()
autocmd CursorHold * :call <SID>show_hover_doc()

" Golang stuff
nnoremap <leader>tf :GoTestFunc<CR>
nnoremap <leader>t :GoTest<CR>
