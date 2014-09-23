" autocmd BufWritePre * :%s/\s\+$//e
" autocmd BufWritePost ~/bootstrap/dotfiles/vimrc source %

" Env ------------------------------------------------------------ {{{

set shell=/bin/bash
set nocompatible

" }}}

" Backups -------------------------------------------------------- {{{

set nobackup
set nowritebackup
set noswapfile

" }}}

" Behavior ------------------------------------------------------- {{{

set encoding=utf-8
set ttyfast
set lazyredraw
set splitbelow
set splitright
set modelines=0
set laststatus=2
set ttimeoutlen=50

set mouse=a
set clipboard=unnamed

set foldmethod=marker
set foldlevelstart=0

" }}}

" Wildmenu ------------------------------------------------------- {{{

set wildmenu
set wildignore+=.hg,.git,.svn
set wildignore+=*.aux,*.out,*.toc
set wildignore+=*.jpg,*.bmp,*.gif,*.png,*.jpeg
set wildignore+=*.o,*.obj,*.exe,*.dll,*.manifest
set wildignore+=*.spl
set wildignore+=*.sw?
set wildignore+=*.DS_Store
set wildignore+=*.luac
set wildignore+=*.pyc
set wildignore+=*.orig
set wildignore+=*.class

" }}}

" Whitespace ----------------------------------------------------- {{{

set autoindent
set smarttab
set expandtab

set tabstop=4
set shiftwidth=4

" }}}

" Search --------------------------------------------------------- {{{

set hlsearch
set incsearch
set ignorecase
set smartcase

" }}}

" Functions ------------------------------------------------------ {{{

" }}}

" Global Maps ---------------------------------------------------- {{{

noremap j h
noremap k j
noremap l k
noremap ; l

nnoremap zk zj
nnoremap zl zk

inoremap jk <esc>
inoremap kj <esc>

" retain selection when indenting
vnoremap < <gv
vnoremap > >gv

vnoremap F gq
nnoremap F gqap

nmap <Tab> :tabnext<cr>
nmap <S-Tab> :tabprevious<cr>

let mapleader = ','
nnoremap <leader>e :
nnoremap <leader>R :source %<cr>
nnoremap <leader>s :split<cr>
nnoremap <leader>v :vsplit<cr>
nnoremap <leader>c :quit<cr>
nnoremap <leader>q :qa<cr>
nnoremap <leader>Q :qa!<cr>
nnoremap <leader>w :w<cr>
nnoremap <leader>h :help<Space>

" }}}

" Plugins -------------------------------------------------------- {{{

call plug#begin('~/.vim/plugged')

Plug 'airblade/vim-gitgutter'
Plug 'tpope/vim-fugitive'
nnoremap <leader>gs :Gstatus<cr>
nnoremap <leader>gd :Gdiff<cr>
nnoremap <leader>gw :Gwrite<cr>
nnoremap <leader>gc :Gcommit<cr>
nnoremap <leader>gp :Gpush<cr>

Plug 'kien/ctrlp.vim'
let g:ctrlp_map = '<leader>a'

Plug 'scrooloose/nerdtree'
nnoremap <leader>ts :NERDTreeToggle<cr>
let NERDTreeIgnore=['\.pyc$']

Plug 'Lokaltog/vim-easymotion'
map <Space>w <Plug>(easymotion-w)
map <Space>s <Plug>(easymotion-s)
map <Space>j <Plug>(easymotion-linebackward)
map <Space>k <Plug>(easymotion-j)
map <Space>l <Plug>(easymotion-k)
map <Space>; <Plug>(easymotion-lineforward)

Plug 'christoomey/vim-tmux-navigator'
nnoremap <silent> <c-j> :TmuxNavigateLeft<cr>
nnoremap <silent> <c-k> :TmuxNavigateDown<cr>
nnoremap <silent> <c-l> :TmuxNavigateUp<cr>
nnoremap <silent> <ESC>[C :TmuxNavigateRight<cr>
nnoremap <silent> <c-\> :TmuxNavigatePrevious<cr>

Plug 'christoomey/vim-tmux-runner'
let g:VtrStripLeadingWhitespace = 0

Plug 'godlygeek/tabular'
Plug 'plasticboy/vim-markdown'

Plug 'scrooloose/syntastic'

Plug 'guns/vim-clojure-static'
Plug 'guns/vim-sexp'
Plug 'tpope/vim-classpath'
Plug 'tpope/vim-fireplace'

Plug 'davidhalter/jedi-vim'
let g:jedi#auto_vim_configuration = 0
let g:jedi#completions_enabled = 0
let g:jedi#popup_select_first = 0

Plug 'Shougo/neosnippet.vim'
let g:neosnippet#snippets_directory='~/.vim/snippets'
let g:neosnippet#enable_snipmate_compatibility=1

imap <expr><TAB> neosnippet#expandable_or_jumpable() ? "\<Plug>(neosnippet_expand_or_jump)" : (pumvisible() ? "\<C-n>" : "\<TAB>")
smap <expr><TAB> neosnippet#expandable_or_jumpable() ? "\<Plug>(neosnippet_expand_or_jump)" : "\<TAB>"
imap <expr><S-TAB> pumvisible() ? "\<C-p>" : ""
smap <expr><S-TAB> pumvisible() ? "\<C-p>" : ""

Plug 'Shougo/neocomplete.vim'
let g:neocomplete#enable_at_startup = 1
let g:neocomplete#enable_smart_case = 1
let g:neocomplete#sources#syntax#min_keyword_length = 1
let g:neocomplete#enable_auto_select = 0
let g:neocomplete#force_overwrite_completefunc = 1

Plug 'tpope/vim-commentary'
Plug 'tpope/vim-surround'

Plug 'arnm/vim-tomorrow-theme'

" Plug 'amdt/vim-niji'
Plug 'kien/rainbow_parentheses.vim'
au VimEnter * RainbowParenthesesToggle
au Syntax * RainbowParenthesesLoadRound
au Syntax * RainbowParenthesesLoadSquare
au Syntax * RainbowParenthesesLoadBraces

Plug 'guns/vim-clojure-highlight'
Plug 'guns/xterm-color-table.vim'

Plug 'bling/vim-airline'
let g:airline_powerline_fonts = 1
let g:airline_theme = "powerlineish"

call plug#end()

"  }}}

" Appearance ----------------------------------------------------- {{{

filetype plugin indent on
syntax enable
set t_Co=256

set ruler
set colorcolumn=80
set showcmd
set title

set relativenumber
set number

set list
set listchars=tab:▸\ ,eol:¬,extends:❯,precedes:❮
set fillchars=diff:⣿,vert:│
set showbreak=↪

colorscheme Tomorrow-Night-Bright

" }}}
