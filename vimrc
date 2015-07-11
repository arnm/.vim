autocmd BufWritePre * :%s/\s\+$//e
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

set hidden

set encoding=utf-8
set ttyfast
set lazyredraw
set splitbelow
set splitright
set modelines=0
set laststatus=2
set ttimeoutlen=50

" Save when focus is lost
au FocusLost * :wa
" Resize splits when the window is resized
au VimResized * exe "normal! \<c-w>="

set mouse=a
set clipboard="

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

set tabstop=2
set shiftwidth=2
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

" Movement
noremap j h
noremap k j
noremap l k
noremap ; l

" Cycle folds
nnoremap zk zj
nnoremap zl zk

inoremap jk <esc>
inoremap <c-e> <esc>A
inoremap <c-a> <esc>I

" retain selection when indenting
vnoremap < <gv
vnoremap > >gv

" format block of text
vnoremap F gq
nnoremap F gqap

" Keep search matches in the middle of the window.
nnoremap n nzzzv
nnoremap N Nzzzv

"Don't move to next match on *
nnoremap * *<c-o>

" Cycle buffers
nnoremap <Tab> :bnext<cr>
nnoremap <S-Tab> :bprevious<cr>

let mapleader = ','
let maplocalleader = '\\'
nnoremap <leader>e :
nnoremap <leader>R :source %<cr>
nnoremap <leader>s :split<cr>
nnoremap <leader>v :vsplit<cr>
nnoremap <leader>c :q<cr>
nnoremap <leader>C :q!<cr>
nnoremap <leader>q :qa<cr>
nnoremap <leader>Q :qa!<cr>
nnoremap <leader>w :w<cr>
nnoremap <leader>h :help<Space>
nnoremap <leader><space> :noh<cr>:call clearmatches()<cr>

" }}}

" Plugins -------------------------------------------------------- {{{

call plug#begin('~/.vim/plugged')

Plug 'rking/ag.vim'
Plug 'cespare/vim-toml'

Plug 'mattn/emmet-vim'
Plug 'pangloss/vim-javascript'
Plug 'marijnh/tern_for_vim', { 'do': 'npm install' }
Plug 'mxw/vim-jsx', {'do': 'npm install -g jsxhint' }

Plug 'airblade/vim-gitgutter'
Plug 'tpope/vim-fugitive'
nnoremap <leader>gs :Gstatus<cr>
nnoremap <leader>gd :Gdiff<cr>
nnoremap <leader>gw :Gwrite<cr>
nnoremap <leader>gc :Gcommit<cr>
nnoremap <leader>gp :Gpush<cr>

Plug 'Shougo/vimproc.vim', { 'do': 'make' }
Plug 'Shougo/unite.vim'
let g:unite_data_directory='~/.vim/.cache/unite'
let g:unite_source_history_yank_enable=1
let g:unite_prompt='» '
let g:unite_split_rule = 'botright'
if executable('ag')
  let g:unite_source_grep_command='ag'
  let g:unite_source_grep_default_opts='--nocolor --line-numbers --nogroup --column'
  let g:unite_source_grep_recursive_opt=''
endif
nnoremap <leader>a :Unite file_rec/async -auto-resize -start-insert -buffer-name=files<cr>
nnoremap <leader>b :Unite buffer -auto-resize -start-insert -buffer-name=buffers<cr>
nnoremap <leader>g :Unite grep:. -no-quit -buffer-name=search<cr>

autocmd FileType unite call s:unite_overrides()
function s:unite_overrides()
  noremap <buffer> j h
  noremap <buffer> k j
  noremap <buffer> l k
  noremap <buffer> ; l
endfunction

Plug 'scrooloose/nerdtree'
nnoremap <leader>ts :NERDTreeToggle<cr>
let NERDTreeShowHidden=1
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
nnoremap <C-f> :VtrSendLineToRunner<cr>
vnoremap <C-f> :VtrSendLinesToRunner<cr>

Plug 'godlygeek/tabular'
Plug 'plasticboy/vim-markdown'

Plug 'scrooloose/syntastic'
let g:syntastic_javascript_checkers = ['jsxhint']

Plug 'guns/vim-sexp'
Plug 'guns/vim-clojure-static', { 'for': 'clojure' }
Plug 'tpope/vim-fireplace', { 'for': 'clojure' }
Plug 'kana/vim-smartinput'

Plug 'wting/rust.vim'
Plug 'phildawes/racer', {'do' : 'cargo build --release && git clone https://github.com/rust-lang/rust.git' }
let g:racer_cmd = '~/.vim/plugged/racer/target/release/racer'
let $RUST_SRC_PATH= $HOME . '/.vim/plugged/racer/rust/src/'

Plug 'davidhalter/jedi-vim', { 'for': 'python' }
let g:jedi#auto_vim_configuration = 0
let g:jedi#completions_enabled = 0
let g:jedi#popup_select_first = 0

Plug 'raichoo/haskell-vim'
" Plug 'lukerandall/haskellmode-vim'
Plug 'eagletmt/ghcmod-vim'
Plug 'eagletmt/neco-ghc'

Plug 'Chiel92/vim-autoformat'
nnoremap <leader>f :Au<cr>

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

" if patter matches, local omnifunc will be called
if !exists('g:neocomplete#sources#omni#input_patterns')
  let g:neocomplete#sources#omni#input_patterns = {}
endif

let g:neocomplete#sources#omni#input_patterns.rust =
      \ '[^.[:digit:] *\t]\%(\.\|\::\)\%(\h\w*\)\?'

Plug 'tpope/vim-abolish'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-surround'

Plug 'vim-scripts/utl.vim'
let g:utl_cfg_hdl_scm_http_system = "silent !open -a 'Google Chrome' '%u#%f'"

Plug 'arnm/base16-vim'

Plug 'luochen1990/rainbow'
let g:rainbow_active = 1

Plug 'guns/xterm-color-table.vim'

Plug 'bling/vim-airline'
let g:airline_powerline_fonts = 1
let g:airline_theme = "powerlineish"
let g:airline#extensions#tabline#enabled = 1

Plug 'mattn/webapi-vim'
Plug 'mattn/gist-vim', { 'do': 'git config --global github.user arnm' }
let g:gist_detect_filetype = 1

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
set listchars=tab:▸\ ,trail:·,eol:¬,extends:❯,precedes:❮
set fillchars=diff:⣿,vert:│
set showbreak=↪

set background=dark
let base16colorspace=256
colorscheme base16-eighties

" }}}
