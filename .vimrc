set nocompatible                        " Use Vim settings, rather then Vi settings. This setting must be as early as " possible, as it has side effects.  
filetype off                            " required

colorscheme monokai                     " Set default colorscheme
let mapleader = " "                     " Leader - ( Spacebar )

nmap <Bs> <C-^>                         " Jump to last open file
nnoremap <leader>h :%s/s/r/g            " leader H automatically finds and replaces in the current document
nnoremap <leader>z [s1z=`]              " spell check for previous mispelled word, accept first choice.
nnoremap <silent> <leader>, :noh<cr>    " Stop highlight after searching
noremap <leader>f za                    " toggle fold with leader f
set ai                                  " Auto Indent
set autoread                            " Reload files changed outside vim
set autowrite                           " Automatically :write before running commands
set colorcolumn=100                     " set a vertial colored line at 100
set history=50
set hlsearch
set ignorecase                          " case insensitive searching (unless specified)
set incsearch
set laststatus=2                        " Always display the status line
set list listchars=tab:»·,trail:·       " Display tabs as '-' and traling whitespace as '.'
set nowrap                              " Do not wrap lines
set showcmd                             " display incomplete command
set showmatch                           " Visually see wrap
set smartcase                           " Case insensitive search
set smartindent                         " 
set splitbelow                          " Open new split panes to right and bottom, which feels more natural
set splitright
set tabstop=4
set softtabstop=4
set shiftwidth=4
set expandtab
set undodir=$HOME/.vim/undo             " where to save undo histories (THIS folder MUST be created manually or it doesn't work.  This is great for portability in that it doesn't create the history files unless you specifically create the folder.
set undofile                            " Save undos after file closes
set undolevels=1000                     " How many undos
set undoreload=10000                    " number of lines to save for undo
set visualbell                          " switch from sound on error to flashj
set wildmenu
set wildmode=list:longest,full
setlocal number
setlocal relativenumber
syntax enable
vnoremap <C-c>"*y                       " Copy paste to/from clipboard

" THIS COMMENT CANNOT BE APPENDED TO LINE BELOW (CAUSES GHOSTING) Trigger autoread when changing buffers or coming back to vim in terminal
au FocusGained,BufEnter * :silent! !
au FocusLost,WinLeave * :silent! wa     

" Start scrolling when we're 8 lines away from margins
set scrolloff=8
set sidescrolloff=15
set sidescroll=1

" Quicker window movement
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-h> <C-w>h
nnoremap <C-l> <C-w>l

" Navigate properly when lines are wrapped
nnoremap j gj
nnoremap k gk

" Use tab to jump between blocks, because it's easier
nnoremap <tab> %
vnoremap <tab> %

" Insert current date with leader+d
nmap <leader>dd a<C-R>=strftime("%y%m%d ")<CR><Esc>
nmap <leader>d a<C-R>=strftime("%m/\%d/\%y ")<CR><Esc>

" resize panes
nnoremap <silent> <Right> :vertical resize +5<cr>
nnoremap <silent> <Left> :vertical resize -5<cr>
nnoremap <silent> <Up> :resize +5<cr>
nnoremap <silent> <Down> :resize -5<cr>
autocmd VimResized * :wincmd = " automatically rebalance windows on vim resize

" OS Specific Commands
if has("unix")
  let s:uname = system("uname")
  if s:uname == "Darwin\n"
    " Do Mac stuff here
        "Allow usage of mouse in iTerm
        set ttyfast
        set mouse=a
        set ttymouse=xterm2

        "alias F5 to open marddown with chrome"
        autocmd BufEnter *.md exe 'noremap <F5> :!open -a "Google Chrome.app" %:p<CR>'
        autocmd BufEnter *.markdown exe 'noremap <F5> :!open -a "Google Chrome.app" %:p<CR>'

        " Vimwiki paths
        let g:vimwiki_list = [{'path':'/Users/raydennis/Tresors/Notes', 'syntax': 'markdown', 'ext': '.markdown'},
        \ {'path':'/Users/raydennis/Tresors/Notes/personal', 'syntax': 'markdown', 'ext': '.markdown'}]

  else 
    " Do Linux (Ubuntu/WSL UBUNTU) stuff here
        autocmd BufEnter *.md exe 'noremap <F5> :! /mnt/c/Program\ Files\ \(x86\)/Google/Chrome/Application/chrome.exe %<CR>'
        autocmd BufEnter *.markdown exe 'noremap <F5> :! /mnt/c/Program\ Files\ \(x86\)/Google/Chrome/Application/chrome.exe %<CR>'

        " Vimwiki paths
        let g:vimwiki_list = [{'path':'/vagrant_data/notes', 'syntax': 'markdown', 'ext': '.markdown'},
        \ {'path':'/vagrant_data/notes/projects', 'syntax': 'markdown', 'ext': '.markdown'},
        \ {'path':'/vagrant_data/notes/personal', 'syntax': 'markdown', 'ext': '.markdown'}]
  endif
endif

" When editing a file, always jump to the last known cursor position.
" Don't do it for commit messages, when the position is invalid, or when
" inside an event handler (happens when dropping a file on gvim).
autocmd BufReadPost *
 \ if &ft != 'gitcommit' && line("'\"") > 0 && line("'\"") <= line("$") |
 \   exe "normal g`\"" |
 \ endif

" Start Plugins 
set rtp+=~/.vim/bundle/Vundle.vim/      " to install vundle:  git clone https://github.com/VundleVim/Vundle.vim.git 
call vundle#begin()                     " set the runtime path to include Vundle and initialize
Plugin 'VundleVim/Vundle.vim'           " let Vundle manage Vundle, required

Plugin 'Lokaltog/powerline', {'rtp': 'powerline/bindings/vim/'}
Plugin 'StanAngeloff/php.vim'           " Sytax Highlighting for PHP
Plugin 'Xuyuanp/nerdtree-git-plugin'    " Adds git status to nerdtree
Plugin 'airblade/vim-gitgutter'         " Adds git functionalit to vim ex: :Gdiff
Plugin 'ajh17/VimCompletesMe'           " Autocompletion
Plugin 'honza/vim-snippets'             " snippets 
Plugin 'jiangmiao/auto-pairs'           " autocomplete pairs like '('
Plugin 'joonty/vdebug'                  " debugger (must have xdebug installed for php) http://web-techno.net/vim-php-ide/
Plugin 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plugin 'junegunn/gv.vim'                " Adds git functionalit to vim ex: :Gdiff
Plugin 'ludovicchabant/vim-gutentags'   " Creates C-Tags automatically
Plugin 'majutsushi/tagbar'              " Creates a tagbar that shows methods under their class
Plugin 'neomake/neomake'                " Error warnings in your gutter
Plugin 'phpactor/phpactor'              " Autocompletion
Plugin 'easymotion/vim-easymotion'      " Move around faster with <leader><leader>w or b
Plugin 'ryanoasis/vim-devicons'         " Adds file glyps to nerdtree
Plugin 'scrooloose/nerdtree'            " graphical file tree
Plugin 'scrooloose/syntastic'           " sytanx
Plugin 'sjl/gundo.vim'                  " Visual representation of undo tree
Plugin 'stephpy/vim-php-cs-fixer'       " Fixes php sytnax on command or on exit
Plugin 'tmhedberg/matchit'              " Extended % matching for HTML
Plugin 'tommcdo/vim-lion'               " Align based on a character ex: glip(char)
Plugin 'tpope/vim-commentary'           " Comment out code with gcc
Plugin 'tpope/vim-fugitive'             " Adds git functionalit to vim ex: :Gdiff
Plugin 'tpope/vim-git'                  " Adds git functionalit to vim ex: :Gdiff
Plugin 'tpope/vim-surround'             " Surrounds code with a character ex: ysil(
Plugin 'vim-scripts/VisIncr'            " Allows incrementation of numbers in a line.  Visually select then press :I
Plugin 'vimwiki/vimwiki'                " Gives access to a wiki wiht #<leader><leader>w
Plugin 'w0rp/ale'                       " Asynchrounous linting with a variety of languages.  Must specify the compliler

call vundle#end()                       " Required, All of the Plugins must be added before this line
filetype plugin indent on               " required


" Setup NERDTree
map <C-n> :NERDTreeToggle<CR>
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

" Setup vim-table-mode
noremap <leader>tm :TabelModeToggle
noremap <leader>tt g:table_mode_tableize_map
let g:table_mode_corner='|'

" Setup Powerline
set laststatus=2
set term=xterm-256color
set termencoding=utf-8
let g:Powerline_symbols = 'fancy'

" setup FZF
map <C-p> :FZF


" setup Gundo
nnoremap <leader>u :GundoToggle<CR>

