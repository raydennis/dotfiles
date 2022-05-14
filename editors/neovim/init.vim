" Syntax {{{
syntax on
autocmd Syntax * syntax keyword myTodo QUESTION TODO FIXME NOTE NOTES RAY containedin=ALL | highlight def link myTodo TODO
autocmd Syntax * syntax keyword myError ERROR WAITING SCHEDULED containedin=ALL | highlight def link myError ERROR
autocmd Syntax * syntax keyword myUnderlined DONE containedin=ALL | highlight def link myUnderlined String
" }}}

" Set and Let {{{

" Let {{{
let mapleader = " "                       " Leader - ( Space bar )
let maplocalleader = " "                  " LocalLeader - ( Space bar )
let markdown_folding = 1
let &packpath = &runtimepath              " Directories used to find packages.  See |packages|.
" }}}


" Set {{{


set autoindent                                           " Copy indent from current line when starting a new line
set autoread
set autowriteall
set backspace=indent,eol,start                           " Make backspace act as it does on other editors
set belloff=all                                          " Turn off all error notifications (both bell and flash)
set cursorline
set directory=$HOME/.vim/swapfiles/                      " Where to save swap files
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
set runtimepath^=/.vim runtimepath+=~/.vim/after         " List of directories to be searched for runtime files
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

" }}}}

" }}}

" Plugins {{{

call plug#begin('~/.vim/plugged')

Plug 'BurntSushi/ripgrep'                                    " line-oriented search tool that recursively searches the current directory for a regex pattern
Plug 'L3MON4D3/LuaSnip'                                      " snippets
Plug 'arcticicestudio/nord-vim'                              " Nord theme
Plug 'christoomey/vim-tmux-navigator'
Plug 'dhruvasagar/vim-table-mode'                            " Tables
Plug 'francoiscabrol/ranger.vim'                             " Ranger integration
Plug 'hrsh7th/cmp-nvim-lsp'
Plug 'hrsh7th/nvim-cmp'                                      " completion
Plug 'kyazdani42/nvim-web-devicons'                          " (icons)
Plug 'mbbill/undotree'                                       " Visual representation of undo tree
Plug 'mhinz/vim-startify'                                    " Provides a start screen for Vim
Plug 'neovim/nvim-lspconfig'                                 " (picker)
Plug 'nvim-lua/plenary.nvim'                                 " Lua library (required for telescope)
Plug 'nvim-telescope/telescope-fzf-native.nvim', { 'do': 'make' }  " fuzzy finder native
Plug 'nvim-telescope/telescope.nvim'                         " fuzzy find
Plug 'nvim-treesitter/nvim-treesitter'                       " (finder/preview)
Plug 'sharkdp/fd'                                            " (finder)
Plug 'tommcdo/vim-lion'                                      " Align based on a character ex :glip(char)
Plug 'tpope/vim-commentary'                                  " Comment out code with gcc
Plug 'tpope/vim-fugitive'                                    " Adds git functionality to vim ex. :Gdiff
Plug 'tpope/vim-repeat'                                      " Enable repeating supported plugin maps with
Plug 'tpope/vim-speeddating'                                 " Quickly modify dates.
Plug 'tpope/vim-surround'                                    " Provides mappings to easily delete, change and add such surroundings in pairs
Plug 'tpope/vim-unimpaired'                                  " Pairs of handy bracket mappings
Plug 'will133/vim-dirdiff'                                   " Recursively diff on two directories
Plug 'williamboman/nvim-lsp-installer'                       " lsp installer

call plug#end() " Required, All of the Plugins must be added before this line

" }}} /Plugins

" Plugin settings {{{

" CMP (completion) {{{{
lua << EOF
local cmp = require'cmp'

cmp.setup({
snippet = {
    expand = function(args)
    -- For `vsnip` user.
    -- vim.fn["vsnip#anonymous"](args.body)

    -- For `luasnip` user.
    require('luasnip').lsp_expand(args.body)

    -- For `ultisnips` user.
    -- vim.fn["UltiSnips#Anon"](args.body)
    end,
},
mapping = {
  ['<C-n>'] = cmp.mapping.select_next_item({ behavior = cmp.SelectBehavior.Insert }),
  ['<C-p>'] = cmp.mapping.select_prev_item({ behavior = cmp.SelectBehavior.Insert }),
  ['<Down>'] = cmp.mapping.select_next_item({ behavior = cmp.SelectBehavior.Select }),
  ['<Up>'] = cmp.mapping.select_prev_item({ behavior = cmp.SelectBehavior.Select }),
  ['<C-d>'] = cmp.mapping.scroll_docs(-4),
  ['<C-f>'] = cmp.mapping.scroll_docs(4),
  ['<C-Space>'] = cmp.mapping.complete(),
  ['<C-e>'] = cmp.mapping.close(),
  ['<CR>'] = cmp.mapping.confirm({
    behavior = cmp.ConfirmBehavior.Replace,
    select = true,
    })
},
sources = {
    { name = 'nvim_lsp' },
    { name = 'vsnip' },
    { name = 'path' },
    { name = 'buffer' },
    { name = 'calc' },
    { name = 'tmux' },
}
})
EOF
" }}}} /cmp (completion)

" Luasnip {{{
lua << EOF
local has_words_before = function()
  local line, col = unpack(vim.api.nvim_win_get_cursor(0))
  return col ~= 0 and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match("%s") == nil
end

local luasnip = require("luasnip")
local cmp = require("cmp")

cmp.setup({

  -- ... Your other configuration ...

  mapping = {

    -- ... Your other mappings ...

    ["<Tab>"] = cmp.mapping(function(fallback)
      if cmp.visible() then
        cmp.select_next_item()
      elseif luasnip.expand_or_jumpable() then
        luasnip.expand_or_jump()
      elseif has_words_before() then
        cmp.complete()
      else
        fallback()
      end
    end, { "i", "s" }),

    ["<S-Tab>"] = cmp.mapping(function(fallback)
      if cmp.visible() then
        cmp.select_prev_item()
      elseif luasnip.jumpable(-1) then
        luasnip.jump(-1)
      else
        fallback()
      end
    end, { "i", "s" }),

    -- ... Your other mappings ...
  },

  -- ... Your other configuration ...
})

EOF
" }}} /Luasnip

" Lsp-config {{{{
 lua << EOF

-- Mappings.
-- See `:help vim.diagnostic.*` for documentation on any of the below functions

local opts = { noremap=true, silent=true }
vim.api.nvim_set_keymap('n', '<space>e', '<cmd>lua vim.diagnostic.open_float()<CR>', opts)
vim.api.nvim_set_keymap('n', '[d', '<cmd>lua vim.diagnostic.goto_prev()<CR>', opts)
vim.api.nvim_set_keymap('n', ']d', '<cmd>lua vim.diagnostic.goto_next()<CR>', opts)
vim.api.nvim_set_keymap('n', '<space>q', '<cmd>lua vim.diagnostic.setloclist()<CR>', opts)

-- Use an on_attach function to only map the following keys
-- after the language server attaches to the current buffer
local on_attach = function(client, bufnr)
  -- Enable completion triggered by <c-x><c-o>
  vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')

  -- Mappings.
  -- See `:help vim.lsp.*` for documentation on any of the below functions
  vim.api.nvim_buf_set_keymap(bufnr, 'n', 'gD', '<cmd>lua vim.lsp.buf.declaration()<CR>', opts)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', 'gd', '<cmd>lua vim.lsp.buf.definition()<CR>', opts)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', 'K', '<cmd>lua vim.lsp.buf.hover()<CR>', opts)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<CR>', opts)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', '<C-k>', '<cmd>lua vim.lsp.buf.signature_help()<CR>', opts)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', '<space>wa', '<cmd>lua vim.lsp.buf.add_workspace_folder()<CR>', opts)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', '<space>wr', '<cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>', opts)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', '<space>wl', '<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>', opts)
  lim.api.nvim_buf_set_keymap(bufnr, 'n', '<space>D', '<cmd>lua vim.lsp.buf.type_definition()<CR>', opts)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', '<space>rn', '<cmd>lua vim.lsp.buf.rename()<CR>', opts)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', '<space>ca', '<cmd>lua vim.lsp.buf.code_action()<CR>', opts)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', 'gr', '<cmd>lua vim.lsp.buf.references()<CR>', opts)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', '<space>f', '<cmd>lua vim.lsp.buf.formatting()<CR>', opts)
end

EOF
" }}}} lsp-config

" Lsp-install {{{{
 lua << EOF

local lsp_installer = require("nvim-lsp-installer")

lsp_installer.settings({
    ui = {
        icons = {
            server_installed = "✓",
            server_pending = "➜",
            server_uninstalled = "✗"
        }
    }
})

local lsp_installer = require("nvim-lsp-installer")

-- Register a handler that will be called for each installed server when it's ready (i.e. when installation is finished
-- or if the server is already installed).
lsp_installer.on_server_ready(function(server)
    local opts = {}

    -- (optional) Customize the options passed to the server
    -- if server.name == "tsserver" then
    --     opts.root_dir = function() ... end
    -- end

    -- This setup() function will take the provided server configuration and decorate it with the necessary properties
    -- before passing it onwards to lspconfig.
    -- Refer to https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md
    server:setup(opts)
end)

EOF
" }}}} Lsp-install

" Fugitive Conflict Resolution{{{
nnoremap <leader>dw :windo diffthis<cr>
nnoremap <leader>dv :Gvdiffsplit!<cr>
nnoremap <leader>h :diffget //2<cr>
nnoremap <leader>l :diffget //3<cr>
" }}}

" IndentLine {{{
let g:indentLine_char = '|'
" }}}

" Ranger {{{{
let g:ranger_map_keys = 0
map <leader>rr :Ranger<cr>
" }}}} Ranger

" Startify {{{{
let g:startify_bookmarks = [
\ {'c': '~/Repositories/GitHub/raydennis/wnotes/commands.md'},
\ {'i': '~/Repositories/GitHub/raydennis/dotfiles/editors/neovim/init.vim'},
\ {'p': '~/Repositories/GitHub/raydennis/wnotes/people.md'},
\ {'ps': '~/Repositories/GitHub/raydennis/dotfiles/shells/powershell/profile.ps1'},
\ {'ti': '~/Repositories/GitHub/raydennis/wnotes/trainings/index.md'},
\ {'te': '/mnt/c/Users/rdennis/AppData/Local/Packages/Microsoft.WindowsTerminal_8wekyb3d8bbwe/LocalState/settings.json'},
\ {'tm': '~/Repositories/GitHub/raydennis/dotfiles/shells/tmux/.tmux.conf'},
\ ]
let g:startify_skiplist = [
\ 'COMMIT_EDITMSG',
\ escape(fnamemodify(resolve($VIMRUNTIME), ':p'), '\') .'doc',
\ 'bundle/.*/doc',
\ ]

nnoremap <leader>s :Startify<cr>
nnoremap <leader>ss :SSave<cr>
nnoremap <leader>sl :SLoad<cr>
nnoremap <leader>sd :SDelete<cr>

" }}}} /Startify

" Surround {{{{
let g:surround_{char2nr('b')} = "**\r**"
let g:surround_{char2nr('c')} = "```bash\r```"
let g:surround_{char2nr('e')} = "lua << EOF\rEOF"
let g:surround_{char2nr('g')} = "<font face=\"verdana\" color=\"green\">\r</font>"
let g:surround_{char2nr('l')} = "[link](\r)"
let g:surround_{char2nr('r')} = "<font face=\"verdana\" color=\"red\">\r</font>"
let g:surround_{char2nr('s')} = "snippet\rendsnippet"
let g:surround_{char2nr('u')} = "<li>\r</li>"
let g:surround_{char2nr('y')} = "<font face=\"verdana\" color=\"#CCCC00\">\r</font>"
" }}}} Surround

" Tablemode {{{{
let g:table_mode_corner = '|'
" }}}} Tablemode 

" Telescope {{{{
lua << EOF
local telescope = require('telescope')
telescope.setup {
	pickers = {
		find_files = {
			hidden = true
			}
		}
	}
EOF
nnoremap <leader><space> <cmd>lua require('telescope.builtin').find_files()<cr>
nnoremap <leader>ff <cmd>lua require('telescope.builtin').live_grep()<cr>
nnoremap <leader><tab> <cmd>lua require('telescope.builtin').buffers()<cr>
nnoremap <leader>fh <cmd>lua require('telescope.builtin').help_tags()<cr>
" }}}} Telescope

" TmuxNavigator {{{{
let g:tmux_navigator_no_mappings = 1

nnoremap <silent> <C-z> :TmuxNavigatePrevious<cr>
nnoremap <silent> <C-h> :TmuxNavigateLeft<cr>
nnoremap <silent> <C-j> :TmuxNavigateDown<cr>
nnoremap <silent> <C-k> :TmuxNavigateUp<cr>
nnoremap <silent> <C-l> :TmuxNavigateRight<cr>

tnoremap <silent> <C-z> <C-\><C-n>:TmuxNavigatePrevious<cr>
tnoremap <silent> <C-h> <C-\><C-n>:TmuxNavigateLeft<cr>
tnoremap <silent> <C-j> <C-\><C-n>:TmuxNavigateDown<cr>
tnoremap <silent> <C-k> <C-\><C-n>:TmuxNavigateUp<cr>
tnoremap <silent> <C-l> <C-\><C-n>:TmuxNavigateRight<cr>
" Treesitter {{{{
lua <<EOF
require'nvim-treesitter.configs'.setup {
    -- one of "all", "maintained" (parsers with maintainers), or a list of languages
  ensure_installed = {
     "bash",
     "comment",
     "dockerfile",
     "go",
     "hcl",
     "lua",
     "markdown",
     "python",
     "regex",
     "typescript",
     "vim",
     "yaml"
  },

  highlight = {
    enable = true,              -- false will disable the whole extension
  },
  incremental_selection = {
    enable = true,
  },
  indent = {
    enable = true,
  },
  folding = {
    enable = true,
  }
}
EOF
" }}}} Treesitter

" Undotree {{{{
nnoremap <leader>u :UndotreeToggle<cr>
let g:undotree_SetFocusWhenToggle = 1
if !exists('g:undotree_WindowLayout')
let g:undotree_WindowLayout = 2
endif
" }}}} Undotree 

" Nord {{{{
" https://www.nordtheme.com/ports/vim 
let g:nord_italic = 1
let g:nord_italic_comments = 1
let g:nord_uniform_diff_background = 1
let g:nord_uniform_status_lines = 1
" }}}]

" Dracula {{{{
let g:dracula_bold = 1
let g:dracula_italic = 1
let g:dracula_colorterm = 1
let g:dracula_full_special_attrs_support = 1
" }}}} /Dracula

" }}} /Plugin settings

" Mappings {{{

" Augroups {{{{

" Augroup minivmrc {{{{{
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
" }}}}} Augroup minvimrc

" augroup remember folds [disabled]{{{{{
"   autocmd!
"   au BufWinLeave ?* mkview 1
"   au BufWinEnter ?* silent! loadview 1
" augroup END
" }}}}}

" }}}} Augroups

" Buffers {{{{
nnoremap <BS> :buffer#<CR>
" }}}} Buffers 

" Delete swap files {{{{
nnoremap <leader>rms :! rm $HOME/.vim/swapfiles/*
" }}} Delete swap files

" Insert current date {{{{{
nnoremap <C-d>a a<C-R>=strftime("%Y-%m-%d")<cr><Esc>
tnoremap <C-d>a a<C-R>=strftime("%Y-%m-%d")<cr><Esc>
inoremap <C-d>a <C-R>=strftime("%Y-%m-%d")<cr>
cnoremap <C-d>a <C-R>=strftime("%Y-%m-%d")<cr>
" }}} Insert current date}}

" Movement {{{{{

cnoremap <C-j> <C-g>
cnoremap <C-k> <C-t>
nnoremap H 0
nnoremap L $

" }}}}} Movement

" OS specific commands {{{{{
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
endif
if has("win32")
    " Windows
    " set shell=
    " set shellcmdflag=-NoProfile\ -NoLogo\ -NonInteractive\ -Command
    set shellpipe=|
    set shellredir=>
endif

" }}}

" Registers {{{{{
nnoremap <Leader>y "+y
vnoremap <Leader>y "+y
nnoremap <Leader>p :set paste<cr>"+p:set nopaste<cr>
nnoremap <Leader>P :set paste<cr>"+P:set nopaste<cr>
vnoremap <Leader>p :set paste<cr>"+p:set nopaste<cr>
vnoremap <Leader>P :set paste<cr>"+P:set nopaste<cr>
" }}}}} Registers

" Remote file management {{{{{
nnoremap <leader>es :e scp://user@127.0.0.1:22//home/
" }}}}} Remote file management

" Remove blank lines in current visual selection {{{{{
vnoremap <leader>rml :v/./d
" }}}}} Remove blank lines in current visual selection

" Resize panes with arrow keys {{{{{
 nnoremap <silent> <Left> :vertical resize -5<cr>
 nnoremap <silent> <Right> :vertical resize +5<cr>
 nnoremap <silent> <Up> :resize +5<cr>
 nnoremap <silent> <Down> :resize -5<cr>
 " }}}}} Resize panes with arrow keys

" Run the current line as if it were a command {{{{{
nnoremap <leader>ee :exe getline(line(! + '.'))<cr>
" Run the current line as if it were a command and read it into buffer
nnoremap <leader>er :read !<c-r><c-l><cr>
" }}}}} Run the current line as if it were a command

" Search results centered {{{{{
nnoremap <silent> n nzz
nnoremap <silent> N Nzz
nnoremap <silent> * *zz
nnoremap <silent> # #zz
" }}}}} Search results centered

" Search and Replace {{{{{
:nnoremap <Leader>* :%s/\<<C-r><C-w>\>/
" }}}}} Search and Replace

" SpaceMacs Org-Mode style agenda bindings {{{{{
nnoremap <leader>tdd :.s/TODO\\|WAITING\\|SCHEDULED/DONE<cr> ea [d:<C-R>=strftime("%Y-%m-%d")<cr>]<Esc>
nnoremap <leader>tw :.s/TODO\\|SCHEDULED\\|DONE/WAITING<cr> ea [w:<C-R>=strftime("%Y-%m-%d")<cr>]<Esc>
nnoremap <leader>ts :.s/\TODO\\|WAITING\\|DONE\/SCHEDULED<cr> ea [s:<C-R>=strftime("%Y-%m-%d")<cr>]<Esc>
nnoremap <leader>td :.s/- /- TODO /<cr> ea [i:<C-R>=strftime("%Y-%m-%d")<cr>]<Esc>
nnoremap <leader>ot :grep " TODO" *<cr>
nnoremap <leader>ow :grep WAITING *<cr>
nnoremap <leader>od :grep DONE *<cr>
nnoremap <leader>os :grep SCHEDULED *<cr>
" }}}}} SpaceMacs Org-Mode style agenda bindings

" Source and reload current file {{{{{
nnoremap <leader>so :w<cr> :so %<cr>
nnoremap <leader>pi :w<cr> :so %<cr> :PlugInstall<cr>
nnoremap <leader>pu :w<cr> :so %<cr> :PlugUpdate<cr>
nnoremap <leader>pc :w<cr> :so %<cr> :PlugClean<cr>
" }}}}} Source and reload current file

" Spell check for previous misspelled word, accept first choice {{{{{
inoremap <c-s> <esc>:set spell<cr>[s1z=<c-o>a
nnoremap <c-s> :set spell<cr>[s1z=e
" }}}}} Spell check for previous misspelled word, accept first choice

" Stop highlight after searching {{{{{
nnoremap <silent> <leader>, :noh<cr>
" }}}}} Stop highlight after searching

" Terminal {{{{{
nnoremap <leader>' :split term://zsh<cr>
nnoremap <leader>v' :vsplit term://zsh<cr>
" To simulate |i_CTRL-R| in terminal-mode: >
tnoremap <expr> <C-\><C-R> '<C-\><C-N>"'.nr2char(getchar()).'pi'
" To map <Esc> to exit terminal-mode: >
tnoremap <C-w> <C-\><C-n>}} " Terminal

" }}}}} Terminal

" Vimgrep add {{{{{
" search open buffers for word
nnoremap <leader>ba :bufdo vimgmrepadd  %<left><left>

" clear the quickfix list
nnoremap <leader>qc :cexpr [] <cr>
" }}}}} " Vimgrep add

" }}} Mappings

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

" Function Folds {{{{
function! MyFoldText()
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
endfunction
set foldtext=MyFoldText()
" }}}}

hi Folded ctermbg=None ctermfg=Magenta

" }}} /Functions

" Colorscheme {{{
set termguicolors
colorscheme nord
hi Normal guibg=NONE ctermbg=NONE
" }}}

" vim:foldmethod=marker
