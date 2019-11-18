" Set and Let {{{
syntax on
filetype plugin indent on                 " Required

" let solarized_termtrans = 1               " This gets rid of the grey background in solarized.
" colorscheme solarized

colorscheme nord

let mapleader = " "                       " Leader - ( Space bar )
let maplocalleader = " "                  " LocalLeader - ( Space bar )

" set visualbell                          " Switch from sound on error to flash
set backspace=indent,eol,start            " Make backspace act as it does on other editors
set belloff=all                           " Turn off all error notifications (both bell and flash)
set colorcolumn=80                        " comma separated list of screen columns that are highlighted with ColorColumn
set directory^=$HOME/.vim/swapfiles//     " Where to save swap files
set foldlevelstart=0                      " Useful to always start editing with all folds closed (value zero), some folds closed (one) or no folds closed (99).
set gdefault                              " Makes global the default for things like :%s/search/replace.  Add a g to negate the global (:%/s/r/g)
set grepprg=LC_ALL=C\ grep\ -nrsH         " Program to use for the |:grep| command.
set hidden                                " When ON a buffer becomes hidden when it is |abandon|ed.
set hlsearch                              " When there is a previous search pattern, highlight all its matches.
set incsearch                             " While typing a search command, show where pattern, as it was typed
set mouse=a                               " Enable the use of the mouse
set nonumber                              " No numbers on the left by defualt
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
set timeoutlen=500
set undodir=$HOME/.vim/undo               " Where to save undo histories (THIS folder MUST be created manually or it doesn't work.  This is great for portability in that it doesn't create the history files unless you specifically create the folder.
set undofile                              " Save undos after file closes
set wildmenu                              " When 'wildmenu' is on, command-line completion operates in an enhanced mode
set wildmode=list:longest,full
set grepprg=ag\ --vimgrep                 " use ag instead of grep

" Default Tab settings (file specific ones also set in the augroups) {{{ 
set tabstop=4                             " Number of spaces that a <Tab> in the file counts for.
set shiftwidth=4                          " This allows you to use the < and > keys from VIM's visual (marking) mode to block indent/unindent regions
set expandtab                             " Insert spaces instead of tab
set softtabstop=4                         " allows backspace to delete the spaces of an expanded tab with one keypress
set autoindent                            " Copy indent from current line when starting a new line
" }}}
"
" }}}

" Plugins {{{

" allows jumping between matches like if and end with %
runtime macros/matchit.vim

" Install vim-plug if unavailable
if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin('~/.vim/plugged')

Plug 'SirVer/ultisnips'                      " Ultimate snippet solution for Vim
Plug 'Xuyuanp/nerdtree-git-plugin'                   " A plugin of NERDTree showing git status flags.
Plug 'airblade/vim-gitgutter'                " Adds signs in the gutter if there are changes to the current workspace
Plug 'dense-analysis/ale'                    " linting engine
Plug 'dhruvasagar/vim-table-mode'            " Tables
Plug 'francoiscabrol/ranger.vim'             " Ranger integration
Plug 'honza/vim-snippets'
Plug 'jkramer/vim-checkbox'                  " Simple plugin that toggles text checkboxes in Vim. Works great if you're using a markdown file for notes and todo lists.
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'                      " Fuzzy finding
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'junegunn/goyo.vim'                     " Distraction-free writing in Vim.
Plug 'junegunn/rainbow_parentheses.vim'
Plug 'liuchengxu/vista.vim'                  " View and search LSP symbols, tags in Vim/NeoVim.
Plug 'markonm/traces.vim'                    " This plugin highlights patterns and ranges for Ex commands in Command-line mode.
Plug 'mbbill/undotree'                       " Visual representation of undo tree
Plug 'mhinz/vim-startify'                    " provides a start screen for Vim
Plug 'ryanoasis/vim-devicons'                " Adds file type icons to Vim plugins such as: NERDTree
Plug 'scrooloose/nerdtree'                   " Tree scrooloose/nerdtreeFile Explorer
Plug 'tommcdo/vim-lion'                      " Align based on a character ex :glip(char)
Plug 'tpope/vim-commentary'                  " Comment out code with gcc
Plug 'tpope/vim-fugitive'                    " Adds git functionality to vim ex. :Gdiff
Plug 'tpope/vim-obsession'                   " continuously updated session files
Plug 'tpope/vim-repeat'                      " enable repeating supported plugin maps with
Plug 'tpope/vim-scriptease'                  " A Vim plugin for Vim plugins
Plug 'tpope/vim-speeddating'                 " Quickly modify dates.
Plug 'tpope/vim-surround'                    " provides mappings to easily delete, change and add such surroundings in pairs
Plug 'vim-airline/vim-airline'               " Statusline
Plug 'vim-airline/vim-airline-themes'
Plug 'vim-scripts/VisIncr'                   " Allows incrementation of numbers in a line.  Visually select then press :I
Plug 'stefandtw/quickfix-reflector.vim'      " Change code right in the quickfix window

" coc.plugins {{{
let g:coc_global_extensions = ['coc-phpls', 'coc-docker', 'coc-git', 'coc-html', 'coc-json', 'coc-prettier', 'coc-python', 'coc-snippets']
" }}}

call plug#end() " Required, All of the Plugins must be added before this line

" }}}

" Plugin settings {{{

" Airline {{{
let g:airline#extensions#tabline#enabled = 1
let g:airline_powerline_fonts = 1
let g:airline_theme='base16_nord'
" }}}

" Ale {{{
map <leader>A :ALEFix <cr>
let g:ale_fixers = {
\   'markdown': ['prettier'],
\   'javascript': [
\       'DoSomething',
\       'eslint',
\       {buffer, lines -> filter(lines, 'v:val !=~ ''^\s*//''')},
\   ],
\   'python': ['autopep8'],
\   'php': ['phpcbf'],
\}
" }}}

" Auto-Save {{{
let g:auto_save        = 1
let g:auto_save_silent = 1
let g:auto_save_events = ["InsertLeave", "TextChanged", "FocusLost"]
" }}}

" Coc {{{

" Some servers have issues with backup files, see #649
set nobackup
set nowritebackup

" Better display for messages
set cmdheight=2

" Smaller updatetime for CursorHold & CursorHoldI
set updatetime=300

" don't give |ins-completion-menu| messages.
set shortmess+=c

" always show signcolumns
set signcolumn=yes

" Use tab for trigger completion with characters ahead and navigate.
" Use command ':verbose imap <tab>' to make sure tab is not mapped by other plugin.
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

" Use <cr> to confirm completion, `<C-g>u` means break undo chain at current position.
" Coc only does snippet and additional edit on confirm.
inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"

" Use `[c` and `]c` to navigate diagnostics
nmap <silent> [c <Plug>(coc-diagnostic-prev)
nmap <silent> ]c <Plug>(coc-diagnostic-next)

" Remap keys for gotos
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Use K to show documentation in preview window
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction

" Highlight symbol under cursor on CursorHold
autocmd CursorHold * silent call CocActionAsync('highlight')

" Remap for rename current word
nmap <leader>rn <Plug>(coc-rename)

" Remap for format selected region
xmap <leader>af  <Plug>(coc-format-selected)
nmap <leader>af  <Plug>(coc-format-selected)

augroup mygroup
  autocmd!
  " Setup formatexpr specified filetype(s).
  autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
  " Update signature help on jump placeholder
  autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
augroup end

" Remap for do codeAction of selected region, ex: `<leader>aap` for current paragraph
xmap <leader>a  <Plug>(coc-codeaction-selected)
nmap <leader>a  <Plug>(coc-codeaction-selected)

" Remap for do codeAction of current line
nmap <leader>ac  <Plug>(coc-codeaction)
" Fix autofix problem of current line
nmap <leader>qf  <Plug>(coc-fix-current)

" Use `:Format` to format current buffer
command! -nargs=0 Format :call CocAction('format')

" Use `:Fold` to fold current buffer
command! -nargs=? Fold :call     CocAction('fold', <f-args>)

" use `:OR` for organize import of current buffer
command! -nargs=0 OR   :call     CocAction('runCommand', 'editor.action.organizeImport')

command! -nargs=0 Prettier :CocCommand prettier.formatFile
" }}}

" ColorScheme {{{
" }}}

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

" fuzzy find Vim commands (like Ctrl-Shift-P in Sublime/Atom/VSC)
nmap <c-P> :Commands<cr>
nmap <c-B> :Buffers<cr>

" }}}

" Goyo {{{
nnoremap <leader>G :Goyo<cr>
" }}}

" Nerdtree {{{
nnoremap - :NERDTreeToggle<CR>
" }}}

" Netwr {{{
let g:netrw_liststyle      = 3     " Tree View
let g:netrw_winsize        = 80    " Make split 20 (100-80) characters wide
let g:netrw_banner         = 0     " Remove Banner
let g:netrw_altv           = 1     " Open Splits to the right
let g:netrw_fastbrowse     = 2     " fast browsing (re-use directory buffer listings as often as possible).
let g:netrw_keepdir        = 0     " =0 keep the current directory the same as the browsing directory.
let g:netrw_special_syntax = 1     " certain files will be shown using special syntax in the browser:

" }}}

" Startify {{{
let g:startify_bookmarks = [ {'v': '~/github/dotfiles/editors/vim/.vimrc'}, {'z': '~/github/dotfiles/shells/zsh/.zshrc'}, {'r': '~/github/dotfiles/shells/ranger/rc.conf'}, {'d': '~/gitHub/dotfiles/'} ]
let g:startify_skiplist = [
    \ 'COMMIT_EDITMSG',
    \ escape(fnamemodify(resolve($VIMRUNTIME), ':p'), '\') .'doc',
    \ 'bundle/.*/doc',
    \ '/Dropbox/notes/personal/*',
    \ ]
" }}}

" Surround {{{

" Custom surrounds
let g:surround_{char2nr('c')} = "```\r```"
let g:surround_{char2nr('b')} = "**\r**"
let g:surround_{char2nr('g')} = "<font face=\"verdana\" color=\"green\">\r</font>"
let g:surround_{char2nr('r')} = "<font face=\"verdana\" color=\"red\">\r</font>"
let g:surround_{char2nr('y')} = "<font face=\"verdana\" color=\"#CCCC00\">\r</font>"
" }}}

" UltiSnips {{{

if filereadable(expand("~/.vim/plugged/ultisnips/plugin/UltiSnips.vim"))
        let g:UltiSnipsEditSplit = "context"
        call mkdir($HOME . "/.vim/UltiSnips", "p")
        let g:UltiSnipsSnippetsDir = "~/.vim/UltiSnips"
    endif

" }}}

" Undotree {{{
nnoremap <leader>u :UndotreeToggle<cr>
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
nnoremap <leader>vi :Vista!! <cr>
nnoremap <leader>vt :Vista toc <cr>

" }}}
" }}}

" Mappings {{{

" Window movement with control + hjkl{{{
map <C-J> <C-W>j
map <C-K> <C-W>k
map <C-H> <C-W>h
map <C-L> <C-W>l
" }}}

" Easier beginning and ending of line {{{
nnoremap H ^
vnoremap H ^
nnoremap L $
vnoremap L $
" }}}

" Open terminal {{{
nnoremap <leader>' :terminal<cr>
nnoremap <leader>v' :vertical terminal<cr>
" }}}

" Insert current date {{{
nnoremap <C-d> a<C-R>=strftime("%Y-%m-%d")<cr><Esc>
tnoremap <C-d> a<C-R>=strftime("%Y-%m-%d")<cr><Esc>
inoremap <C-d> <C-R>=strftime("%Y-%m-%d")<cr>
cnoremap <C-d> <C-R>=strftime("%Y-%m-%d")<cr>
nnoremap <leader>d a<C-R>=strftime("% m/\%d/\%y  ")<cr><Esc>
" }}}

" Buffers {{{
" " Use leader tab to switch between current and last buffer 
" nnoremap <silent><leader><tab>  :if &modifiable && !&readonly && &modified <cr> :write<cr> :endif<cr>:bnext<cr>
" nnoremap <silent><leader><s-tab>  :if &modifiable && !&readonly && &modified <cr> :write<cr> :endif<cr>:bprevious<cr>

" " create a new buffer (save it with :w ./path/to/FILENAME)
" nnoremap <leader>be :enew<cr>
" " close current buffer
" nnoremap <leader>bd :bp <bar> bd! #<cr>
" " close all open buffers
" nnoremap <leader>bq :bufdo bd!<cr>
" " search for open buffer
" nnoremap <leader>b :Buffers<cr>

" }}}

" Remove blank lines in current visual selection {{{
vnoremap <leader>rml :v/./d
" }}}

" Spell check for previous misspelled word, accept first choice {{{
inoremap <c-z> <esc>:set spell<cr>[s1z=<c-o>a
nnoremap <c-z> :set spell<cr>[s1z=e
" }}}

" Stop highlight after searching {{{
nnoremap <silent> <leader>, :noh<cr>
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

" Vimwiki style jump bindings {{{
nnoremap <leader>ww :e ~/notes/work/todo.md<cr>:cd %:h<cr>
nnoremap <leader>wd :e ~/notes/work/done.md<cr>:cd %:h<cr>
nnoremap <leader>wt :cd ~/notes/personal/daily<cr> :RangerWorkingDirectory<cr>
nnoremap <leader>wh :e ~/notes/personal/home.md<cr>:cd %:h<cr>
" nnoremap <leader>wm :!mv "~/OneDrive - University of New Mexico/OneDrive - University of New Mexico/Meetings"/
" }}}

" Run the current line as if it were a command {{{
nnoremap <leader>e :exe getline(line(! + '.'))<cr>
" }}}

" }}}

" Augroups {{{
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
    autocmd FileType python setlocal number
    autocmd FileType python setlocal foldmethod=indent
    autocmd FileType python nnoremap <leader>r :CocCommand python.execInTerminal<cr>
    autocmd FileType python vnoremap <leader>r :CocCommand python.execSelectionInTerminal<cr>
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

  " indentation for markdown files 
  autocmd FileType markdown setlocal shiftwidth=2
  autocmd FileType markdown setlocal tabstop=2

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

" OS specific commands {{{
if has("unix")
  " *nix
  set list listchars=tab:»·,trail:·       " Display tabs as '-' and trailing white space as '.'
  " *nix subsets
  let s:uname = system("uname")
  if s:uname == "Darwin\n"
    " macOS
    set guifont=FuraCodeNerdFontComplete-Regular:h18
    nnoremap <leader>F :execute 'silent !open . &' \| redraw! <cr>
  else
    " Linux/WSL
  endif
else
    " Windows
endif

" }}}

" vim:foldmethod=marker:foldlevel=0
