" Disable VI compatibility
set nocompatible

" Enable file type detection and syntax highlighting
filetype off
filetype plugin indent on
syntax on

" Set leader key
let mapleader=","

" Set shell
set shell=/bin/zsh

""""""""""""""""""""""""""""""""""""""""""""""""""
" Plugins
""""""""""""""""""""""""""""""""""""""""""""""""""

call plug#begin('~/.vim/plugged')
" Editor features
Plug 'itchyny/lightline.vim'
Plug 'airblade/vim-gitgutter'
Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }
Plug 'junegunn/fzf'
Plug 'junegunn/fzf.vim'
Plug 'ConradIrwin/vim-bracketed-paste'
Plug 'vimwiki/vimwiki'
Plug 'mhinz/vim-startify'

" Snippets
Plug 'MarcWeber/vim-addon-mw-utils'
Plug 'tomtom/tlib_vim'
Plug 'garbas/vim-snipmate'
Plug 'honza/vim-snippets'

" Editor themes
Plug 'drewtempelmeyer/palenight.vim'

" Code edit plugins
Plug 'tpope/vim-surround'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-commentary'

" Test runners
Plug 'janko/vim-test'

" Language specific
Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }
call plug#end()

" Theme and colors
if (has("termguicolors"))
  set termguicolors
endif
set background=dark
colorscheme palenight
let g:lightline = {
      \ 'colorscheme': 'palenight',
      \ }

" Share VIM clipboard with OSX one
set clipboard=unnamed

" Set default editor encoding
set encoding=utf-8

" Turn off backup and swp files
set nobackup
set nowritebackup
set noswapfile

" Enable auto and smart indentation
set autoindent
set smartindent
set shiftround

" Enable line numbers
set number

" Enable undo
set undodir=~/.vim/undodir
set undofile
set undolevels=100

" Autocomplete commands
set wildmenu
set wildmode=list,full

" Always show last command status
set laststatus=2

" Always show tab line
set showtabline=2

" Allow putting buffers in background even when they are unsaved
set hidden

" Deactivate arrows in normal mode
nnoremap <up> <nop>
nnoremap <down> <nop>
nnoremap <left> <nop>
nnoremap <right> <nop>

" Remap W to write
command! W :w

" go up or done by one line on wrapped lines
nnoremap j gj
nnoremap k gk

" Use jk to to go from insert to normal mode
inoremap jk <esc>

" Hides mode in status line.
" It appears in status bar
set noshowmode

" Remove trailing spaces
augroup clear_whitespaces
  autocmd!
  autocmd BufWritePre * :%s/\s\+$//e
augroup END

" configure tabs
set tabstop=4
set shiftwidth=4
set expandtab

" invisibles
set listchars=eol:⏎,tab:␉·,trail:␠,nbsp:⎵

" Desactivate Ex-mode
map Q <Nop>

" Search
set ignorecase
set smartcase
nnoremap / /\v
vnoremap / /\v
set gdefault
set incsearch
set showmatch
map <silent> <C-N> :se invhlsearch<CR>

" Desactivate sounds
set visualbell

" Start scroll 3 lines before the top or bottom
set scrolloff=5

" Allow using backspace in vim i.e on line breaks, indents, ...
set backspace=2

" Allow to edit in invalid places
set virtualedit=all

" Mouse configuration
" Enable mouse scrolling
set mouse=a

" Better dot command in visual mode
vnoremap . :norm.<cr>

" Automatically reread files that have been changed externally
set autoread

" ctrl-j and ctrl-k to scroll into popup menus
inoremap <expr> <C-j> pumvisible() ? "\<C-n>" : "\<C-j>"
inoremap <expr> <C-k> pumvisible() ? "\<C-p>" : "\<C-k>"

" autocompletion menu configuration
set completeopt=longest,menuone
inoremap <expr> <CR> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"

""""""""""""""""""""""""""""""""""""""""
" Neovim Terminal
""""""""""""""""""""""""""""""""""""""""
if has("nvim")
    tnoremap <leader><esc> <C-\><C-n>
    autocmd BufEnter,BufNew term://* startinsert
endif

""""""""""""""""""""""""""""""""""""""""
" Leader key bindings
""""""""""""""""""""""""""""""""""""""""

nnoremap <leader><leader> <c-^>
nnoremap <leader>p :FZF<cr>
nnoremap <leader>bd :bd<cr>
nnoremap <leader>l :NERDTreeToggle<CR>
nnoremap <leader>L :NERDTreeFind<CR>

nnoremap <leader>t :belowright split term://make<CR>

""""""""""""""""""""""""""""""""""""""""
" Plugin Specific configuration
""""""""""""""""""""""""""""""""""""""""

" Vim Go
let g:go_highlight_functions = 1
let g:go_highlight_methods = 1
let g:go_highlight_fields = 1
let g:go_highlight_types = 1
let g:go_highlight_operators = 1
let g:go_highlight_build_constraints = 1
let g:go_fmt_command = "goimports"
let g:go_def_mode='gopls'
let g:go_info_mode='gopls'
let g:auto_type_info = 1
let g:go_addtags_transform = "snake_case"
let g:go_auto_sameids = 1
" Autocomplete prompt when . is pressed
au filetype go inoremap <buffer> . .<C-x><C-o>

" SnipMate
imap <tab> <Plug>snipMateNextOrTrigger

" Vim Wiki
nmap <Leader>tt <Plug>VimwikiToggleListItem
vmap <Leader>tt <Plug>VimwikiToggleListItem

let g:vimwiki_list = [{
  \ 'automatic_nested_syntaxes':1,
  \ 'path_html': '$HOME/wiki/html',
  \ 'path': '$HOME/wiki/text',
  \ 'template_path': '$HOME/wiki/template/',
  \ 'syntax': 'markdown',
  \ 'ext':'.md',
  \ 'template_default':'markdown',
  \ 'custom_wiki2html': '$HOME/bin/wiki2html.sh',
  \ 'template_ext':'.html'
\}]

" Vim test
nnoremap <leader>t :TestFile<CR>
nnoremap <leader>T :TestNearest<CR>
