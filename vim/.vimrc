set nocompatible               " be iMproved
filetype off                   " required!

" no vi compatibility
set nocompatible

" remap leader key
let mapleader=","

" filetype detection an syntax highlighting
filetype plugin indent on
syntax on

" Load vundle plugins
if filereadable(expand("~/.vimrc.bundles"))
  source ~/.vimrc.bundles
endif

" Colors
colorscheme gruvbox
set background=dark

" Share clipboard
set clipboard=unnamed

" encoding
set encoding=utf-8

" Turn off backup and swp files
set nobackup
set nowritebackup
set noswapfile

" Indentation
set autoindent
set smartindent

" Smart indentation
set shiftround

" Desactivate code folding
set nofoldenable

" numbering
set number

" Allow undoing after quitting
set undodir=~/.vim/undodir
set undofile
set undolevels=100

" autocomplete menu in commands
set wildmenu

" Always show status
set laststatus=2

" Always show tab line
set showtabline=2

" Remove trailing spaces
augroup clear_whitespaces
  autocmd!
  autocmd BufWritePre * :%s/\s\+$//e
augroup END

" allow backgrounding buffer without saving them
set hidden

" configure tabs
set tabstop=2                     " a tab is two spaces
set shiftwidth=2                  " an autoindent (with <<) is two spaces
set expandtab                     " use spaces, not tabs

" invisibles
set list                          " Show invisible characters
set listchars=""                  " Reset the listchars
set listchars=tab:\ \             " a tab should display as "  ", trailing whitespace as "."
set listchars+=trail:·            " show trailing spaces as middle dots
set listchars+=extends:>          " The character to show in the last column when wrap is
                                  " off and the line continues beyond the right of the scree
" Desactivate Ex-mode
map Q <Nop>

" Don't use thats nasty arrows
nnoremap <up> <nop>
nnoremap <down> <nop>
nnoremap <left> <nop>
nnoremap <right> <nop>

" go up or done by one line on wrapped lines
nnoremap j gj
nnoremap k gk

" Make searches case-sensitive only if they contain upper-case characters
set ignorecase
set smartcase

" desactivate sounds
set visualbell

" start scroll 3 lines before the top (or bottom)
set scrolloff=3

" configure search
nnoremap / /\v
vnoremap / /\v
set gdefault
set incsearch
set showmatch
map <silent> <C-N> :se invhlsearch<CR>

set backspace=2
set backspace=indent,eol,start

" Faster scrolling
set ttyfast
set showcmd
set lazyredraw

" Hide mouse when typing
set mousehide

" Allow the cursor to go in to "invalid" places
set virtualedit=all

" Text width to 80 characters
set textwidth=80
set fo+=cqt
set wrapmargin=0

" :W write the file as :w
command! W :w

" Enable mouse scrolling
set mouse=a
set ttymouse=xterm

" Excape is so far away from keyboard
inoremap jj <esc>
inoremap jk <esc>

" Better dot command in visual mode
vnoremap . :norm.<cr>

" Automatically reread files that have been changed externally
set autoread

" Leader Mappings
nnoremap <leader><leader> <c-^>
nnoremap <leader>ev :vsplit $MYVIMRC<cr>
nnoremap <leader>sv :source $MYVIMRC<cr>
nnoremap <leader>bd :bd<cr>

" Colorize 80 chars column
set colorcolumn=80

" Autocomplete mode
set wildmode=longest,list:longest
set complete=.,b,u,]
set completeopt=menu,preview

" FZF
nnoremap <leader>p :FZF<cr>

" Vim Go
let $PATH = $HOME."/go/bin:".$PATH
let $GOPATH = $HOME."/go"

let g:go_bin_path = $HOME."/go/bin"

let g:go_highlight_functions = 1
let g:go_highlight_methods = 1
let g:go_highlight_fields = 1
let g:go_highlight_types = 1
let g:go_highlight_operators = 1
let g:go_highlight_build_constraints = 1
let g:go_fmt_command = "goimports"
let g:go_def_mode='gopls'
let g:go_info_mode='gopls'

" Disable omnicompletion preview window
set completeopt-=preview

" NERDTree
nnoremap <leader>l :NERDTreeToggle<cr>
nnoremap <leader>L :NERDTreeFind<cr>

" Trigger configuration.
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<tab>"
let g:UltiSnipsJumpBackwardTrigger="<c-b>"

" ctrl-j and ctrl-k to scroll into popup menus
inoremap <expr> <C-j> pumvisible() ? "\<C-n>" : "\<C-j>"
inoremap <expr> <C-k> pumvisible() ? "\<C-p>" : "\<C-k>"
