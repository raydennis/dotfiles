" set and let {{{
syntax on
filetype plugin indent on                 " Required

" let g:s;larized_termtrans = 1             " This gets rid of the grey background in solarized.
colorscheme nord

let mapleader = " "                       " Leader - ( Space bar )
let maplocalleader = " "                  " LocalLeader - ( Space bar )

set backspace=indent,eol,start            " Make backspace act as it does on other editors
set colorcolumn=80                        " comma separated list of screen columns that are highlighted with ColorColumn
set directory^=$HOME/.vim/swapfiles//     " Where to save swap files
set foldlevelstart=0                      " Useful to always start editing with all folds closed (value zero), some folds closed (one) or no folds closed (99).
set grepprg=LC_ALL=C\ grep\ -nrsH         " Program to use for the |:grep| command.
set hidden                                " When ON a buffer becomes hidden when it is |abandon|ed.
set hlsearch                              " When there is a previous search pattern, highlight all its matches.
set incsearch                             " While typing a search command, show where pattern, as it was typed
set mouse=a                               " Enable the use of the mouse
set path& | let &path .= "**"             " This is a list of directories which will be searched when using the |gf|, [f, ]f, ^Wf, |:find|, |:sfind|, |:tabfind| and other commands,
set scrolloff=20                          " Minimal number of screen lines to keep above and below the cursor.
set showcmd                               " Display incomplete command
set showmatch                             " When a bracket is inserted, briefly jump to the matching one.
set smartcase                             " Case insensitive search if your search is all lowercase, sensitive if you use any CAPS.
set spell                                 " Enable spellcheck
set splitbelow                            " Open new split panes to right
set splitright                            " Open new split panes to the bottom
set tagcase=smart                         " smart	Ignore case unless an upper case letter is used
set tags=./tags;,tags;
set undodir=$HOME/.vim/undo               " Where to save undo histories (THIS folder MUST be created manually or it doesn't work.  This is great for portability in that it doesn't create the history files unless you specifically create the folder.
set undofile                              " Save undos after file closes
set visualbell                            " Switch from sound on error to flash
set wildmenu                              " When 'wildmenu' is on, command-line completion operates in an enhanced mode
set wildmode=list:longest,full
" }}}

" {{{ tab stuff

set tabstop=4                             " Number of spaces that a <Tab> in the file counts for.
set shiftwidth=4                          " This allows you to use the < and > keys from VIM's visual (marking) mode to block indent/unindent regions
set expandtab                             " Insert spaces instead of tab
set softtabstop=4                         " allows backspace to delete the spaces of an expanded tab with one keypress
set autoindent                            " Copy indent from current line when starting a new line

" }}}

" " statusline {{{
" set laststatus=2
" set statusline=
" set statusline+=%m
" set statusline+=%f
" set statusline+=%=
" set statusline+=%l
" set statusline+=/
" set statusline+=%L
" set statusline+=[
" set statusline+=%c
" set statusline+=]
" " }}}

" mappings {{{

" window movement with control + hjkl{{{
map <C-J> <C-W>j
map <C-K> <C-W>k
map <C-H> <C-W>h
map <C-L> <C-W>l
" }}}

" easier beginning and ending of line {{{
nnoremap H ^
vnoremap H ^
nnoremap L $
vnoremap L $
" }}}

" open terminal {{{
nnoremap <leader>' :terminal<cr>
nnoremap <leader>v' :vertical terminal<cr>
" }}}

" buffers {{{
" Use leader tab to switch between current and last buffer 
nnoremap <silent><leader><tab>  :if &modifiable && !&readonly && &modified <cr> :write<cr> :endif<cr>:bnext<cr>
nnoremap <silent><leader><s-tab>  :if &modifiable && !&readonly && &modified <cr> :write<cr> :endif<cr>:bprevious<cr>

" create a new buffer (save it with :w ./path/to/FILENAME)
nnoremap <leader>be :enew<cr>
" close current buffer
nnoremap <leader>bd :bp <bar> bd! #<cr>
" close all open buffers
nnoremap <leader>bq :bufdo bd!<cr>

" }}}

" remove blank lines in current visual selection {{{
vnoremap <leader>rml :v/./d
" }}}

" Spell check for previous misspelled word, accept first choice {{{
inoremap <c-z> <esc>:set spell<cr>[s1z=<c-o>a
nnoremap <c-z> :set spell<cr>[s1z=e
" }}}

" Stop highlight after searching {{{
nnoremap <silent> <leader>, :noh<cr>
" }}}

" change directory to current file's directory {{{
nnoremap <leader>cd :cd %:h<cr>
" }}}

" Quicker clipboard control {{{
nnoremap <Leader>y "+y
nnoremap <Leader>d "+d
vnoremap <Leader>y "+y
vnoremap <Leader>d "+d
nnoremap <Leader>p :set paste<cr>"+p:set nopaste<cr>
nnoremap <Leader>P :set paste<cr>"+P:set nopaste<cr>
vnoremap <Leader>p :set paste<cr>"+p:set nopaste<cr>
vnoremap <Leader>P :set paste<cr>"+P:set nopaste<cr>
" }}}

" Insert current date {{{
nnoremap <C-d> a<C-R>=strftime("%Y-%m-%d")<cr><Esc>
tnoremap <C-d> a<C-R>=strftime("%Y-%m-%d")<cr><Esc>
inoremap <C-d> <C-R>=strftime("%Y-%m-%d")<cr>
cnoremap <C-d> <C-R>=strftime("%Y-%m-%d")<cr>
nnoremap <leader>d a<C-R>=strftime("% m/\%d/\%y  ")<cr><Esc>
" }}}

" Resize panes with arrow keys {{{
nnoremap <silent> <Left> :vertical resize -5<cr>
nnoremap <silent> <Right> :vertical resize +5<cr>
nnoremap <silent> <Up> :resize +5<cr>
nnoremap <silent> <Down> :resize -5<cr>
" }}}

" SpaceMacs Org-Mode style agenda bindings {{{
nnoremap <leader>dd :.s/TODO\\|WAITING\\|SCHEDULED/DONE<cr> ea [d:<C-R>=strftime("%Y-%m-%d")<cr>]<Esc><C-O>
nnoremap <leader>tw :.s/TODO/WAITING<cr> ea [w:<C-R>=strftime("%Y-%m-%d")<cr>]<Esc><C-O>
nnoremap <leader>ts :.s/\(TODO\\|WAITING\)/SCHEDULED<cr> ea [s:<C-R>=strftime("%Y-%m-%d")<cr>]<Esc><C-O>
nnoremap <leader>td :.s/- /- TODO /<cr> ea [i:<C-R>=strftime("%Y-%m-%d")<cr>]<Esc><C-O>
nnoremap <leader>th :.s/- /- HTODO /<cr> ea [i:<C-R>=strftime("%Y-%m-%d")<cr>]<Esc><C-O>
nnoremap <leader>at :grep " TODO" *<cr>
nnoremap <leader>ah :grep HTODO *<cr>
nnoremap <leader>aw :grep WAITING *<cr>
nnoremap <leader>ad :grep DONE *<cr>
nnoremap <leader>as :grep SCHEDULED *<cr>
" }}}

" vimwiki style jump bindings {{{
nnoremap <leader>ww :e ~/notes/work/todo.md<cr>:cd %:h<cr>
nnoremap <leader>wd :e ~/notes/work/done.md<cr>:cd %:h<cr>
nnoremap <leader>wh :e ~/notes/personal/home.md<cr>:cd %:h<cr>
" nnoremap <leader>wm :!mv "~/OneDrive - University of New Mexico/OneDrive - University of New Mexico/Meetings"/
" }}}

" Run the current line as if it were a command {{{
nnoremap <leader>e :exe getline(line('.'))<cr>
" }}}

" }}}

" augroups {{{
" augroup minivmrc {{{

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
" }}}

" augroup remember folds [disabled]{{{

" augroup remember_folds
"   autocmd!
"   au BufWinLeave ?* mkview 1
"   au BufWinEnter ?* silent! loadview 1
" augroup END
" }}}

" augroup python {{{
augroup python
  autocmd FileType python setlocal foldmethod=indent
  autocmd FileType python nnoremap <leader>r :!python %:p<cr>
augroup END
" }}}

" augroup markdown {{{
augroup md
  autocmd!
  au BufNewFile,BufRead *.md syntax keyword todo TODO HTODO SCHEDULED
  au BufNewFile,BufRead *.md syntax keyword error WAITING
  au BufNewFile,BufRead *.md inoremap <buffer> ;` ```<cr><cr>```<Up><Up>

  " Dictionary Completions
  autocmd FileType markdown,txt setlocal complete+=k~/.vim/spell/en.utf-8.add

  " Fold method based on syntax
  autocmd FileType markdown setlocal foldmethod=syntax

  " executes file based on type
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
augroup END
" }}}

" }}}

" os specific commands {{{
if has("unix")
  " *nix
  set list listchars=tab:»·,trail:·       " Display tabs as '-' and trailing white space as '.'
  " *nix subsets
  let s:uname = system("uname")
  if s:uname == "Darwin\n"
    " macOS
    set guifont=FuraCodeNerdFontMono-Regular:h16
  else
    " Linux/WSL
  endif
else
    " Windows
endif

" }}}

" plugins {{{

" allows jumping between matches like if and end with %
runtime macros/matchit.vim

" Install vim-plug if unavailable
if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin('~/.vim/plugged')

Plug 'airblade/vim-gitgutter'                " Adds signs in the gutter if there are changes to the current workspace
Plug 'ajh17/VimCompletesMe'                  " Vim Completes Me! A super simple, super minimal, super light-weight tab completion plugin for Vim.
Plug 'dhruvasagar/vim-table-mode'            " Tables
Plug 'easymotion/vim-easymotion'             " Vim motions on speed
Plug 'francoiscabrol/ranger.vim'             " Ranger integration
Plug 'jkramer/vim-checkbox'                  " Simple plugin that toggles text checkboxes in Vim. Works great if you're using a markdown file for notes and todo lists.
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'                      " Fuzzy finding
Plug 'junegunn/goyo.vim'                     " Distraction-free writing in Vim.
Plug 'markonm/traces.vim'                    " This plugin highlights patterns and ranges for Ex commands in Command-line mode.
Plug 'mbbill/undotree'                       " Visual representation of undo tree
Plug 'mhinz/vim-startify'                    " provides a start screen for Vim
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'tommcdo/vim-lion'                      " Align based on a character ex :glip(char)
Plug 'tpope/vim-commentary'                  " Comment out code with gcc
Plug 'tpope/vim-fugitive'                    " Adds git functionality to vim ex. :Gdiff
Plug 'tpope/vim-obsession'                   " continuously updated session files
Plug 'tpope/vim-repeat'                      " enable repeating supported plugin maps with
Plug 'tpope/vim-surround'                    " provides mappings to easily delete, change and add such surroundings in pairs
Plug 'vim-airline/vim-airline'               " Statusline
Plug 'vim-airline/vim-airline-themes'
Plug 'vim-scripts/VisIncr'                   " Allows incrementation of numbers in a line.  Visually select then press :I
Plug 'w0rp/ale'                              " Asynchronous linting engin
Plug 'liuchengxu/vista.vim'                  " View and search LSP symbols, tags in Vim/NeoVim.


call plug#end() " Required, All of the Plugins must be added before this line

" }}}

" plugin settings {{{

" FZF {{{
map <leader>g :FZF <cr>

let $FZF_DEFAULT_COMMAND = 'ag --hidden --ignore .git -l -g ""'

" Insert mode completion
imap <c-x><c-k> <plug>(fzf-complete-word)
imap <c-x><c-f> <plug>(fzf-complete-path)
imap <c-x><c-j> <plug>(fzf-complete-file-ag)
imap <c-x><c-l> <plug>(fzf-complete-line)

" Mapping selecting mappings
nmap <c-x><c-n> <plug>(fzf-maps-n)
xmap <c-x><c-x> <plug>(fzf-maps-x)
omap <c-x><c-o> <plug>(fzf-maps-o)

" }}}

" Surround {{{

" Custom surrounds
let g:surround_{char2nr('c')} = "```\r```"
let g:surround_{char2nr('g')} = "<font face=\"verdana\" color=\"green\">\r</font>"
let g:surround_{char2nr('r')} = "<font face=\"verdana\" color=\"red\">\r</font>"
let g:surround_{char2nr('y')} = "<font face=\"verdana\" color=\"#CCCC00\">\r</font>"
" }}}

" Undotree {{{
nnoremap <leader>u :UndotreeToggle<cr>
" }}}

" netwr {{{
let g:netrw_liststyle      = 3     " Tree View
let g:netrw_winsize        = 80    " Make split 20 (100-80) characters wide
let g:netrw_banner         = 0     " Remove Banner
let g:netrw_altv           = 1     " Open Splits to the right
let g:netrw_fastbrowse     = 2     " fast browsing (re-use directory buffer listings as often as possible).
let g:netrw_keepdir        = 0     " =0 keep the current directory the same as the browsing directory.
let g:netrw_special_syntax = 1     " certain files will be shown using special syntax in the browser:

" }}}

" ALE {{{
" let g:ale_open_list = 1
let g:ale_fixers = {
\   '*': ['remove_trailing_lines', 'trim_whitespace'],
\   'markdown': ['prettier'],
\   'php': ['phpcbf'],
\   'python': ['autopep8'],
\}
let g:ale_completion_enabled = 1
nnoremap <leader>A :ALEFix<cr>
" }}}

" Goyo {{{
nnoremap <leader>G :Goyo<cr>
" }}}

" Startify {{{
let g:startify_bookmarks = [ {'v': '~/.vimrc'}, {'z': '~/.zshrc'}, {'d': '~/Documents/gitHub/dotfiles/'} ]
" }}}

" Auto-Save {{{
let g:auto_save        = 1
let g:auto_save_silent = 1
let g:auto_save_events = ["InsertLeave", "TextChanged", "FocusLost"]
" }}}

" Airline {{{
let g:airline#extensions#tabline#enabled = 1
let g:airline_powerline_fonts = 1
let g:airline_theme='cool'
" }}}

" Vista {{{
let g:vista#renderer#enable_icon = 1

" The default icons can't be suitable for all the filetypes, you can extend it as you wish.
let g:vista#renderer#icons = {
\ 'augroup': 'פּ',
\ 'autocommand groups': 'פּ',
\ 'class': '',
\ 'classes': '',
\ 'const': '',
\ 'constant': '',
\ 'default': '',
\ 'enum': '',
\ 'enumerator': '',
\ 'field': '',
\ 'fields': '',
\ 'func': '',
\ 'function': '',
\ 'functions': '',
\ 'implementation': '',
\ 'interface': '',
\ 'macro': '',
\ 'macros': '',
\ 'map': 'פּ',
\ 'maps': 'פּ',
\ 'member': '',
\ 'members': '',
\ 'method': '',
\ 'module': '',
\ 'modules': '',
\ 'namespace': '',
\ 'package': '',
\ 'packages': '',
\ 'property': '襁',
\ 'struct': '',
\ 'subroutine': '羚',
\ 'target': '',
\ 'type': '',
\ 'typeParameter': '',
\ 'typedef': '',
\ 'types': '',
\ 'union': '鬒',
\ 'var': '',
\ 'variable': '',
\ 'variables': '',
\  }

let g:vista_icon_indent = ["╰─▸ ", "├─▸ "]

" The elements of g:vista_fzf_preview will be passed as arguments to fzf#vim#with_preview()
let g:vista_fzf_preview = ['right:50%']

let g:vista_executive_for = {
  \ 'javascript': 'coc',
  \ 'typescript': 'coc',
  \ 'javascript.jsx': 'coc',
  \ 'python': 'coc',
  \ 'php': 'coc',
  \ }

" Keybinding
nnoremap <leader>v :Vista show<cr>

" }}}

" vim:foldmethod=marker:foldlevel=0
