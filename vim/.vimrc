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
Plug 'scrooloose/nerdtree'
Plug 'junegunn/fzf'
Plug 'junegunn/fzf.vim'
Plug 'ConradIrwin/vim-bracketed-paste'
Plug 'vimwiki/vimwiki'
Plug 'mhinz/vim-startify'
Plug 'kassio/neoterm'
Plug 'liuchengxu/vim-clap'

" Snippets
Plug 'MarcWeber/vim-addon-mw-utils'
Plug 'tomtom/tlib_vim'
Plug 'garbas/vim-snipmate'
Plug 'honza/vim-snippets'

" Editor themes
Plug 'srcery-colors/srcery-vim'
Plug 'arcticicestudio/nord-vim'

" Code edit plugins
Plug 'tpope/vim-surround'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-commentary'

" Test runners
Plug 'janko/vim-test'

" Language specific
Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }
Plug 'neoclide/coc.nvim', {'do': 'yarn install --frozen-lockfile'}
call plug#end()

" Theme and colors
if (has("termguicolors"))
    set termguicolors
endif
set background=dark
colorscheme nord
let g:lightline = {
      \ 'colorscheme': 'nord',
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

" automatically write file before executing any command
set autowrite

" Treat dash separated words as a word text object
set iskeyword+=-

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

" Command typos on write and quit
command! W :w
cnoremap WQ wq
cnoremap Wq wq
cnoremap QA qa
cnoremap qA qa
cnoremap Q! q!

" go up or done by one line on wrapped lines
nnoremap j gj
nnoremap k gk

" Quicker window movement
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-h> <C-w>h
nnoremap <C-l> <C-w>l

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
" round indent to multiples of shiftwidth
set shiftround
set expandtab

" optimization
set ttyfast           " should make scrolling faster
set lazyredraw        " should make scrolling faster

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

" Don't wrap by default
set nowrap

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
endif

""""""""""""""""""""""""""""""""""""""""
" Leader key bindings
""""""""""""""""""""""""""""""""""""""""

nnoremap <leader><leader> <c-^>
nnoremap <leader>p :FZF<cr>
nnoremap <leader>bd :bd<cr>
nnoremap <leader>l :NERDTreeToggle<CR>
nnoremap <leader>L :NERDTreeFind<CR>

nnoremap <silent> <leader>o :vertical botright Ttoggle<cr>
nnoremap <silent> <leader>O :botright Ttoggle<cr>
nnoremap <silent> <leader><space> :vertical botright Ttoggle<cr>

" Remove search highlight on <esc>
map <silent> <esc> :nohlsearch<cr>

""""""""""""""""""""""""""""""""""""""""
" Autocommands
""""""""""""""""""""""""""""""""""""""""

autocmd FileType gitcommit setlocal textwidth=72
autocmd FileType gitcommit setlocal spell

""""""""""""""""""""""""""""""""""""""""
" Neovim specific
""""""""""""""""""""""""""""""""""""""""
if has('nvim')
    " use neovim-remote (pip3 install neovim-remote) allows
    " opening a new split inside neovim instead of nesting
    " neovim processes for git commit
    let $VISUAL      = 'nvr -cc split --remote-wait +"setlocal bufhidden=delete"'
    let $GIT_EDITOR  = 'nvr -cc split --remote-wait +"setlocal bufhidden=delete"'
    let $EDITOR      = 'nvr -l'

    " Navigate neovim + neovim terminal emulator with alt+direction
    tnoremap <c-h> <C-\><C-n><C-w>h
    tnoremap <c-j> <C-\><C-n><C-w>j
    tnoremap <c-k> <C-\><C-n><C-w>k
    tnoremap <c-l> <C-\><C-n><C-w>l
endif

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
" imap <tab> <Plug>snipMateNextOrTrigger

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
let g:test#stategy = "neoterm"
nnoremap <leader>t :TestFile<CR>
nnoremap <leader>T :TestNearest<CR>

" Neoterm
let g:neoterm_autoscroll = 1
let g:neoterm_autoinsert = 1
nnoremap <leader>T :TestNearest<CR>

" NERDTree
let g:NERDTreeShowHidden = 1
let g:NERDTreeAutoDeleteBuffer=1

" Coc.vim
" Give more space for displaying messages.
set cmdheight=2

" Having longer updatetime (default is 4000 ms = 4 s) leads to noticeable
" delays and poor user experience.
set updatetime=300

" Don't pass messages to |ins-completion-menu|.
set shortmess+=c

" Always show the signcolumn, otherwise it would shift the text each time
" diagnostics appear/become resolved.
set signcolumn=yes

" Use tab for trigger completion with characters ahead and navigate.
" NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
" other plugin before putting this into your config.
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use <c-space> to trigger completion.
inoremap <silent><expr> <c-space> coc#refresh()

" Use <cr> to confirm completion, `<C-g>u` means break undo chain at current
" position. Coc only does snippet and additional edit on confirm.
if exists('*complete_info')
  inoremap <expr> <cr> complete_info()["selected"] != "-1" ? "\<C-y>" : "\<C-g>u\<CR>"
else
  imap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
endif

" Use `[g` and `]g` to navigate diagnostics
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

" GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Use K to show documentation in preview window.
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction

" Highlight the symbol and its references when holding the cursor.
autocmd CursorHold * silent call CocActionAsync('highlight')

" Symbol renaming.
nmap <leader>rn <Plug>(coc-rename)

" Formatting selected code.
xmap <leader>f  <Plug>(coc-format-selected)
nmap <leader>f  <Plug>(coc-format-selected)

augroup mygroup
  autocmd!
  " Setup formatexpr specified filetype(s).
  autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
  " Update signature help on jump placeholder.
  autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
augroup end

" Applying codeAction to the selected region.
" Example: `<leader>aap` for current paragraph
xmap <leader>a  <Plug>(coc-codeaction-selected)
nmap <leader>a  <Plug>(coc-codeaction-selected)

" Remap keys for applying codeAction to the current line.
nmap <leader>ac  <Plug>(coc-codeaction)
" Apply AutoFix to problem on the current line.
nmap <leader>qf  <Plug>(coc-fix-current)

" Introduce function text object
" NOTE: Requires 'textDocument.documentSymbol' support from the language server.
xmap if <Plug>(coc-funcobj-i)
xmap af <Plug>(coc-funcobj-a)
omap if <Plug>(coc-funcobj-i)
omap af <Plug>(coc-funcobj-a)

" Use <TAB> for selections ranges.
" NOTE: Requires 'textDocument/selectionRange' support from the language server.
" coc-tsserver, coc-python are the examples of servers that support it.
nmap <silent> <TAB> <Plug>(coc-range-select)
xmap <silent> <TAB> <Plug>(coc-range-select)

" Add `:Format` command to format current buffer.
command! -nargs=0 Format :call CocAction('format')

" Add `:Fold` command to fold current buffer.
command! -nargs=? Fold :call     CocAction('fold', <f-args>)

" Add `:OR` command for organize imports of the current buffer.
command! -nargs=0 OR   :call     CocAction('runCommand', 'editor.action.organizeImport')

" Add (Neo)Vim's native statusline support.
" NOTE: Please see `:h coc-status` for integrations with external plugins that
" provide custom statusline: lightline.vim, vim-airline.
set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}

" Mappings using CoCList:
" Show all diagnostics.
nnoremap <silent> <space>a  :<C-u>CocList diagnostics<cr>
" Manage extensions.
nnoremap <silent> <space>e  :<C-u>CocList extensions<cr>
" Show commands.
nnoremap <silent> <space>c  :<C-u>CocList commands<cr>
" Find symbol of current document.
nnoremap <silent> <space>o  :<C-u>CocList outline<cr>
" Search workspace symbols.
nnoremap <silent> <space>s  :<C-u>CocList -I symbols<cr>
" Do default action for next item.
nnoremap <silent> <space>j  :<C-u>CocNext<CR>
" Do default action for previous item.
nnoremap <silent> <space>k  :<C-u>CocPrev<CR>
" Resume latest coc list.
nnoremap <silent> <space>p  :<C-u>CocListResume<CR>
