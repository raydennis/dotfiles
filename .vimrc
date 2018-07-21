set nocompatible                        " Use Vim settings, rather then Vi settings. This setting must be as early as " possible, as it has side effects.  filetype off                            " required
colorscheme solarized                   " Set default color scheme
set background=dark                     " Choose dark background version of color scheme
let mapleader = " "                     " Leader - ( Space bar )
syntax enable

set autoindent                          " Auto Indent
set autoread                            " Reload files changed outside vim
set autowrite                           " Automatically :write before running commands
set backspace=indent,eol,start          " Make backspace work like other apps
set colorcolumn=100                     " Set a vertical colored line at 100
set directory^=$HOME/.vim/swapfiles//   " Where to save swap files 
set expandtab
set history=50
set hlsearch                            " When there is a previous search pattern, highlight all its matches.
set ignorecase                          " Case insensitive searching (unless specified)
set incsearch                           " While typing a search command, show where the pattern, as it was typed
set laststatus=2                        " Always display the status line
set nowrap     
set shiftwidth=4
set showcmd                             " Display incomplete command
set showmatch                           " Visually see wrap
set smartcase                           " Case insensitive search
set softtabstop=4                       " Number of spaces that a <Tab> counts for while performing editing
set splitbelow                          " Open new split panes to right and bottom, which feels more natural
set splitright                          
set tabstop=4                           " Number of spaces that a <Tab> in the file counts for
set undodir=$HOME/.vim/undo             " Where to save undo histories (THIS folder MUST be created manually or it doesn't work.  This is great for portability in that it doesn't create the history files unless you specifically create the folder.
set undofile                            " Save undos after file closes
set undolevels=1000                     " How many undos
set undoreload=10000                    " Number of lines to save for undo
set visualbell                          " Switch from sound on error to flash
set wildmenu                            " When 'wildmenu' is on, command-line completion operates in an enhanced mode
set wildmode=list:longest,full

" Automatically open, but do not go to (if there are errors) the quick fix /
" location list window, or close it when is has become empty.
"
" Note: Must allow nesting of autocmds to enable any customizations for quick fix
" buffers.
" Note: Normally, :cwindow jumps to the quickfix window if the command opens it
" (but not if it's already open). However, as part of the autocmd, this doesn't
" seem to happen.
autocmd QuickFixCmdPost [^l]* nested cwindow
autocmd QuickFixCmdPost    l* nested lwindow
nnoremap <leader>g :grep -nRi 


" " start scrolling when we're 8 lines away from margins (nice, but makes
" scrolling slower)
" set scrolloff=8
" set sidescrolloff=15
" set sidescroll=1

" Jump to last open file
nmap <Bs> <C-^>

" Leader H automatically finds and replaces in the current document
nnoremap <leader>h :%s/s/r/g

" Spell check for previous misspelled word, accept first choice.
nnoremap <leader>z [s1z=]

" Stop highlight after searching
nnoremap <silent> <leader>, :noh<cr>

" Toggle fold with leader f
noremap <leader>f za


" Trigger autoread when changing buffers or coming back to vim in terminal
au FocusLost,WinLeave * :silent! wa     


" Quicker window movement
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-h> <C-w>h
nnoremap <C-l> <C-w>l

 " Quicker clipboard control
nnoremap <Leader>y "+y
nnoremap <Leader>d "+d
vnoremap <Leader>y "+y
vnoremap <Leader>d "+d 
nnoremap <Leader>p :set paste<CR>"+p:set nopaste<CR>
nnoremap <Leader>P :set paste<CR>"+P:set nopaste<CR>
vnoremap <Leader>p :set paste<CR>"+p:set nopaste<CR>
vnoremap <Leader>P :set paste<CR>"+P:set nopaste<CR>

" Navigate properly when lines are wrapped
nnoremap j gj
nnoremap k gk

" Use tab to jump between blocks
nnoremap <tab> %
vnoremap <tab> %

" Insert current date with leader+d
nmap <leader>dd a<C-R>=strftime("%y%m%d ")<CR><Esc>
nmap <leader>d a<C-R>=strftime("%m/\%d/\%y ")<CR><Esc>

" Resize panes
nnoremap <silent> <Right> :vertical resize +5<cr>
nnoremap <silent> <Left> :vertical resize -5<cr>
nnoremap <silent> <Up> :resize +5<cr>
nnoremap <silent> <Down> :resize -5<cr>
autocmd VimResized * :wincmd = " automatically rebalance windows on vim resize

" OS Specific Commands
if has("unix")
set list listchars=tab:»·,trail:·       " Display tabs as '-' and trailing white space as '.'
  let s:uname = system("uname")
  if s:uname == "Darwin\n"
    " macOS
        "Allow usage of mouse in iTerm
        set ttyfast
        set mouse=a
        set ttymouse=xterm2

        "Alias F5 to open markdown with chrome"
        autocmd BufEnter *.md exe 'noremap <F5> :!open -a "Google Chrome.app" %:p<CR>'
        autocmd BufEnter *.markdown exe 'noremap <F5> :!open -a "Google Chrome.app" %:p<CR>'

        " Vim wiki paths
        let g:vimwiki_list = [{'path':'/Users/raydennis/Tresors/Notes', 'syntax': 'markdown', 'ext': '.markdown'},
        \ {'path':'/Users/raydennis/Tresors/Notes/personal', 'syntax': 'markdown', 'ext': '.markdown'}]

  else 
    " Linux (Ubuntu/WSL UBUNTU)
        autocmd BufEnter *.md exe 'noremap <F5> :! /mnt/c/Program\ Files\ \(x86\)/Google/Chrome/Application/chrome.exe %<CR>'
        autocmd BufEnter *.markdown exe 'noremap <F5> :! /mnt/c/Program\ Files\ \(x86\)/Google/Chrome/Application/chrome.exe %<CR>'

        " Vim wiki paths
        let g:vimwiki_list = [{'path':'/vagrant_data/notes', 'syntax': 'markdown', 'ext': '.markdown'},
        \ {'path':'/vagrant_data/notes/projects', 'syntax': 'markdown', 'ext': '.markdown'},
        \ {'path':'/vagrant_data/notes/personal', 'syntax': 'markdown', 'ext': '.markdown'}]
  endif
else
    " Windows
        autocmd BufEnter *.md exe 'noremap <F5> :! % <CR>'
        autocmd BufEnter *.markdown exe 'noremap <F5> :! % <CR>'

        " Vim wiki paths
        let g:vimwiki_list = [{'path':'~/My Tresors/notes', 'syntax': 'markdown', 'ext': '.markdown'},
        \ {'path':'~/My Tresors/notes/projects', 'syntax': 'markdown', 'ext': '.markdown'},
        \ {'path':'~/My Tresors/notes/personal', 'syntax': 'markdown', 'ext': '.markdown'}]
endif

" When editing a file, always jump to the last known cursor position.
" Don't do it for commit messages, when the position is invalid, or when
" inside an event handler (happens when dropping a file on gvim).
autocmd BufReadPost *
 \ if &ft != 'gitcommit' && line("'\"") > 0 && line("'\"") <= line("$") |
 \   exe "normal g`\"" |
 \ endif

" Start Plugins 
set rtp+=~/.vim/bundle/Vundle.vim/        " To install Vundle:  git clone https://github.com/VundleVim/Vundle.vim.git 
call vundle#begin()                       " Set the runtime path to include Vundle and initialize
Plugin 'VundleVim/Vundle.vim'             " Let Vundle manage Vundle, required

Plugin 'Lokaltog/powerline', {'rtp': 'powerline/bindings/vim/'}
Plugin 'Xuyuanp/nerdtree-git-plugin'      " Adds git status to NerdTree
Plugin 'airblade/vim-gitgutter'           " Adds git functionalist to vim ex: :Gdiff
Plugin 'ajh17/VimCompletesMe'             " Autocompletion
Plugin 'honza/vim-snippets'               " Snippets 
Plugin 'jiangmiao/auto-pairs'             " Autocomplete pairs like '('
Plugin 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plugin 'junegunn/gv.vim'                  " Adds git functionalist to vim ex: :Gdiff
Plugin 'mbbill/undotree'                  " Visual representation of undo tree
Plugin 'scrooloose/nerdtree'              " Graphical file tree
Plugin 'scrooloose/syntastic'             " Syntax
Plugin 'tommcdo/vim-lion'                 " Align based on a character ex: glip(char)
Plugin 'tpope/vim-commentary'             " Comment out code with gcc
Plugin 'tpope/vim-fugitive'               " Adds git functionality to vim ex: :Gdiff
Plugin 'tpope/vim-git'                    " Adds git functionality to vim ex: :Gdiff
Plugin 'tpope/vim-surround'               " Surrounds code with a character ex: ysil(
Plugin 'tpope/vim-unimpaired'             " Surrounds code with a character ex: ysil(
Plugin 'vim-scripts/VisIncr'              " Allows incrementation of numbers in a line.  Visually select then press :I
Plugin 'vimwiki/vimwiki'                  " Gives access to a wiki with #<leader><leader>w

Plugin 'ryanoasis/vim-devicons'           " Adds file glyphs to NerdTree
call vundle#end()                         " Required, All of the Plugins must be added before this line
filetype plugin indent on                 " Required

" Setup NerdTree
map <C-n> :NERDTreeToggle<CR>
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

" Setup Powerline
set laststatus=2
" set term=xterm-256color
set termencoding=utf-8
set encoding=utf-8
let g:Powerline_symbols = 'fancy'

" Setup FZF
map <C-p> :FZF

" Setup Undotree
nnoremap <leader>u :UndotreeToggle<CR>
