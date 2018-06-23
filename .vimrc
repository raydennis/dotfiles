" Type :so % to refresh .vimrc after making changes 
" Use Vim settings, rather then Vi settings. This setting must be as early as " possible, as it has side effects.  
set nocompatible

" Set default colorscheme
syntax enable
set background=dark
colorscheme monokai
set termguicolors

" Leader - ( Spacebar )
let mapleader = " "

set history=50
set showcmd       " display incomplete command
set laststatus=2  " Always display the status line
set autowrite     " Automatically :write before running commands
set autoread      " Reload files changed outside vim
set undofile                " Save undos after file closes
set undodir=$HOME/.vim/.undo " where to save undo histories (THIS folder MUST be created manually or it doesn't work.  This is great for portability in that it doesn't create the history files unless you specifically create the folder.
set undolevels=1000         " How many undos
set undoreload=10000        " number of lines to save for undo
set ttyfast "Allow usage of mouse in iTerm
set mouse=a "Allow usage of mouse in iTerm
set foldlevel=2
noremap <leader>f za " toggle fold with leader f

" Trigger autoread when changing buffers or coming back to vim in terminal.
au FocusGained,BufEnter * :silent! !

"Set default font in mac vim and gvim
set guifont=Droid\ Sans\ Mono\ for\ Powerline:h24

set visualbell    " stop that ANNOYING beeping
set wildmenu
set wildmode=list:longest,full

"Allow usage of mouse in iTerm
set ttyfast
set mouse=a
" set ttymouse=xterm2

" Make searching better
set gdefault      " Never have to type /g at the end of search / replace again
set ignorecase    " case insensitive searching (unless specified)
set smartcase
set hlsearch
set incsearch
set showmatch
nnoremap <silent> <leader>, :noh<cr> " Stop highlight after searching

" Display extra whitespace
set list listchars=tab:»·,trail:·,nbsp:·

" jump to last open file
nmap <Bs> <C-^>

" Open new split panes to right and bottom, which feels more natural
set splitbelow
set splitright

" Auto resize Vim splits to active split
set winwidth=104
set winheight=5
set winminheight=5
set winheight=999

" ================ Scrolling ========================
set scrolloff=8         "Start scrolling when we're 8 lines away from margins
set sidescrolloff=15
set sidescroll=1

"Toggle relative numbering, and set to absolute on loss of focus or insert mode
set rnu
function! ToggleNumbersOn()
    set nu!
    set rnu
endfunction
function! ToggleRelativeOn()
    set rnu!
    set nu
endfunction
autocmd FocusLost * call ToggleRelativeOn()
autocmd FocusGained * call ToggleRelativeOn()
autocmd InsertEnter * call ToggleRelativeOn()
autocmd InsertLeave * call ToggleRelativeOn()

"Use enter to create new lines w/o entering insert mode
nnoremap <CR> o<Esc>
"Below is to fix issues with the ABOVE mappings in quickfix window
autocmd CmdwinEnter * nnoremap <CR> <CR>
autocmd BufReadPost quickfix nnoremap <CR> <CR>

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

" Always use vertical diffs
set diffopt+=vertical

"system clipboard copy & paste support
"Copy paste to/from clipboard
vnoremap <C-c> "*y
"Use system clipboard by default
set clipboard+=unnamed


""" MORE AWESOME HOTKEYS
"spell check for previous mispelled word, accept first choice.
nnoremap <leader>z [s1z=`]

" resize panes
nnoremap <silent> <Right> :vertical resize +5<cr>
nnoremap <silent> <Left> :vertical resize -5<cr>
nnoremap <silent> <Up> :resize +5<cr>
nnoremap <silent> <Down> :resize -5<cr>

" leader H automatically finds and replaces in the current document
nnoremap <leader>h :%s/s/r/g

" Save whenever switching windows or leaving vim. This is useful when running
" the tests inside vim without having to save all files first.
au FocusLost,WinLeave * :silent! wa

" automatically rebalance windows on vim resize
autocmd VimResized * :wincmd =


"alias F5 to open marddown with chrome"
if has("unix")
  let s:uname = system("uname")
  if s:uname == "Darwin\n"
    " Do Mac stuff here
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
    let g:vimwiki_list = [{'path':'/mnt/c/Users/Ray/Tresors/notes', 'syntax': 'markdown', 'ext': '.markdown'},
    \ {'path':'/mnt/c/Users/Ray/Tresors/notes/projects', 'syntax': 'markdown', 'ext': '.markdown'},
    \ {'path':'/mnt/c/Users/Ray/Tresors/notes/personal', 'syntax': 'markdown', 'ext': '.markdown'}]

  endif
endif

" Additional vim-unimpaired style commands
noremap [oy :syntax on<CR>
noremap ]oy :syntax off<CR>

" When editing a file, always jump to the last known cursor position.
" Don't do it for commit messages, when the position is invalid, or when
" inside an event handler (happens when dropping a file on gvim).
autocmd BufReadPost *
 \ if &ft != 'gitcommit' && line("'\"") > 0 && line("'\"") <= line("$") |
 \   exe "normal g`\"" |
 \ endif

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
set guifont=Ubuntu\ Mono\ derivative\ Powerline:10
let g:Powerline_symbols = 'fancy'

" setup FZF
map <C-p> :FZF

" set the runtime path to include Vundle and initialize
" take from: git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
set rtp+=~/.vim/bundle/Vundle.vim/
call vundle#begin()

" alternatively, pass a path where Vundle should install plugins
" call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

" Add all your plugins here (note older versions of Vundle used Bundle instead of Plugin)
Plugin 'AndrewRadev/splitjoin.vim'
Plugin 'Lokaltog/powerline', {'rtp': 'powerline/bindings/vim/'}
Plugin 'Xuyuanp/nerdtree-git-plugin'
Plugin 'davidhalter/jedi-vim'
Plugin 'dhruvasagar/vim-table-mode'
Plugin 'easymotion/vim-easymotion'
Plugin 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plugin 'scrooloose/nerdtree'
Plugin 'tpope/vim-commentary'
Plugin 'tpope/vim-fugitive'
Plugin 'tpope/vim-sleuth'
Plugin 'tpope/vim-surround'
Plugin 'tpope/vim-unimpaired'
Plugin 'vim-scripts/VisIncr'
Plugin 'vimwiki/vimwiki'
Plugin 'w0rp/ale'

" All of your Plugins must be added before the following line
call vundle#end()            " required
