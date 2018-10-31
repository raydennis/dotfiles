" filetype support
filetype plugin indent on
syntax on
colorscheme molokai 
set background=dark

" allows jumping between maches like if and end with %
runtime macros/matchit.vim

" various settings
let &softtabstop = &tabstop
let mapleader = " "                     " Leader - ( Space bar )
set autoindent
set backspace=indent,eol,start
set complete+=d
set directory^=$HOME/.vim/swapfiles//   " Where to save swap files
set foldlevelstart=999
set foldmethod=indent
set grepprg=LC_ALL=C\ grep\ -nrsH
set hidden                              " When ON a buffer becomes hidden when it is |abandon|ed. 
set hlsearch                            " When there is a previous search pattern, highlight all its matches.
set ignorecase                          " Case insensitive searching (unless specified)
set incsearch                           " While typing a search command, show where the pattern, as it was typed
set mouse=a
set noswapfile
set path& | let &path .= "**"
set showcmd                             " Display incomplete command
set showmatch                           " Visually see wrap
set showmatch                           " Visually see wrap
set smartcase                           " Case insensitive search
set splitbelow                          " Open new split panes to right
set splitright                          " Open new split panes to the bottom
set tags=./tags;,tags;
set tagcase=smart                       " limit the number of responses we get for case matching 
set undodir=$HOME/.vim/undo             " Where to save undo histories (THIS folder MUST be created manually or it doesn't work.  This is great for portability in that it doesn't create the history files unless you specifically create the folder.
set undofile                            " Save undos after file closes
set visualbell                          " Switch from sound on error to flash
set wildcharm=<C-z>
set wildmenu                            " When 'wildmenu' is on, command-line completion operates in an enhanced mode
set wildmode=list,longest,full

" Spell check for previous misspelled word, accept first choice.
nnoremap <leader>z [s1z=]

" Stop highlight after searching
nnoremap <silent> <leader>, :noh<cr>

" change directory to current file's directory
nnoremap <leader>cd :cd %:h<cr>

" Quicker clipboard control
nnoremap <Leader>y "+y
nnoremap <Leader>d "+d
vnoremap <Leader>y "+y
vnoremap <Leader>d "+d 
nnoremap <Leader>p :set paste<CR>"+p:set nopaste<CR>
nnoremap <Leader>P :set paste<CR>"+P:set nopaste<CR>
vnoremap <Leader>p :set paste<CR>"+p:set nopaste<CR>
vnoremap <Leader>P :set paste<CR>"+P:set nopaste<CR>

" Insert current date with leader+d
 nnoremap <leader>dd a<C-R>=strftime("%y%m%d ")<CR><Esc>
 nnoremap <leader>d a<C-R>=strftime("%m/\%d/\%y ")<CR><Esc>

" Resize panes with arrow keys
nnoremap <silent> <Right> :vertical resize +5<cr>
nnoremap <silent> <Left> :vertical resize -5<cr>
nnoremap <silent> <Up> :resize +5<cr>
nnoremap <silent> <Down> :resize -5<cr>

" various autocommands
augroup minivimrc
	autocmd!
	" automatic location/quickfix window
	autocmd QuickFixCmdPost [^l]* cwindow
	autocmd QuickFixCmdPost    l* lwindow
	autocmd VimEnter            * cwindow
	" Git-specific settings
	autocmd FileType gitcommit nnoremap <buffer> { ?^@@<CR>|nnoremap <buffer> } /^@@<CR>|setlocal iskeyword+=-
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

" OS Specific Commands
if has("unix")
  " *nix
  set list listchars=tab:»·,trail:·       " Display tabs as '-' and trailing white space as '.'
  " *nix subsets
  let s:uname = system("uname")
  if s:uname == "Darwin\n"
    " macOS
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

Plugin 'Lokaltog/powerline', {'rtp': 'powerline/bindings/vim/'}
Plugin 'airblade/vim-gitgutter'           " Adds signs in the gutter if there are changes to the current workspace 
Plugin 'ajh17/VimCompletesMe'             " Tries to guess which completion you want 
Plugin 'jiangmiao/auto-pairs'             " Autocomplete pairs like '('
Plugin 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plugin 'junegunn/fzf.vim'                 " Fuzzy finding 
Plugin 'mbbill/undotree'                  " Visual representation of undo tree
Plugin 'scrooloose/syntastic'             " Syntax
Plugin 'tommcdo/vim-lion'                 " Align based on a character ex: glip(char)
Plugin 'tpope/vim-commentary'             " Comment out code with gcc
Plugin 'tpope/vim-fugitive'               " Adds git functionality to vim ex: :Gdiff
Plugin 'tpope/vim-git'                    " Adds git functionality to vim ex: :Gdiff
Plugin 'tpope/vim-surround'               " Surrounds code with a character ex: ysil(
Plugin 'tpope/vim-unimpaired'             " Provides useful mappings like 'yos' for setlocal spell
Plugin 'vim-scripts/VisIncr'              " Allows incrementation of numbers in a line.  Visually select then press :I
Plugin 'vimwiki/vimwiki'                  " Gives access to a wiki with #<leader><leader>w

call vundle#end()                         " Required, All of the Plugins must be added before this line
filetype plugin indent on                 " Required

" Setup Powerline
set laststatus=2
" set term=xterm-256color
set termencoding=utf-8
set encoding=utf-8
let g:Powerline_symbols = 'fancy'

" Setup FZF
map <C-p> :FZF
" Mapping selecting mappings
nmap <leader><tab> <plug>(fzf-maps-n)
xmap <leader><tab> <plug>(fzf-maps-x)
omap <leader><tab> <plug>(fzf-maps-o)
" Insert mode completion
imap <c-x><c-k> <plug>(fzf-complete-word)
imap <c-x><c-f> <plug>(fzf-complete-path)
imap <c-x><c-j> <plug>(fzf-complete-file-ag)
imap <c-x><c-l> <plug>(fzf-complete-line)

" Setup Undotree
nnoremap <leader>u :UndotreeToggle<CR>

" Setup vimwiki
let g:vimwiki_list = [{'path':'~/Dropbox/Notes', 'syntax': 'markdown', 'ext': '.markdown'},
\ {'path':'~/Dropbox/Notes/personal', 'syntax': 'markdown', 'ext': '.markdown'}]
