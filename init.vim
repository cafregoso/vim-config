set number
syntax on
set mouse=a
set numberwidth=1
set clipboard=unnamed
set showcmd
set ruler
set encoding=utf-8
set showmatch
set sw=2
set relativenumber
set laststatus=2
set noshowmode
set cursorline
set autoindent
set expandtab
filetype indent on
imap ff <Esc>

function! CheckBackspace() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

inoremap <silent><expr> <Tab>
      \ coc#pum#visible() ? coc#pum#next(1) :
      \ CheckBackspace() ? "\<Tab>" :
      \ coc#refresh()

call plug#begin('~/.vim/plugged')

" Status bar
Plug 'maximbaz/lightline-ale'
Plug 'itchyny/lightline.vim'

" Themes
Plug 'morhetz/gruvbox'

" IDE
Plug 'easymotion/vim-easymotion'
Plug 'scrooloose/nerdtree'
Plug 'christoomey/vim-tmux-navigator'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'yggdroot/indentline'
Plug 'mhinz/vim-signify'
Plug 'SirVer/ultisnips'
Plug 'mlaursen/vim-react-snippets'

" Syntax
Plug 'sheerun/vim-polyglot'

" Typing
Plug 'alvan/vim-closetag'
Plug 'jiangmiao/auto-pairs'

" Autocomplete
Plug 'sirver/ultisnips'

" Git
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-repeat'

call plug#end()

colorscheme gruvbox
let g:gruvbox_contrast_dark = "hard"
"let g:deoplete#enable_at_startup = 1
"let g:jsx_ext_required = 0
let NERDTreeQuitOnOpen=1

" HTML, JSX

let g:closetag_filenames = '*.html, *.js, *.jsx, *.ts, *.tsx, *.py'

" Lightline
let g:lightline = {
    \ 'active': {
    \   'left': [['mode', 'paste'], [], ['relativepath', 'modified']],
    \   'right': [['filetype', 'percent', 'lineinfo'], ['gitbranch']],
    \ }, 
    \ 'inactive': {
    \   'left': [['inactive'], ['relativepath']],
    \   'right': [['bufnum']],
    \ },
    \ 'component': {
    \   'bufnum': '%n',
    \   'inactive': 'inactive',
    \ },
    \ 'component_function': {
    \   'gitbranch': 'fugitive#head',
    \ },
    \ 'colorscheme': 'gruvbox',
    \ 'subseparator': {
    \   'left': '',
    \   'right': '',
    \ },}

let mapleader =" "
nmap <Leader>s <Plug>(easymotion-s2)
nmap <Leader>nt :NERDTreeFind<CR>

nmap <Leader>w :w<CR>
nmap <Leader>q :q<CR>
nmap <Leader>x :x<CR>

nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Slip resize
nmap <Leader>> 10<C-w>
nmap <Leader>< 10<C-w>

" Faster scrolling
nnoremap <C-j> 10<C-e>
nnoremap <C-k> 10<C-y>

inoremap <expr> <cr> coc#pum#visible() ? coc#pum#confirm() : "\<CR>"
