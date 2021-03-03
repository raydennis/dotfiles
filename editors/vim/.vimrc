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
set cursorline
set backspace=indent,eol,start                           " Make backspace act as it does on other editors
set belloff=all                                          " Turn off all error notifications (both bell and flash)
set directory=$HOME/.vim/swapfiles/                      " Where to save swap files
set fillchars=fold:\ ,vert:\│,eob:\ ,msgsep:‾
set foldlevelstart=0                                     " Useful to always start editing with all folds closed (value zero), some folds closed (one) or no folds closed (99).
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
set foldmethod=expr                                      " This is used for vimrc marker, but also for treesitter with the following
set foldexpr=nvim_treesitter#foldexpr()

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
if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin('~/.vim/plugged')

" Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' } " Adds Go language support for Vim (no needed with coc-go and treesitter)
Plug 'SirVer/ultisnips'                                      " Ultimate snippet solution for Vim
Plug 'dhruvasagar/vim-table-mode'                            " Tables
Plug 'francoiscabrol/ranger.vim'                             " Ranger integration
Plug 'honza/vim-snippets'                                    " Snippets for UltiSnips
Plug 'iamcco/markdown-preview.nvim', { 'do': { -> mkdp#util#install() }, 'for': ['markdown', 'vim-plug']}
Plug 'itchyny/lightline.vim'                                 " Statusbar
Plug 'jkramer/vim-checkbox'                                  " Simple plugin that toggles text checkboxes in Vim. Works great if you're using a markdown file for notes and todo lists.
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'                                      " Fuzzy finding
Plug 'yuki-ycino/fzf-preview.vim'                            " provides collection of features to assist file management using fzf
Plug 'junegunn/goyo.vim'                                     " Distraction-free writing in Vim.
Plug 'junegunn/gv.vim'                                       " A git commit browser.
Plug 'junegunn/limelight.vim'                                " Hyperfocus-writing in Vim.
Plug 'junegunn/vim-peekaboo'                                 " Peekaboo extends \" and @ in normal mode and <CTRL-R> in insert mode so you can see the contents of the registers.
Plug 'liuchengxu/vim-which-key'                              " Vim-which-key is vim port of emacs-which-key that displays available keybindings in popup.
Plug 'liuchengxu/vista.vim'                                  " View and search LSP symbols, tags in Vim/NeoVim.
Plug 'markonm/traces.vim'                                    " Highlights patterns and ranges for Ex commands in Command-line mode.
Plug 'mbbill/undotree'                                       " Visual representation of undo tree
Plug 'mhinz/vim-startify'                                    " Provides a start screen for Vim
Plug 'neoclide/coc.nvim', {'branch': 'release'}              " Make your Vim/Neovim as smart as VSCode.
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}  " The goal of nvim-treesitter is both to provide a simple and easy way to use the interface for tree-sitter in Neovim and to provide some basic functionality such as highlighting based on it:
Plug 'phenomenes/ansible-snippets'                           " Ansible Vim snippets for SnipMate and UltiSnips. (created from documentation)
Plug 'rbgrouleff/bclose.vim'                                 " Ranger dependency for neovim
Plug 'sebdah/vim-delve'
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
" Plug 'vim-pandoc/vim-pandoc'                                 " Vim-pandoc provides facilities to integrate Vim with the pandoc document converter and work with documents written in its markdown variant (although textile documents are also supported).
" Plug 'vim-pandoc/vim-pandoc-syntax'                          " Needed for the sytnax highlighting
Plug 'will133/vim-dirdiff'                                   " Recursively diff on two directories
Plug 'yuki-ycino/fzf-preview.vim'                            " provides collection of features to assist file management using fzf

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
" COC {{{

let g:coc_global_extensions = [
            \ 'coc-docker',
            \ 'coc-eslint',
            \ 'coc-explorer',
            \ 'coc-fzf-preview',
            \ 'coc-git',
            \ 'coc-go',
            \ 'coc-gocode',
            \ 'coc-highlight',
            \ 'coc-html',
            \ 'coc-json',
            \ 'coc-markdownlint',
            \ 'coc-marketplace',
            \ 'coc-pairs',
            \ 'coc-phpls',
            \ 'coc-powershell',
            \ 'coc-prettier',
            \ 'coc-pyright',
            \ 'coc-ultisnips',
            \ 'coc-tslint-plugin',
            \ 'coc-tsserver',
            \ 'coc-yaml',
            \ 'coc-yank'
            \ ]


" }}}
" Built in {{{

" Allows jumping between matches like if and end with %
runtime macros/matchit.vim

" }}}
" }}}

" Plugin settings {{{

" Coc {{{

" Coc-Explorer {{{

nmap - :CocCommand explorer<cr>

" }}}

" Coc-fzf-preview {{{
nmap <Leader><space> :CocCommand fzf-preview.DirectoryFiles<cr>
xmap <Leader><space> :CocCommand fzf-preview.DirectoryFiles<cr>

nnoremap <Leader><tab>    :CocCommand fzf-preview.AllBuffers<cr>
nnoremap <Leader>g :CocCommand fzf-preview.FromResources project_mru git<cr>
" }}}

nnoremap <leader>cc :CocCommand

" Some servers have issues with backup files, see #649
set nobackup
set nowritebackup

" Better display for messages
set cmdheight=2

" Smaller updatetime for CursorHold & CursorHoldI
set updatetime=300

" Don't give |ins-completion-menu| messages.
set shortmess+=c

" Always show signcolumns
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
" Position. Coc only does snippet and additional edit on confirm.
if has('patch8.1.1068')
  " Use `complete_info` if your (Neo)Vim version supports it.
  inoremap <expr> <cr> complete_info()["selected"] != "-1" ? "\<C-y>" : "\<C-g>u\<cr>"
else
  imap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<cr>"
endif

" Use `[g` and `]g` to navigate diagnostics
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)
nmap <leader>; <Plug>(coc-diagnostic-info)

" GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Use K to show documentation in preview window
nnoremap <silent> K :call <SID>show_documentation()<cr>

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

augroup cocgroup
  autocmd!
  " Setup formatexpr specified filetype(s).
  autocmd FileType typescript,json,python setl formatexpr=CocAction('formatSelected')
  " Update signature help on jump placeholder
  autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
augroup end

" Remap for do codeAction of selected region, ex: `<leader>aap` for current paragraph
xmap <leader>A  <Plug>(coc-codeaction-selected)
nmap <leader>A  <Plug>(coc-codeaction-selected)

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
" Coc-tsserver, coc-python are the examples of servers that support it.
nmap <silent> <TAB> <Plug>(coc-range-select)
xmap <silent> <TAB> <Plug>(coc-range-select)

" Use `:Format` to format current buffer
command! -nargs=0 Format :call CocAction('format')
map <leader>A :Format <cr>

" Use `:Fold` to fold current buffer
command! -nargs=? Fold :call     CocAction('fold', <f-args>)

" Use `:OR` for organize import of current buffer
command! -nargs=0 OR   :call     CocAction('runCommand', 'editor.action.organizeImport')

command! -nargs=0 Prettier :CocCommand prettier.formatFile

" Mappings using CoCList:
" Show all diagnostics.
nnoremap <silent> ;a  :<C-u>CocList diagnostics<cr>
" Manage extensions.
nnoremap <silent> ;e  :<C-u>CocList extensions<cr>
" Show commands.
nnoremap <silent> ;c  :<C-u>CocList commands<cr>
" Find symbol of current document.
nnoremap <silent> ;o  :<C-u>CocList outline<cr>
" Search workspace symbols.
nnoremap <silent> ;s  :<C-u>CocList -I symbols<cr>
" Do default action for next item.
nnoremap <silent> ;j  :<C-u>CocNext<cr>
" Do default action for previous item.
nnoremap <silent> ;k  :<C-u>CocPrev<cr>
" Resume latest coc list.
nnoremap <silent> ;p  :<C-u>CocListResume<cr>

" }}}

" FZF {{{

let $FZF_DEFAULT_COMMAND = 'ag --hidden --ignore .git -l -g ""'

" [Make :Ag not match file names, only the file content](https://github.com/junegunn/fzf.vim/issues/346)
command! -bang -nargs=* Ag call fzf#vim#ag(<q-args>, {'options': '--delimiter : --nth 4..'}, <bang>0)

" Insert mode completion
imap <c-x><c-k> <plug>(fzf-complete-word)
imap <c-x><c-f> <plug>(fzf-complete-path)
imap <c-x><c-j> <plug>(fzf-complete-file-ag)
imap <c-x><c-l> <plug>(fzf-complete-line)

" Mapping selecting mappings
nmap <c-x><c-n> <plug>(fzf-maps-n)
xmap <c-x><c-x> <plug>(fzf-maps-x)
omap <c-x><c-o> <plug>(fzf-maps-o)

" Fuzzy find Vim commands (like Ctrl-Shift-P in Sublime/Atom/VSC)
nmap <c-P> :Commands<cr>
" These are only needed if COC is disabled.
" nmap <leader><tab> :Buffers<cr>
" nmap <leader><space> :Files<cr>

" FzfPreview {{{
nnoremap <silent> <Leader>fm :<C-u>CocCommand fzf-preview.Marks<CR>
nnoremap <silent> <Leader>fo :<C-u>CocCommand fzf-preview.OldFiles<CR>
nnoremap <silent> <Leader>gs :<C-u>CocCommand fzf-preview.GitStatus<CR>
nnoremap <silent> <Leader>ga :<C-u>CocCommand fzf-preview.GitActions<CR>
let g:fzf_preview_disable_mru = 0
let g:fzf_preview_floating_window_rate = 0.8
let g:fzf_preview_command = 'bat --color=always --plain {-1}'
let g:fzf_preview_default_fzf_options = { '--reverse': v:true, '--preview-window': 'wrap:70%' }
let g:fzf_preview_git_status_preview_command =
	\ "[[ $(git diff --cached -- {-1}) != \"\" ]] && git diff --cached --color=always -- {-1} | delta || " .
	\ "[[ $(git diff -- {-1}) != \"\" ]] && git diff --color=always -- {-1} | delta || " .
	\ g:fzf_preview_command

" }}}

" Fugitive Conflict Resolution{{{
nnoremap <leader>ds :Gvdiffsplit!<cr>
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
    \ {'d': '~/gitHub/dotfiles/'}, 
    \ {'r': '~/Repositories/Github/raydennis/dotfiles/shells/ranger/rc.conf'},
    \ {'s': '~/Repositories/Github/raydennis/dotfiles/shells/ranger/scope.sh'},
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

" UltiSnips {{{

if filereadable(expand("~/.vim/plugged/ultisnips/plugin/UltiSnips.vim"))
        let g:UltiSnipsEditSplit = "context"
        " Call mkdir($HOME . "~/.vim/UltiSnips", "p")
        let g:UltiSnipsSnippetsDir = "~/.vim/UltiSnips"
    endif

" Set ultisnips triggers
let g:UltiSnipsExpandTrigger="<Nop>"
let g:UltiSnipsJumpForwardTrigger="<tab>"
let g:UltiSnipsJumpBackwardTrigger="<s-tab>"
imap <C-u> * <C-R>=UltiSnips#ListSnippets()<CR>

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

" Color scheme + Lightline {{{

" Lightline {{{
set noshowmode
set laststatus=2

function! CocCurrentFunction()
    return get(b:, 'coc_current_function', '')
endfunction

let g:lightline = {
       \ 'colorscheme': 'apprentice',
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

" (this is mostly for apprentice, but would apply to others as well)
function! MyHighlights() abort

    " Use the terminal emulator backround color
    highlight Normal ctermbg=none
    " Make comments italic
    highlight Comment cterm=italic

    " Don't color text on diff.  Make background use emulator dark versions.
    hi DiffAdd     cterm=none  ctermbg=DARKGREEN   ctermfg=none
    hi DiffChange  cterm=none  ctermbg=DARKYELLOW  ctermfg=none
    hi DiffDelete  cterm=none  ctermbg=DARKRED     ctermfg=none
    hi DiffText    cterm=none  ctermbg=DARKYELLOW  ctermfg=none

endfunction

augroup MyColors
    autocmd!
    autocmd ColorScheme * call MyHighlights()
augroup END
" }}}


" Nord https://www.nordtheme.com/ports/vim {{{ 
let g:nord_italic = 1
let g:nord_italic_comments = 1
let g:nord_uniform_diff_background = 1
let g:nord_uniform_status_lines = 1
" }}}

" Papercolor {{{
" set background=light
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

colorscheme apprentice

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
    autocmd FileType go nnoremap <leader>r :! go run % <cr>
    autocmd FileType go nnoremap <leader>gp :CocCommand go.playground <cr>
augroup END
" }}}

" augroup python {{{
augroup python
    autocmd!
    autocmd FileType python setlocal number
    autocmd FileType python nnoremap <leader>r :! python3 % <cr>
    autocmd FileType python nnoremap <leader>te :! python3 -m unittest % <cr>
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
    autocmd FileType markdown nmap <leader>r <Plug>MarkdownPreviewToggle
augroup END
" }}}

" augroup powershell {{{
augroup ps1
    autocmd!
    autocmd FileType ps1 setlocal number
    autocmd FileType ps1 nnoremap <leader>r :CocCommand powershell.execute<cr>
    autocmd FileType ps1 vnoremap <leader>r :CocCommand powershell.evaluateSelection<cr>
augroup END
" }}}

" augroup terraform {{{
augroup terraform
    autocmd!
    autocmd FileType terraform setlocal number
    autocmd FileType terraform nnoremap <leader>r :terminal terraform apply<cr>
augroup END
" }}}

" }}}

" Buffers {{{
  nnoremap <BS> :buffer#<CR>
" }}}

" Delete swap files {{{
nnoremap <leader>rms :! rm $HOME/.vim/swapfiles/*
" }}}

" Diffthis {{{
nnoremap <leader>dw :windo diffthis<cr>
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
nnoremap <Leader>y "+y
vnoremap <Leader>y "+y
nnoremap <Leader>p :set paste<cr>"+p:set nopaste<cr>
nnoremap <Leader>P :set paste<cr>"+P:set nopaste<cr>
vnoremap <Leader>p :set paste<cr>"+p:set nopaste<cr>
vnoremap <Leader>P :set paste<cr>"+P:set nopaste<cr>
nnoremap <leader>rp "0p"
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
" Run the current line as if it were a command and read it into buffer
nnoremap <leader>r :read !<c-r><c-l><cr>
" }}}

" Search results centered {{{
nnoremap <silent> n nzz
nnoremap <silent> N Nzz
nnoremap <silent> * *zz
nnoremap <silent> # #zz
" }}}

" Search and Replace {{{
nnoremap <Leader>* :%s/\<<C-r>=expand("<cword>")<CR>\>/
" }}}

" SpaceMacs Org-Mode style agenda bindings {{{
nnoremap <leader>dd :.s/TODO\\|WAITING\\|SCHEDULED/DONE<cr> ea [d:<C-R>=strftime("%Y-%m-%d")<cr>]<Esc>
nnoremap <leader>tw :.s/TODO\\|SCHEDULED\\|DONE/WAITING<cr> ea [w:<C-R>=strftime("%Y-%m-%d")<cr>]<Esc>
nnoremap <leader>ts :.s/\TODO\\|WAITING\\|DONE\/SCHEDULED<cr> ea [s:<C-R>=strftime("%Y-%m-%d")<cr>]<Esc>
nnoremap <leader>td :.s/- /- TODO /<cr> ea [i:<C-R>=strftime("%Y-%m-%d")<cr>]<Esc>
nnoremap <leader>th :.s/- /- HTODO /<cr> ea [i:<C-R>=strftime("%Y-%m-%d")<cr>]<Esc>
nnoremap <leader>at :grep " TODO" *<cr>
nnoremap <leader>ah :grep HTODO *<cr>
nnoremap <leader>aw :grep WAITING *<cr>
nnoremap <leader>ad :grep DONE *<cr>
nnoremap <leader>as :grep SCHEDULED *<cr>
" }}}

" Source and reload current file {{{
nnoremap <leader>so :w<cr> :so %<cr>
nnoremap <leader>sor :w<cr> :so %<cr> e %
nnoremap <leader>pi :w<cr> :so %<cr> :PlugInstall<cr>
nnoremap <leader>pu :w<cr> :so %<cr> :PlugUpdate<cr>
nnoremap <leader>pc :w<cr> :so %<cr> :PlugClean<cr>
" }}}

" Spell check for previous misspelled word, accept first choice {{{
inoremap <c-z> <esc>:set spell<cr>[s1z=<c-o>a
nnoremap <c-z> :set spell<cr>[s1z=e
" }}}

" Stop highlight after searching {{{
nnoremap <silent> <leader>, :noh<cr>
" }}}

" Terminal {{{
nnoremap <leader>' :split term://zsh<cr>
nnoremap <leader>v' :vsplit term://zsh<cr>
" To simulate |i_CTRL-R| in terminal-mode: >
tnoremap <expr> <C-\><C-\> '<C-\><C-N>"'.nr2char(getchar()).'pi'
" To map <Esc> to exit terminal-mode: >
tnoremap <C-w> <C-\><C-n>

" To use `ALT+{h,j,k,l}` to navigate windows from any mode: >
tnoremap <A-h> <C-\><C-N><C-w>h
tnoremap <A-j> <C-\><C-N><C-w>j
tnoremap <A-k> <C-\><C-N><C-w>k
tnoremap <A-l> <C-\><C-N><C-w>l
inoremap <A-h> <C-\><C-N><C-w>h
inoremap <A-j> <C-\><C-N><C-w>j
inoremap <A-k> <C-\><C-N><C-w>k
inoremap <A-l> <C-\><C-N><C-w>l
nnoremap <A-h> <C-w>h
nnoremap <A-j> <C-w>j
nnoremap <A-k> <C-w>k
nnoremap <A-l> <C-w>l
" }}}

" Vimwiki style jump bindings {{{
nnoremap <leader>ww :e ~/Repositories/Azure/Sandia/wnotes/todo.md<cr>:cd %:h<cr>
nnoremap <leader>wd :e ~/Repositories/Azure/Sandia/wnotes/done.md<cr>:cd %:h<cr>
nnoremap <leader>wp :e ~/Repositories/Azure/Sandia/wnotes/people/people.md<cr>:cd %:h<cr>
nnoremap <leader>wl :e ~/Repositories/Azure/Sandia/wnotes/quicklinks.md<cr>:cd %:h<cr>
nnoremap <leader>wh :e ~/Repositories/Github/raydennis/notes/personal/home.md<cr>:cd %:h<cr>
nnoremap <leader>ws :e ~/Repositories/Github/raydennis/notes/personal/snippets.md<cr>:cd %:h<cr>
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
hi Folded ctermbg=None ctermfg=Magenta guibg=None guifg=Magenta

" }}}

" vim:foldmethod=marker
