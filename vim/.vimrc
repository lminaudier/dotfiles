set nocompatible               " be iMproved
filetype off                   " required!

set shell=zsh
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
if (has("nvim"))
  "For Neovim 0.1.3 and 0.1.4 < https://github.com/neovim/neovim/pull/2198 >
  let $NVIM_TUI_ENABLE_TRUE_COLOR=1
endif

"For Neovim > 0.1.5 and Vim > patch 7.4.1799 < https://github.com/vim/vim/commit/61be73bb0f965a895bfb064ea3e55476ac175162 >
"Based on Vim patch 7.4.1770 (`guicolors` option) < https://github.com/vim/vim/commit/8a633e3427b47286869aa4b96f2bfc1fe65b25cd >
" < https://github.com/neovim/neovim/wiki/Following-HEAD#20160511 >
if (has("termguicolors"))
  set termguicolors
endif
set background=dark
colorscheme palenight

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

" Copy to OSX clipboard
set clipboard=unnamed

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
set textwidth=100
set fo+=cqt
set wrapmargin=0
set nowrap

" Enable mouse scrolling
set mouse=a

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
set colorcolumn=100

" Autocomplete mode
set wildmode=longest,list:longest
set complete=.,b,u,]
set completeopt=menu,preview

" FZF
nnoremap <leader>p :FZF<cr>

" Vim Go
let $GOPATH = $HOME."/go"
let $PATH = $GOPATH."/bin:".$PATH
let g:go_bin_path = $GOPATH."/bin"

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
com! -nargs=1 -complete=dir Ncd NERDTree | cd <args> |NERDTreeCWD

function! s:CloseIfOnlyControlWinLeft()
  if winnr("$") != 1
    return
  endif
  if (exists("t:NERDTreeBufName") && bufwinnr(t:NERDTreeBufName) != -1)
        \ || &buftype == 'quickfix'
    q
  endif
endfunction
augroup CloseIfOnlyControlWinLeft
  au!
  au BufEnter * call s:CloseIfOnlyControlWinLeft()
augroup END

" Trigger configuration.
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<tab>"
let g:UltiSnipsJumpBackwardTrigger="<c-b>"

" ctrl-j and ctrl-k to scroll into popup menus
inoremap <expr> <C-j> pumvisible() ? "\<C-n>" : "\<C-j>"
inoremap <expr> <C-k> pumvisible() ? "\<C-p>" : "\<C-k>"

" Vim Sneak
let g:sneak#label = 1

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
