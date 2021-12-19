" Syntax {{{
syntax on
autocmd Syntax * syntax keyword myTodo QUESTION TODO FIXME NOTE NOTES RAY containedin=ALL | highlight def link myTodo TODO
autocmd Syntax * syntax keyword myError ERROR WAITING SCHEDULED containedin=ALL | highlight def link myError ERROR
autocmd Syntax * syntax keyword myUnderlined DONE containedin=ALL | highlight def link myUnderlined String

" }}}

" Required {{{

filetype plugin indent on                 " Required

" }}}

" Set and Let {{{

" Let {{{
let mapleader = " "                       " Leader - ( Space bar )
let maplocalleader = " "                  " LocalLeader - ( Space bar )
let markdown_folding = 1
" }}}

" Set {{{

set autoindent                                           " Copy indent from current line when starting a new line
set autoread
set autowriteall
set backspace=indent,eol,start                           " Make backspace act as it does on other editors
set belloff=all                                          " Turn off all error notifications (both bell and flash)
set cursorline
set directory=$HOME/.vim/swapfiles/                      " Where to save swap files
set foldexpr=nvim_treesitter#foldexpr()
set foldlevelstart=1                                     " Useful to always start editing with all folds closed (value zero), some folds closed (one) or no folds closed (99).
set foldmethod=expr                                      " This is used for vimrc marker, but also for treesitter with the following
set gdefault                                             " Makes global the default for things like :%s/search/replace.  Add a g to negate the global (:%/s/r/g)
set grepprg=LC_ALL=C\ grep\ -nrsH                        " Program to use for the |:grep| command.
set grepprg=ag\ --vimgrep                                " Use ag instead of grep
set hidden                                               " When ON a buffer becomes hidden when it is |abandon|ed.
set hlsearch                                             " When there is a previous search pattern, highlight all its matches.
set ignorecase                                           " The case of normal letters is ignored.
set incsearch                                            " While typing a search command, show where pattern, as it was typed
set lazyredraw                                           " Don't redraw screen while executing macro
set list listchars=tab:\|\ ,trail:·                      " Display tabs as '-' and trailing white space as '.'
set mouse=a                                              " Enable the use of the mouse
set nonumber                                             " No numbers on the left by default
set path& | let &path .= "**"                            " This is a list of directories which will be searched when using the |gf|, [f, ]f, ^Wf, |:find|, |:sfind|, |:tabfind| and other commands,
set scrolloff=20                                         " Minimal number of screen lines to keep above and below the cursor.
set showbreak=↳\                                         " Downwards arrow with tip rightwards (U+21B3, UTF-8: E2 86 B3)
set showcmd                                              " Display incomplete command
set showmatch                                            " When a bracket is inserted, briefly jump to the matching one.
set smartcase                                            " Case insensitive search if your search is all lowercase, sensitive if you use any CAPS.
set spellfile=~/.vim/spell/en.utf-8.add
set splitbelow                                           " Open new split panes to right
set splitright                                           " Open new split panes to the bottom
set tagcase=smart                                        " Smart	Ignore case unless an upper case letter is used
set tags=./tags;,tags;
set timeoutlen=500
set undodir=$HOME/.vim/undo                              " Where to save undo histories (THIS folder MUST be created manually or it doesn't work.  This is great for portability in that it doesn't create the history files unless you specifically create the folder.
set undofile                                             " Save undos after file closes
set wildmenu                                             " When 'wildmenu' is on, command-line completion operates in an enhanced mode
set wildmode=list:longest,full

" Default Tab settings (file specific ones also set in the augroups) {{{{
set tabstop=4                             " Number of spaces that a <Tab> in the file counts for.
set shiftwidth=4                          " This allows you to use the < and > keys from VIM'S visual (marking) mode to block indent/un-indent regions
set expandtab                             " Insert spaces instead of tab
set softtabstop=4                         " Allows backspace to delete the spaces of an expanded tab with one key press
" }}}}

" }}}

" }}}

" Plugins {{{

" The rest {{{
" Install vim-plug if unavailable
" OS specific commands {{{
if empty(glob('~/.vim/autoload/plug.vim'))
    if has("unix")
      " *nix
      " *nix subsets
      silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
        \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
      autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
    else
        " Windows
        iwr -useb https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim | `ni "$(@($env:XDG_DATA_HOME, $env:LOCALAPPDATA)[$null -eq $env:XDG_DATA_HOME])/nvim-data/site/autoload/plug.vim" -Force
    endif
endif
call plug#begin('~/.vim/plugged')

Plug 'Scuilion/markdown-drawer'                              " Simplify navigation in large markdown files.
Plug 'szw/vim-maximizer'                                     " enables maximizing windows with toggle
Plug 'dhruvasagar/vim-table-mode'                            " Tables
Plug 'francoiscabrol/ranger.vim'                             " Ranger integration
Plug 'itchyny/lightline.vim'                                 " Statusbar
Plug 'jkramer/vim-checkbox'                                  " Simple plugin that toggles text checkboxes in Vim. Works great if you're using a markdown file for notes and todo lists.
Plug 'junegunn/goyo.vim'                                     " Distraction-free writing in Vim.
Plug 'junegunn/gv.vim'                                       " A git commit browser.
Plug 'junegunn/limelight.vim'                                " Hyperfocus-writing in Vim.
Plug 'junegunn/vim-peekaboo'                                 " Peekaboo extends \" and @ in normal mode and <CTRL-R> in insert mode so you can see the contents of the registers.
Plug 'liuchengxu/vim-which-key'                              " Vim-which-key is vim port of emacs-which-key that displays available keybindings in popup.
Plug 'liuchengxu/vista.vim'                                  " View and search LSP symbols, tags in Vim/NeoVim.
Plug 'markonm/traces.vim'                                    " Highlights patterns and ranges for Ex commands in Command-line mode.
Plug 'mbbill/undotree'                                       " Visual representation of undo tree
Plug 'mhinz/vim-startify'                                    " Provides a start screen for Vim
Plug 'nanotee/zoxide.vim'
Plug 'pedrohdz/vim-yaml-folds'                               " Very simple folding configuration for YAML, Puppet/Hiera EYAML, RAML and SaltStack SLS files.
Plug 'phenomenes/ansible-snippets'                           " Ansible Vim snippets for SnipMate and UltiSnips. (created from documentation)
Plug 'puremourning/vimspector'                               " A multi language graphical debugger for Vim
Plug 'rbgrouleff/bclose.vim'                                 " Ranger dependency for neovim
Plug 'sheerun/vim-polyglot'                                  " Syntax highlighting for multiple languages
Plug 'tommcdo/vim-lion'                                      " Align based on a character ex :glip(char)
Plug 'tpope/vim-commentary'                                  " Comment out code with gcc
Plug 'tpope/vim-eunuch'                                      " Vim sugar for the UNIX shell commands that need it the most
Plug 'tpope/vim-fugitive'                                    " Adds git functionality to vim ex. :Gdiff
Plug 'tpope/vim-repeat'                                      " Enable repeating supported plugin maps with
Plug 'tpope/vim-scriptease'                                  " A Vim plugin for Vim plugins
Plug 'tpope/vim-speeddating'                                 " Quickly modify dates.
Plug 'tpope/vim-surround'                                    " Provides mappings to easily delete, change and add such surroundings in pairs
Plug 'tpope/vim-unimpaired'                                  " Pairs of handy bracket mappings
Plug 'will133/vim-dirdiff'                                   " Recursively diff on two directories

" Color schemes
Plug 'lifepillar/vim-solarized8'
Plug 'NLKNguyen/papercolor-theme'
Plug 'arcticicestudio/nord-vim'
Plug 'morhetz/gruvbox'
Plug 'romainl/Apprentice', { 'branch': 'fancylines-and-neovim' }
Plug 'romainl/flattened'
Plug 'sickill/vim-monokai'
Plug 'srcery-colors/srcery-vim'


call plug#end() " Required, All of the Plugins must be added before this line
" }}}
" Built in {{{

" Allows jumping between matches like if and end with %
runtime macros/matchit.vim

" }}}
" }}}

" Plugin settings {{{

" Fugitive Conflict Resolution{{{
nnoremap <leader>dw :windo diffthis<cr>
nnoremap <leader>dv :Gvdiffsplit!<cr>
nnoremap <leader>h :diffget //2<cr>
nnoremap <leader>l :diffget //3<cr>
" }}}

" Goyo {{{
nnoremap <leader>G :Goyo<cr>
" }}}

" IndentLine {{{
let g:indentLine_char = '|'
" }}}

" Limelight {{{
" Goyo.vim integration
let g:limelight_conceal_ctermfg = 'gray'
let g:limelight_conceal_ctermfg = 240
autocmd! User GoyoEnter Limelight 
autocmd! User GoyoLeave Limelight!
" }}}

" Markdown Drawer {{{
nnoremap <Leader>md :MarkDrawer<cr>
let g:markdrawer_drawer_max_levels = 4 " max levels to display
let g:markdrawer_toc = 'index' " displays as a TOC
let g:markdrawerDelete = "d"
let g:markdrawer_increase = "="
" }}}

" Markdown Preview {{{

" Options for markdown render
" Mkit: markdown-it options for render
" Katex: katex options for math
" Uml: markdown-it-plantuml options
" Maid: mermaid options
" Disable_sync_scroll: if disable sync scroll, default 0
" Sync_scroll_type: 'middle', 'top' or 'relative', default value is 'middle'
"   middle: mean the cursor position alway show at the middle of the preview page
"   top: mean the vim top viewport alway show at the top of the preview page
"   relative: mean the cursor position alway show at the relative positon of the preview page
" Hide_yaml_meta: if hide yaml metadata, default is 1
" Sequence_diagrams: js-sequence-diagrams options
let g:mkdp_preview_options = {
    \ 'mkit': {},
    \ 'katex': {},
    \ 'uml': {},
    \ 'maid': {},
    \ 'disable_sync_scroll': 0,
    \ 'sync_scroll_type': 'middle',
    \ 'hide_yaml_meta': 1,
    \ 'sequence_diagrams': {},
    \ 'flowchart_diagrams': {}
    \ }


let g:mkdp_markdown_css = '~/.vim/user/splendor.css'
" }}}

" Maximizer {{{
nnoremap <leader>wm :MaximizerToggle<cr>
" }}}

" Netwr {{{
let g:netrw_liststyle      = 3     " Tree View
let g:netrw_winsize        = 80    " Make split 20 (100-80) characters wide
let g:netrw_banner         = 0     " Remove Banner
let g:netrw_altv           = 1     " Open Splits to the right
let g:netrw_fastbrowse     = 2     " Fast browsing (re-use directory buffer listings as often as possible).
let g:netrw_keepdir        = 0     " =0 keep the current directory the same as the browsing directory.
let g:netrw_special_syntax = 1     " Certain files will be shown using special syntax in the browser:

" }}}

" Quickfix-reflector {{{
let g:qf_modifiable = 1
let g:qf_join_changes = 1
let g:qf_write_changes = 1
" }}}

" Startify {{{
let g:startify_bookmarks = [
    \ {'c': '/Users/rsdenni/Repositories/Github/raydennis/dotfiles/editors/vim/coc-settings.json'},
    \ {'tt': '~/Repositories/Azure/Sandia/wnotes/todo.md'},
    \ {'td': '~/Repositories/Azure/Sandia/wnotes/done.md'},
    \ {'p': '~/Repositories/Azure/Sandia/wnotes/people/people.md'},
    \ {'r': '~/Repositories/Github/raydennis/dotfiles/shells/ranger/rc.conf'},
    \ {'rr': '~/Repositories/Github/raydennis/dotfiles/shells/ranger/rifle.conf'},
    \ {'i': '~/Repositories/Azure/Sandia/wnotes/inbox.md'},
    \ {'n': '~/Repositories/Azure/Sandia/wnotes/index.md'},
    \ {'s': '~/Repositories/Github/raydennis/dotfiles/shells/ranger/scope.sh'},
    \ {'ti': '~/Repositories/Github/raydennis/notes/work/trainings/index.md'},
    \ {'v': '~/Repositories/Github/raydennis/dotfiles/editors/vim/.vimrc'},
    \ {'z': '~/Repositories/Github/raydennis/dotfiles/shells/zsh/.zshrc'}
    \ ]
let g:startify_skiplist = [
    \ 'COMMIT_EDITMSG',
    \ escape(fnamemodify(resolve($VIMRUNTIME), ':p'), '\') .'doc',
    \ 'bundle/.*/doc',
    \ '/Dropbox/notes/personal/*',
    \ ]

nnoremap <leader>s :Startify<cr>
nnoremap <leader>ss :SSave<cr>
nnoremap <leader>sl :SLoad<cr>
nnoremap <leader>sd :SDelete<cr>
" }}}

" Surround {{{

" Custom surrounds
let g:surround_{char2nr('b')} = "**\r**"
let g:surround_{char2nr('c')} = "```bash\r```"
let g:surround_{char2nr('g')} = "<font face=\"verdana\" color=\"green\">\r</font>"
let g:surround_{char2nr('l')} = "[link](\r)"
let g:surround_{char2nr('r')} = "<font face=\"verdana\" color=\"red\">\r</font>"
let g:surround_{char2nr('s')} = "snippet\rendsnippet"
let g:surround_{char2nr('u')} = "<li>\r</li>"
let g:surround_{char2nr('y')} = "<font face=\"verdana\" color=\"#CCCC00\">\r</font>"
" }}}

" Tablemode {{{
let g:table_mode_corner = '|'
" }}}

" Terraform {{{
" Allow vim-terraform to align settings automatically with Tabularize.
let g:terraform_align=1
" Allow vim-terraform to automatically fold (hide until unfolded) sections of terraform code. Defaults to 0 which is off.
let g:terraform_fold_sections=1
" Allow vim-terraform to automatically format *.tf and *.tfvars files with terraform fmt. You can also do this manually with the :TerraformFmt command.
let g:terraform_fmt_on_save=1
" }}}

" Undotree {{{
nnoremap <leader>u :UndotreeToggle<cr>
let g:undotree_SetFocusWhenToggle = 1
if !exists('g:undotree_WindowLayout')
    let g:undotree_WindowLayout = 2
endif
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
  \ 'python': 'coc',
  \ 'go': 'coc',
  \ 'javascript': 'coc',
  \ 'javascript.jsx': 'coc',
  \ 'json': 'coc',
  \ 'php': 'coc',
  \ 'ps1': 'coc',
  \ 'tf': 'coc',
  \ 'pandoc': 'markdown',
  \ 'typescript': 'coc'
  \ }

" Keybinding
nnoremap <leader>vi :Vista!! <cr>
nnoremap <leader>vt :Vista toc <cr>

" }}}

" Which-key {{{
noremap <silent> <leader> :WhichKey '<Space>'<cr>
autocmd! FileType which_key
autocmd  FileType which_key set laststatus=0 noshowmode noruler
  \| autocmd BufLeave <buffer> set laststatus=2 showmode ruler
" }}}

" }}}
" }}}

" Color scheme + Lightline {{{

" Lightline {{{
set noshowmode
set laststatus=2

function! CocCurrentFunction()
    return get(b:, 'coc_current_function', '')
endfunction

let g:lightline = {
       \ 'colorscheme': 'PaperColor',
       \ 'active': {
       \   'left': [ [ 'paste' ],
       \             [ 'cocstatus', 'currentfunction', 'gitbranch', 'readonly', 'absolutepath', 'modified' ] ]
       \ },
       \ 'component_function': {
       \   'gitbranch': 'FugitiveHead',
       \   'cocstatus': 'coc#status',
       \   'currentfunction': 'CocCurrentFunction'
       \ },
       \ 'separator': { 'left': "   \ue0b0", 'right': "\ue0b2" },
       \ 'subseparator': { 'left': "\ue0b1", 'right': "\ue0b3" }
       \ }
" }}}

" Apprentice {{{

" " (this is mostly for apprentice, but would apply to others as well)
" " function! MyHighlights() abort

"     " Use the terminal emulator backround color
"     highlight Normal ctermbg=none
"     " Make comments italic
"     highlight Comment cterm=italic

"     " Don't color text on diff.  Make background use emulator dark versions.
"     hi DiffAdd     cterm=none  ctermbg=DARKGREEN   ctermfg=none
"     hi DiffChange  cterm=none  ctermbg=DARKYELLOW  ctermfg=none
"     hi DiffDelete  cterm=none  ctermbg=DARKRED     ctermfg=none
"     hi DiffText    cterm=none  ctermbg=DARKYELLOW  ctermfg=none

" endfunction

" augroup MyColors
"     autocmd!
"     autocmd ColorScheme * call MyHighlights()
" augroup END
" }}}

" Nord https://www.nordtheme.com/ports/vim {{{ 
let g:nord_italic = 1
let g:nord_italic_comments = 1
let g:nord_uniform_diff_background = 1
let g:nord_uniform_status_lines = 1
" }}}

" Papercolor {{{
set background=light
let g:PaperColor_Theme_Options = {
  \   'theme': {
  \     'default': {
  \       'allow_bold': 1,
  \       'allow_italic': 1
  \     }
  \   }
  \ }

" }}}

" Srcry {{{
let g:srcry_italic = 1
let g:srcry_inverse_match_paren = 1
" }}}

" Gruvbox {{{
let g:gruvbox_bold = 1
let g:gruvbox_italic = 1
let g:gruvbox_underline = 1
let g:gruvbox_contrast_dark = 1
let g:gruvbox_improved_strings = 1
let g:gruvbox_improved_warnings = 1
" }}}

" Solarized {{{
let g:solarized_visibility = "high"
let g:solarized_diffmode =  "low"
let g:solarized_termtrans =  1
let g:solarized_extra_hi_groups =  1
" }}}

colorscheme papercolor

" }}}

" Mappings {{{

" Augroups {{{

" Augroup minivmrc {{{
augroup minivimrc
  autocmd!
  " Automatic location/quickfix window
  autocmd QuickFixCmdPost [^l]* cwindow
  autocmd QuickFixCmdPost    l* lwindow
  autocmd QuickFixCmdPost grep cwindow
  autocmd VimEnter            * cwindow

  " Git-specific settings
  autocmd FileType gitcommit nnoremap <buffer> { ?^@@<cr>|nnoremap <buffer> } /^@@<cr>|setlocal iskeyword+=-

  " When editing a file, always jump to the last known cursor position.
  " Don't do it for commit messages, when the position is invalid, or when
  " Inside an event handler (happens when dropping a file on gvim).
  autocmd BufReadPost *
   \ if &ft != 'gitcommit' && line("'\"") > 0 && line("'\"") <= line("$") |
   \   exe "normal g`\"" |
   \ endif

  " Automatically rebalance windows on vim resize
  autocmd VimResized * :wincmd =
augroup END
" }}}

" augroup remember folds [disabled]{{{
"   autocmd!
"   au BufWinLeave ?* mkview 1
"   au BufWinEnter ?* silent! loadview 1
" augroup END
" }}}

" augroup golang{{{
augroup go
    autocmd!
    autocmd FileType go setlocal number
    autocmd FileType go nmap <f9> :DlvToggleBreakpoint<cr>
    autocmd BufWritePre *.go :call CocAction('runCommand', 'editor.action.organizeImport')
    autocmd BufWritePre *.go :silent ! "gofmt -w" % <cr> :e % <cr>
    autocmd FileType go nmap <f5> :DlvTest<cr>
    autocmd FileType go nnoremap <leader>rr :! go run % <cr>
    autocmd FileType go nnoremap <leader>rp :CocCommand go.playground <cr>
augroup END
" }}}

" augroup python {{{
augroup python
    autocmd!
    autocmd FileType python setlocal number
    autocmd FileType python nnoremap <leader>rr :! python3 % <cr>
    autocmd FileType python nnoremap <leader>rt :! python3 -m unittest % <cr>
augroup END
" }}}

" augroup json{{{
augroup json
    autocmd!
    autocmd FileType json setlocal number
augroup END
" }}}

" augroup markdown {{{
augroup markdown
    autocmd!
    autocmd FileType markdown nmap <leader>rr <Plug>MarkdownPreviewToggle
augroup END
" }}}

" augroup powershell {{{
augroup ps1
    autocmd!
    autocmd FileType ps1 setlocal number
    autocmd FileType ps1 nnoremap <leader>rr :CocCommand powershell.execute<cr>
    autocmd FileType ps1 vnoremap <leader>rr :CocCommand powershell.evaluateSelection<cr>
augroup END
" }}}

" augroup terraform {{{
augroup terraform
    autocmd!
    autocmd FileType terraform setlocal number
    autocmd FileType terraform nnoremap <leader>rr :terminal terraform apply<cr>
augroup END
" }}}

" }}}

" Buffers {{{
  nnoremap <BS> :buffer#<CR>
" }}}

" Delete swap files {{{
nnoremap <leader>rms :! rm $HOME/.vim/swapfiles/*
" }}}

" Insert current date {{{
nnoremap <C-d>a a<C-R>=strftime("%Y-%m-%d")<cr><Esc>
tnoremap <C-d>a a<C-R>=strftime("%Y-%m-%d")<cr><Esc>
inoremap <C-d>a <C-R>=strftime("%Y-%m-%d")<cr>
cnoremap <C-d>a <C-R>=strftime("%Y-%m-%d")<cr>
" }}}

" Movement {{{

cnoremap <C-j> <C-g>
cnoremap <C-k> <C-t>
nnoremap H 0
nnoremap L $
" }}}

" Screenshots {{{
nnoremap <leader>xi i![screenshot](./<c-r>%<esc>xxxa/ =400x)<left><left><left><left><left><left><left>
nnoremap <leader>xx :! mkdir -p ./%:r && screencapture -ix %:r/.png<left><left><left><left>
" }}}

" OS specific commands {{{
if has("unix")
  " *nix
  " *nix subsets
  let s:uname = system("uname")
  if s:uname == "Darwin\n"
    " MacOS
    set guifont=MesloLGS-NF-Regular:h26
    set fillchars=fold:\ ,vert:\│,eob:\ ,msgsep:‾
    nnoremap <leader>F :execute 'silent !open . &' \| redraw! <cr>
  else
    " Linux/WSL
  endif
else
    " Windows
    set shell=powershell.exe
    set shellcmdflag=-NoProfile\ -NoLogo\ -NonInteractive\ -Command
    set shellpipe=|
    set shellredir=>
endif

" }}}

" Registers {{{
nnoremap <Leader>y "+y
vnoremap <Leader>y "+y
nnoremap <Leader>p :set paste<cr>"+p:set nopaste<cr>
nnoremap <Leader>P :set paste<cr>"+P:set nopaste<cr>
vnoremap <Leader>p :set paste<cr>"+p:set nopaste<cr>
vnoremap <Leader>P :set paste<cr>"+P:set nopaste<cr>
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
nnoremap <leader>ee :exe getline(line(! + '.'))<cr>
" Run the current line as if it were a command and read it into buffer
nnoremap <leader>er :read !<c-r><c-l><cr>
" }}}

" Search results centered {{{
nnoremap <silent> n nzz
nnoremap <silent> N Nzz
nnoremap <silent> * *zz
nnoremap <silent> # #zz
" }}}

" Search and Replace {{{
:nnoremap <Leader>* :%s/\<<C-r><C-w>\>/
" }}}

" SpaceMacs Org-Mode style agenda bindings {{{
nnoremap <leader>tdd :.s/TODO\\|WAITING\\|SCHEDULED/DONE<cr> ea [d:<C-R>=strftime("%Y-%m-%d")<cr>]<Esc>
nnoremap <leader>tw :.s/TODO\\|SCHEDULED\\|DONE/WAITING<cr> ea [w:<C-R>=strftime("%Y-%m-%d")<cr>]<Esc>
nnoremap <leader>ts :.s/\TODO\\|WAITING\\|DONE\/SCHEDULED<cr> ea [s:<C-R>=strftime("%Y-%m-%d")<cr>]<Esc>
nnoremap <leader>td :.s/- /- TODO /<cr> ea [i:<C-R>=strftime("%Y-%m-%d")<cr>]<Esc>
nnoremap <leader>ot :grep " TODO" *<cr>
nnoremap <leader>ow :grep WAITING *<cr>
nnoremap <leader>od :grep DONE *<cr>
nnoremap <leader>os :grep SCHEDULED *<cr>
" }}}

" Source and reload current file {{{
nnoremap <leader>so :w<cr> :so %<cr>
nnoremap <leader>pi :w<cr> :so %<cr> :PlugInstall<cr>
nnoremap <leader>pu :w<cr> :so %<cr> :PlugUpdate<cr>
nnoremap <leader>pc :w<cr> :so %<cr> :PlugClean<cr>
" }}}

" Spell check for previous misspelled word, accept first choice {{{
inoremap <c-s> <esc>:set spell<cr>[s1z=<c-o>a
nnoremap <c-s> :set spell<cr>[s1z=e
" }}}

" Stop highlight after searching {{{
nnoremap <silent> <leader>, :noh<cr>
" }}}

" Terminal {{{
nnoremap <leader>' :split term://zsh<cr>
nnoremap <leader>v' :vsplit term://zsh<cr>
" To simulate |i_CTRL-R| in terminal-mode: >
tnoremap <expr> <C-\><C-R> '<C-\><C-N>"'.nr2char(getchar()).'pi'
" To map <Esc> to exit terminal-mode: >
tnoremap <C-w> <C-\><C-n>

" Vimgrep add {{{
" search open buffers for word
nnoremap <leader>ba :bufdo vimgmrepadd  %<left><left>

" clear the quickfix list
nnoremap <leader>qc :cexpr [] <cr>
" }}}

" }}}

" Functions {{{

" Function Mkindex() {{{
" This was used to grab all files in an directory and make an index to them in
" a markdown file.  Haven't used this is a long time [2020-03-11].
"     :read !ls
"     :%norm I[
"     :%norm A]()
"     :%norm t]yi]t)p
"     :%norm ^f.dt]
" endfunction
" }}}

" Function Folds {{{
function! MyFoldText() " {{{
    let line = getline(v:foldstart)

    let nucolwidth = &fdc + &number * &numberwidth
    let windowwidth = winwidth(0) - nucolwidth - 3
    let foldedlinecount = v:foldend - v:foldstart

    " expand tabs into spaces
    let onetab = strpart('          ', 0, &tabstop)
    let line = substitute(line, '\t', onetab, 'g')

    let line = strpart(line, 0, windowwidth - 2 -len(foldedlinecount))
    let fillcharcount = windowwidth - len(line) - len(foldedlinecount)
    return line . '…' . repeat(" ",fillcharcount) . foldedlinecount . '…' . ' '
    " return line . ' ⮐  ' . repeat(" ",fillcharcount) . foldedlinecount . ' ⮐  ' . ' '
endfunction " }}}
set foldtext=MyFoldText()
" }}}

hi Folded ctermbg=None ctermfg=Magenta

" }}}

" vim:foldmethod=marker
