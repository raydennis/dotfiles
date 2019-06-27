set nocompatible
syntax on
filetype plugin indent on                 " Required
colorscheme nord

" allows jumping between matches like if and end with %
runtime macros/matchit.vim

let g:netrw_altv          = 1
let g:netrw_fastbrowse    = 2
let g:netrw_keepdir       = 0
let g:netrw_special_syntax= 1

let mapleader = " "                     " Leader - ( Space bar )
let maplocalleader = " "                     " Leader - ( Space bar )
set path& | let &path .= "**"

let &softtabstop = &tabstop
set autoindent
set backspace=indent,eol,start
set complete+=d
set directory^=$HOME/.vim/swapfiles//   " Where to save swap files
set expandtab
set foldlevelstart=0
set grepprg=LC_ALL=C\ grep\ -nrsH
set hidden                              " When ON a buffer becomes hidden when it is |abandon|ed.
set hlsearch                            " When there is a previous search pattern, highlight all its matches.
set incsearch                           " While typing a search command, show where pattern, as it was typed
set scrolloff=20
set mouse=a
set noswapfile
set shiftwidth=4
set showcmd                             " Display incomplete command
set showmatch                           " When a bracket is inserted, briefly jump to the matching one.
set smartcase                           " Case insensitive search if your search is all lowercase, sensitive if you use any CAPS.
set splitbelow                          " Open new split panes to right
set splitright                          " Open new split panes to the bottom
set tabstop=4
set tagcase=smart                       " limit the number of responses we get for case matching
set tags=./tags;,tags;
set undodir=$HOME/.vim/undo             " Where to save undo histories (THIS folder MUST be created manually or it doesn't work.  This is great for portability in that it doesn't create the history files unless you specifically create the folder.
set undofile                            " Save undos after file closes
set visualbell                          " Switch from sound on error to flash
set wildcharm=<C-z>
set wildmenu                            " When 'wildmenu' is on, command-line completion operates in an enhanced mode
set wildmode=list:longest,full

set laststatus=2
set statusline=
set statusline+=%m
set statusline+=[
set statusline+=%{StatuslineMode()}
set statusline+=]
set statusline+=%f
set statusline+=%=
set statusline+=%l
set statusline+=/
set statusline+=%L
set statusline+=[
set statusline+=%c
set statusline+=]

function! StatuslineMode()
  let l:mode=mode()
  if l:mode==#"n"
    return "NORMAL"
  elseif l:mode==?"v"
    return "VISUAL"
  elseif l:mode==#"i"
    return "INSERT"
  elseif l:mode==#"R"
    return "REPLACE"
  elseif l:mode==?"s"
    return "SELECT"
  elseif l:mode==#"t"
    return "TERMINAL"
  elseif l:mode==#"c"
    return "COMMAND"
  elseif l:mode==#"!"
    return "SHELL"
  endif
endfunction

" Fold method based on syntax
autocmd FileType python setlocal foldmethod=indent
autocmd FileType markdown setlocal foldmethod=syntax

" executes file based on type
autocmd FileType python nnoremap <leader>r :!python %:p<cr>
autocmd FileType markdown noremap <leader>r :!open %:p<cr>

" fold region for headings
autocmd FileType markdown syn region mkdHeaderFold
    \ start="^\s*\z(#\+\)"
    \ skip="^\s*\z1#\+"
    \ end="^\(\s*#\)\@="
    \ fold contains=TOP

" fold region for lists
autocmd FileType markdown syn region mkdListFold
    \ start="^\z(\s*\)\*\z(\s*\)"
    \ skip="^\z1 \z2\s*[^#]"
    \ end="^\(.\)\@="
    \ fold contains=TOP

autocmd FileType markdown syn sync fromstart

" easier beginning and ending of line
nnoremap H ^
vnoremap H ^
nnoremap L $
vnoremap L $

" open terminal
nnoremap <leader>' :terminal<cr>

" Use tab to switch between current and last buffer
" nnoremap <silent><leader><tab>  :if &modifiable && !&readonly && &modified <cr> :write<cr> :endif<cr>:bnext<cr>
" nnoremap <silent><leader><s-tab>  :if &modifiable && !&readonly && &modified <cr> :write<cr> :endif<cr>:bprevious<cr>
nnoremap <silent><leader><tab> :bnext<cr>
nnoremap <silent><leader><s-tab> :bprevious<cr>

" create a new buffer (save it with :w ./path/to/FILENAME)
nnoremap <leader>be :enew<cr>
" close current buffer
nnoremap <leader>bd :bp <bar> bd! #<cr>
" close all open buffers
nnoremap <leader>bq :bufdo bd!<cr>

" remove blank lines in current visual selection
vnoremap <leader>rml :v/./d
" Spell check for previous misspelled word, accept first choice.
inoremap <c-z> <esc>[s1z=<c-o>a
nnoremap <c-z> [s1z=e

" Stop highlight after searching
nnoremap <silent> <leader>, :noh<cr>

" change directory to current file's directory
nnoremap <leader>cd :cd %:h<cr>

" Quicker clipboard control
nnoremap <Leader>y "+y
nnoremap <Leader>d "+d
vnoremap <Leader>y "+y
vnoremap <Leader>d "+d
nnoremap <Leader>p :set paste<cr>"+p:set nopaste<cr>
nnoremap <Leader>P :set paste<cr>"+P:set nopaste<cr>
vnoremap <Leader>p :set paste<cr>"+p:set nopaste<cr>
vnoremap <Leader>P :set paste<cr>"+P:set nopaste<cr>

" Insert current date
nnoremap <C-d> a<C-R>=strftime("%Y-%m-%d")<cr><Esc>
tnoremap <C-d> a<C-R>=strftime("%Y-%m-%d")<cr><Esc>
inoremap <C-d> <C-R>=strftime("%Y-%m-%d")<cr>
cnoremap <C-d> <C-R>=strftime("%Y-%m-%d")<cr>
nnoremap <leader>d a<C-R>=strftime("% m/\%d/\%y  ")<cr><Esc>

" Resize panes with arrow keys
nnoremap <silent> <Left> :vertical resize -5<cr>
nnoremap <silent> <Right> :vertical resize +5<cr>
nnoremap <silent> <Up> :resize +5<cr>
nnoremap <silent> <Down> :resize -5<cr>

" SpaceMacs Org-Mode style bindings
nnoremap <leader>dd :.s/TODO\\|WAITING/DONE<cr> ea [d:<C-R>=strftime("%y%m%d")<cr>]<Esc><C-O>
nnoremap <leader>tw :.s/TODO/WAITING<cr> ea [w:<C-R>=strftime("%y%m%d")<cr>]<Esc><C-O>
nnoremap <leader>td :.s/- /- TODO /<cr> ea [i:<C-R>=strftime("%y%m%d")<cr>]<Esc><C-O>
nnoremap <leader>th :.s/- /- HTODO /<cr> ea [i:<C-R>=strftime("%y%m%d")<cr>]<Esc><C-O>
nnoremap <leader>at :grep " TODO" *<cr>
nnoremap <leader>ah :grep HTODO *<cr>
nnoremap <leader>aw :grep WAITING *<cr>
nnoremap <leader>ad :grep DONE *<cr>

" vimwiki style bindings
nnoremap <leader>w1 :e ~/notes/todo.md<cr>:cd %:h<cr>
nnoremap <leader>wd :e ~/notes/done.md<cr>:cd %:h<cr>
nnoremap <leader>w2 :e ~/notes/personal/home.md<cr>:cd %:h<cr>

" Run the current line as if it were a command. Often more convenient than q: when experimenting.
nnoremap <leader>e :exe getline(line('.'))<cr>

" various autocommands
augroup minivimrc
	autocmd!
	" automatic location/quickfix window
	autocmd QuickFixCmdPost [^l]* cwindow
	autocmd QuickFixCmdPost    l* lwindow
	autocmd VimEnter            * cwindow
	" Git-specific settings
	autocmd FileType gitcommit nnoremap <buffer> { ?^@@<cr>|nnoremap <buffer> } /^@@<cr>|setlocal iskeyword+=-
	" When editing a file, always jump to the last known cursor position.
	" Don't do it for commit messages, when the position is invalid, or when
	" inside an event handler (happens when dropping a file on gvim).
	autocmd BufReadPost *
	 \ if &ft != 'gitcommit' && line("'\"") > 0 && line("'\"") <= line("$") |
	 \   exe "normal g`\"" |
	 \ endif
	" Automatically rebalance windows on vim resize
	autocmd VimResized * :wincmd =
augroup END

" augroup remember_folds
"   autocmd!
"   au BufWinLeave ?* mkview 1
"   au BufWinEnter ?* silent! loadview 1
" augroup END

augroup md
  autocmd!
  au BufNewFile,BufRead *.md syntax keyword todo TODO HTODO
  au BufNewFile,BufRead *.md syntax keyword error WAITING
  au BufNewFile,BufRead *.md inoremap <buffer> ;` ```<cr><cr>```<Up><Up>
augroup END

" OS Specific Commands
if has("unix")
  " *nix
  set list listchars=tab:»·,trail:·       " Display tabs as '-' and trailing white space as '.'
  " *nix subsets
  let s:uname = system("uname")
  if s:uname == "Darwin\n"
    " macOS
    set guifont=FiraMonoForPowerline-Regular:h12
  else
    " Linux/WSL
  endif
else
    " Windows
endif

" Start Plugins
set rtp+=~/.vim/bundle/Vundle.vim/        " To install Vundle:  git clone https://github.com/VundleVim/Vundle.vim.git
call vundle#begin()                       " Set the runtime path to include Vundle and initialize
Plugin 'VundleVim/Vundle.vim'             " Let Vundle manage Vundle, required

Plugin 'airblade/vim-gitgutter'             " Adds signs in the gutter if there are changes to the current workspace
Plugin 'ajh17/VimCompletesMe'               " Vim Completes Me! A super simple, super minimal, super light-weight tab completion plugin for Vim.
Plugin 'ap/vim-buftabline'                  " buffer list that lives in the tabline
Plugin 'dhruvasagar/vim-table-mode'         " Tables
Plugin 'easymotion/vim-easymotion'          " Vim motions on speed
Plugin 'jkramer/vim-checkbox'               " Simple plugin that toggles text checkboxes in Vim. Works great if you're using a markdown file for notes and todo lists.
Plugin 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plugin 'junegunn/fzf.vim'                   " Fuzzy finding
Plugin 'junegunn/goyo.vim'                  " Distraction-free writing in Vim.
Plugin 'mbbill/undotree'                    " Visual representation of undo tree
Plugin 'tommcdo/vim-lion'                   " Align based on a character ex : glip(char)
Plugin 'tpope/vim-commentary'               " Comment out code with gcc
Plugin 'tpope/vim-fugitive'                 " Adds git functionality to vim ex. :Gdiff
Plugin 'tpope/vim-surround'                 " provides mappings to easily delete, change and add such surroundings in pairs
Plugin 'tpope/vim-unimpaired'               " provides mappings 
Plugin 'vim-scripts/VisIncr'                " Allows incrementation of numbers in a line.  Visually select then press :I
Plugin 'w0rp/ale'

call vundle#end()                         " Required, All of the Plugins must be added before this line

" Setup FZF
map <leader>g :FZF <cr>

" Insert mode completion
imap <c-x><c-k> <plug>(fzf-complete-word)
imap <c-x><c-f> <plug>(fzf-complete-path)
imap <c-x><c-j> <plug>(fzf-complete-file-ag)
imap <c-x><c-l> <plug>(fzf-complete-line)

" Mapping selecting mappings
nmap <c-x><c-n> <plug>(fzf-maps-n)
xmap <c-x><c-x> <plug>(fzf-maps-x)
omap <c-x><c-o> <plug>(fzf-maps-o)

" Setup Undotree
nnoremap <leader>u :UndotreeToggle<cr>

" Setup netwr
let g:netrw_liststyle=3                   " Tree View
let g:netrw_winsize=80                    " Make split 20 (100-80) characters wide
let g:netrw_banner=0                      " Remove Banner
let g:netrw_altv=1                        " Open Splits to the right
let g:netwr_browse_split=4                " Open in prior window

" Setup ALE
" let g:ale_open_list = 1
let g:ale_fixers = {
\   '*': ['remove_trailing_lines', 'trim_whitespace'],
\   'markdown': ['prettier'],
\   'php': ['phpcbf'],
\   'python': ['autopep8'],
\}
let g:ale_completion_enabled = 1
nnoremap <leader>f :ALEFix<cr>
