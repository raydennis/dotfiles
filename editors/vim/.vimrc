" Set and Let {{{
syntax on
filetype plugin indent on                 " Required

let mapleader = " "                       " Leader - ( Space bar )
let maplocalleader = " "                  " LocalLeader - ( Space bar )
set path& | let &path .= "**"             " This is a list of directories which will be searched when using the |gf|, [f, ]f, ^Wf, |:find|, |:sfind|, |:tabfind| and other commands,

set visualbell                            " Switch from sound on error to flash
set backspace=indent,eol,start            " Make backspace act as it does on other editors
set belloff=all                           " Turn off all error notifications (both bell and flash)
set colorcolumn=80                        " comma separated list of screen columns that are highlighted with ColorColumn
set directory=$HOME/.vim/swapfiles/       " Where to save swap files
set foldlevelstart=0                      " Useful to always start editing with all folds closed (value zero), some folds closed (one) or no folds closed (99).
set gdefault                              " Makes global the default for things like :%s/search/replace.  Add a g to negate the global (:%/s/r/g)
set grepprg=LC_ALL=C\ grep\ -nrsH         " Program to use for the |:grep| command.
set hidden                                " When ON a buffer becomes hidden when it is |abandon|ed.
set hlsearch                              " When there is a previous search pattern, highlight all its matches.
set incsearch                             " While typing a search command, show where pattern, as it was typed
set mouse=a                               " Enable the use of the mouse
set nonumber                              " No numbers on the left by default
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

Plug 'SirVer/ultisnips'                       " Ultimate snippet solution for Vim
Plug 'airblade/vim-gitgutter'                 " Adds signs in the gutter if there are changes to the current workspace
Plug 'dhruvasagar/vim-table-mode'             " Tables
Plug 'francoiscabrol/ranger.vim'              " Ranger integration
Plug 'hashivim/vim-packer'                    " packer
Plug 'hashivim/vim-terraform'                 " This plugin adds a :Terraform command that runs terraform, with tab completion of subcommands
Plug 'liuchengxu/vim-which-key'               " displays available keybindings in popup
Plug 'hashivim/vim-vagrant'                   " vagrant
Plug 'honza/vim-snippets'                     " snippets for ultisnips
Plug 'itchyny/lightline.vim'                  " Bottom bar
Plug 'jkramer/vim-checkbox'                   " Simple plugin that toggles text checkboxes in Vim. Works great if you're using a markdown file for notes and todo lists.
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'                       " Fuzzy finding
Plug 'junegunn/goyo.vim'                      " Distraction-free writing in Vim.
Plug 'junegunn/rainbow_parentheses.vim'       " Rainbow paranteses
Plug 'junegunn/vim-peekaboo'                  " Peekaboo extends " and @ in normal mode and <CTRL-R> in insert mode so you can see the contents of the registers.
Plug 'liuchengxu/vista.vim'                   " View and search LSP symbols, tags in Vim/NeoVim.
Plug 'markonm/traces.vim'                     " This plugin highlights patterns and ranges for Ex commands in Command-line mode.
Plug 'mbbill/undotree'                        " Visual representation of undo tree
Plug 'mhinz/vim-startify'                     " provides a start screen for Vim
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'tommcdo/vim-lion'                       " Align based on a character ex :glip(char)
Plug 'tpope/vim-commentary'                   " Comment out code with gcc
Plug 'tpope/vim-fugitive'                     " Adds git functionality to vim ex. :Gdiff
Plug 'tpope/vim-obsession'                    " continuously updated session files
Plug 'tpope/vim-repeat'                       " enable repeating supported plugin maps with
Plug 'tpope/vim-scriptease'                   " A Vim plugin for Vim plugins
Plug 'tpope/vim-speeddating'                  " Quickly modify dates.
Plug 'tpope/vim-surround'                     " provides mappings to easily delete, change and add such surroundings in pairs
Plug 'tpope/vim-unimpaired'                   " Pairs of handy bracket mappings
Plug 'tpope/vim-eunuch'                       " Vim sugar for the UNIX shell commands that need it the most
Plug 'tpope/vim-vinegar'                      " Netrw wrapper
Plug 'vim-scripts/VisIncr'                    " Allows incrementation of numbers in a line.  Visually select then press :I
Plug 'sheerun/vim-polyglot'                   " Syntax highlighting for multiple languages

" colorschemes
Plug 'flazz/vim-colorschemes'                " All the colorschems!

" coc.plugins {{{
let g:coc_global_extensions = ['coc-phpls', 'coc-docker', 'coc-markdownlint', 'coc-yank', 'coc-git', 'coc-html', 'coc-json', 'coc-prettier', 'coc-python', 'coc-snippets', 'coc-tslint', 'coc-tslint-plugin', 'coc-tsserver', 'coc-eslint', 'coc-powershell']
" }}}

call plug#end() " Required, All of the Plugins must be added before this line

" }}}

" Plugin settings {{{

" Colorscheme {{{
" let solarized_termtrans = 1               " This gets rid of the grey background in solarized.
" colorscheme solarized
colorscheme nord

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

" Use <cr> to confirm completion, `<C-g>u` means break undo chain at current
" position. Coc only does snippet and additional edit on confirm.
if has('patch8.1.1068')
  " Use `complete_info` if your (Neo)Vim version supports it.
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

" Use K to show documentation in preview window
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

augroup cocgroup
  autocmd!
  " Setup formatexpr specified filetype(s).
  autocmd FileType typescript,json,python, setl formatexpr=CocAction('formatSelected')
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

" Use `:Format` to format current buffer
command! -nargs=0 Format :call CocAction('format')
map <leader>A :Format <cr>

" Use `:Fold` to fold current buffer
command! -nargs=? Fold :call     CocAction('fold', <f-args>)

" use `:OR` for organize import of current buffer
command! -nargs=0 OR   :call     CocAction('runCommand', 'editor.action.organizeImport')

command! -nargs=0 Prettier :CocCommand prettier.formatFile

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

" Fugitive Conflict Resolution{{{
nnoremap <leader>gd :Gvdiffsplit!<CR>
nnoremap <leader>h :diffget //2<CR>
nnoremap <leader>l :diffget //3<CR>
" }}}

" Goyo {{{
nnoremap <leader>G :Goyo<cr>
" }}}

" Lightline {{{
set noshowmode
set laststatus=2
let g:lightline = {
      \ 'colorscheme': 'wombat',
      \ 'active': {
      \   'left': [ [ 'mode', 'paste' ],
      \             [ 'cocstatus', 'gitbranch', 'readonly', 'filename', 'modified' ] ]
      \ },
      \ 'component_function': {
      \   'gitbranch': 'FugitiveHead',
      \   'cocstatus': 'coc#status'
      \ },
      \ }
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

" Quickfix-reflector {{{
let g:qf_modifiable = 1
let g:qf_join_changes = 1
let g:qf_write_changes = 1
" }}}

" Startify {{{
let g:startify_bookmarks = [ {'v': '~/Repositories/Github/raydennis/dotfiles/editors/vim/.vimrc'}, {'z': '~/Repositories/Github/raydennis/dotfiles/shells/zsh/.zshrc'}, {'r': '~/Repositories/Github/raydennis/dotfiles/shells/ranger/rc.conf'}, {'d': '~/gitHub/dotfiles/'}, {'c': '/Users/rsdenni/Repositories/Github/raydennis/dotfiles/editors/vim/coc-settings.json'} ]
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

" Terraform {{{
" Allow vim-terraform to align settings automatically with Tabularize.
let g:terraform_align=1
" Allow vim-terraform to automatically fold (hide until unfolded) sections of terraform code. Defaults to 0 which is off.
let g:terraform_fold_sections=1
" Allow vim-terraform to automatically format *.tf and *.tfvars files with terraform fmt. You can also do this manually with the :TerraformFmt command.
let g:terraform_fmt_on_save=1
" }}}

" UltiSnips {{{

if filereadable(expand("~/.vim/plugged/ultisnips/plugin/UltiSnips.vim"))
        let g:UltiSnipsEditSplit = "context"
        " call mkdir($HOME . "~/.vim/UltiSnips", "p")
        let g:UltiSnipsSnippetsDir = "~/.vim/UltiSnips"
    endif

" Set ultisnips triggers
" let g:UltiSnipsExpandTrigger="<tab>"
" let g:UltiSnipsJumpForwardTrigger="<tab>"
" let g:UltiSnipsJumpBackwardTrigger="<s-tab>"

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
  \ 'javascript.jsx': 'coc',
  \ 'json': 'coc',
  \ 'markdown': 'coc',
  \ 'php': 'coc',
  \ 'ps1': 'coc',
  \ 'python': 'coc',
  \ 'tf': 'coc',
  \ 'typescript': 'coc',
  \ }

" Keybinding
nnoremap <leader>vi :Vista!! <cr>
nnoremap <leader>vt :Vista toc <cr>

" }}}

" which-key {{{
nnoremap <silent> <leader> :WhichKey '<Space>'<CR>
" }}}

" }}}

" Mappings {{{

" Augroups {{{
" augroup minivmrc {{{

augroup minivimrc
  autocmd!
  " automatic location/quickfix window
  autocmd QuickFixCmdPost [^l]* cwindow
  autocmd QuickFixCmdPost    l* lwindow
  autocmd QuickFixCmdPost grep cwindow
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

  " allow markdown to syntax highlight inside code blocks.
  autocmd FileType markdown let g:markdown_fenced_languages = ['html', 'python', 'bash=sh']

augroup END
" }}}

" }}}

" Buffers {{{
" Use leader tab to switch between current and last buffer 
nnoremap <silent><leader><tab> :Buffers<cr>
nnoremap <silent><leader><s-tab>  :if &modifiable && !&readonly && &modified <cr> :write<cr> :endif<cr>:bprevious<cr>
tnoremap <silent><leader><tab> :bn<CR>
tnoremap <silent><leader><s-tab> :bp<CR> 

" create a new buffer (save it with :w ./path/to/FILENAME)
nnoremap <leader>be :enew<cr>
" close current buffer
nnoremap <leader>bd :bp <bar> bd! #<cr>
" close all open buffers
nnoremap <leader>bq :bufdo bd!<cr>
" make this the only buffer
nnoremap <leader>bo :only<cr>
" search for open buffer
" nnoremap <leader>bb :Buffers<cr>

" }}}

" Easier beginning and ending of line {{{
nnoremap H ^
vnoremap H ^
nnoremap L $
vnoremap L $
" }}}

" Functions {{{ 
"
" This was used to grab all files in an directory and make an index to them in
" a markdown file.  Haven't used this is a long time [2020-03-11].
" function Mkindex()
"     :read !ls
"     :%norm I[
"     :%norm A]()
"     :%norm t]yi]t)p
"     :%norm ^f.dt]
" endfunction

" }}}

" Insert current date {{{
nnoremap <C-d> a<C-R>=strftime("%Y-%m-%d")<cr><Esc>
tnoremap <C-d> a<C-R>=strftime("%Y-%m-%d")<cr><Esc>
inoremap <C-d> <C-R>=strftime("%Y-%m-%d")<cr>
cnoremap <C-d> <C-R>=strftime("%Y-%m-%d")<cr>
nnoremap <leader>d a<C-R>=strftime("% m/\%d/\%y  ")<cr><Esc>
" }}}

" Move screenshots to current directory {{{
nnoremap <leader>ss :! mv ~/Desktop/Screen* ./
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

" Registers {{{
nnoremap <Leader>p :set paste<cr>"+p:set nopaste<cr>
nnoremap <Leader>y "+y
nnoremap <Leader>d "+d
vnoremap <Leader>y "+y
vnoremap <Leader>d "+d
nnoremap <Leader>p :set paste<cr>"+p:set nopaste<cr>
nnoremap <Leader>P :set paste<cr>"+P:set nopaste<cr>
vnoremap <Leader>p :set paste<cr>"+p:set nopaste<cr>
vnoremap <Leader>P :set paste<cr>"+P:set nopaste<cr>
nnoremap <leader>rp "0p"

" Control [ pastes into terminal
tnoremap <C-]> <C-W>"+
" }}}

" Remote file management {{{
nnoremap <leader>es :e scp://user@127.0.0.1:22//home/
" }}}

" Remove blank lines in current visual selection {{{
vnoremap <leader>rml :v/./d
" }}}

" Resize panes with arrow keys {{{
 nnoremap <silent> <Left> :vertical resize -5<cr>
 nnoremap <silent> <Right> :vertical resize +5<cr>
 nnoremap <silent> <Up> :resize +5<cr>
 nnoremap <silent> <Down> :resize -5<cr>
" }}}

" Run the current line as if it were a command {{{
nnoremap <leader>e :exe getline(line(! + '.'))<cr>
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

" Spell check for previous misspelled word, accept first choice {{{
inoremap <c-z> <esc>:set spell<cr>[s1z=<c-o>a
nnoremap <c-z> :set spell<cr>[s1z=e
" }}}

" Stop highlight after searching {{{
nnoremap <silent> <leader>, :noh<cr>
" }}}

" Terminal {{{
nnoremap <leader>' :terminal<cr>
nnoremap <leader>v' :vertical terminal<cr>
tnoremap <C-]> <C-W>"+
" }}}

" Vimwiki style jump bindings {{{
nnoremap <leader>ww :e ~/Repositories/Azure/Sandia/wnotes/todo.md<cr>:cd %:h<cr>
nnoremap <leader>wd :e ~/Repositories/Azure/Sandia/wnotes/done.md<cr>:cd %:h<cr>
nnoremap <leader>wh :e ~/Repositories/Github/raydennis/notes/personal/home.md<cr>:cd %:h<cr>
" }}}

" Window movement with control + hjkl{{{
map <C-J> <C-W>j
map <C-K> <C-W>k
map <C-H> <C-W>h
map <C-L> <C-W>l
" }}}

" }}}

" vim:foldmethod=marker:foldlevel=0
