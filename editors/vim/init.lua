-- Options {{{1

local home = vim.env.HOME
local config = home .. '/.config/nvim'
local root = vim.env.USER == 'root'
local vi = vim.v.progname == 'vi'

vim.opt.autoindent = true                                   -- Copy indent from current line when starting a new line
vim.opt.autoread = true
vim.opt.backspace = 'indent,eol,start'                          -- Make backspace act as it does on other editors
vim.opt.backup         = false                             -- don't make backups before writing
vim.opt.backupcopy     = 'yes'                             -- overwrite files to update, instead of renaming + rewriting
vim.opt.backupdir      = config .. '/backup//'             -- keep backup files out of the way (ie. if 'backup' is ever set)
vim.opt.backupdir      = vim.opt.backupdir + '.'           -- fallback
vim.opt.backupskip     = vim.opt.backupskip + '*.re,*.rei' -- prevent bsb's watch mode from getting confused (if 'backup' is ever set)
vim.opt.belloff = 'all'                                         -- Turn off all error notifications (both bell and flash)
vim.opt.cursorline = true
vim.opt.diffopt        = vim.opt.diffopt + 'foldcolumn:0'  -- don't show fold column in diff view
vim.opt.foldlevelstart=1                                   -- Useful to always start editing with all folds closed (value zero), some folds closed (one) or no folds closed (99).
vim.opt.foldmethod = 'expr'                                     -- This is used for vimrc marker, but also for treesitter with the following
vim.opt.gdefault = true                                     -- Makes global the default for things like :%s/search/replace.  Add a g to negate the global (:%/s/r/g)
vim.opt.hidden = true                                       -- When ON a buffer becomes hidden when it is |abandon|ed.
vim.opt.inccommand     = 'split'                           -- live preview of :s results
vim.opt.lazyredraw = true                                   -- Don't redraw screen while executing macro
vim.opt.list           = true                              -- show whitespace
vim.opt.listchars      = {
  nbsp                 = '⦸',                              -- CIRCLED REVERSE SOLIDUS (U+29B8, UTF-8: E2 A6 B8)
  extends              = '»',                              -- RIGHT-POINTING DOUBLE ANGLE QUOTATION MARK (U+00BB, UTF-8: C2 BB)
  precedes             = '«',                              -- LEFT-POINTING DOUBLE ANGLE QUOTATION MARK (U+00AB, UTF-8: C2 AB)
  tab                  = '▷⋯',                             -- WHITE RIGHT-POINTING TRIANGLE (U+25B7, UTF-8: E2 96 B7) + MIDLINE HORIZONTAL ELLIPSIS (U+22EF, UTF-8: E2 8B AF)
  trail                = '•',                              -- BULLET (U+2022, UTF-8: E2 80 A2)
}
vim.opt.scrolloff=20                                        -- Minimal number of screen lines to keep above and below the cursor.

vim.opt.shell         = 'sh'                    -- shell to use for `!`, `:!`, `system()` etc.
vim.opt.shiftround    = false                   -- don't always indent by multiple of shiftwidth
vim.opt.shiftwidth    = 2                       -- spaces per tab (when shifting)
vim.opt.shortmess     = vim.opt.shortmess + 'A' -- ignore annoying swapfile messages
vim.opt.shortmess     = vim.opt.shortmess + 'I' -- no splash screen
vim.opt.shortmess     = vim.opt.shortmess + 'O' -- file-read message overwrites previous
vim.opt.shortmess     = vim.opt.shortmess + 'T' -- truncate non-file messages in middle
vim.opt.shortmess     = vim.opt.shortmess + 'W' -- don't echo "[w]"/"[written]" when writing
vim.opt.shortmess     = vim.opt.shortmess + 'a' -- use abbreviations in messages eg. `[RO]` instead of `[readonly]`
vim.opt.shortmess     = vim.opt.shortmess + 'c' -- completion messages
vim.opt.shortmess     = vim.opt.shortmess + 'o' -- overwrite file-written messages
vim.opt.shortmess     = vim.opt.shortmess + 't' -- truncate file messages at start
vim.opt.showbreak     = '↳ '                    -- DOWNWARDS ARROW WITH TIP RIGHTWARDS (U+21B3, UTF-8: E2 86 B3)
vim.opt.showcmd = true                                      -- Display incomplete command
vim.opt.sidescroll    = 0                       -- sidescroll in jumps because terminals are slow
vim.opt.sidescrolloff = 3                       -- same as scrolloff, but for columns
vim.opt.smarttab      = true                    -- <tab>/<BS> indent/dedent in leading whitespace

vim.opt.showmatch = true                                    -- When a bracket is inserted, briefly jump to the matching one.
vim.opt.splitbelow    = true                    -- open horizontal splits below current window
vim.opt.splitright    = true                    -- open vertical splits to the right of the current window
vim.opt.swapfile      = false                   -- don't create swap files
vim.opt.switchbuf     = 'usetab'                -- try to reuse windows/tabs when switching buffers
vim.opt.synmaxcol     = 200                     -- don't bother syntax highlighting long lines
vim.opt.termguicolors = true                    -- use guifg/guibg instead of ctermfg/ctermbg in terminal
vim.opt.textwidth     = 80                      -- automatically hard wrap at 80 columns
vim.opt.tagcase = 'smart'                                     -- Smart	Ignore case unless an upper case letter is used
vim.opt.timeoutlen = 500
vim.opt.undofile = true                                     -- Save undos after file closes
vim.opt.wildmenu = true                                     -- When 'wildmenu' is on, command-line completion operates in an enhanced mode
vim.opt.writebackup = false                                 -- don't keep backups after writing
vim.opt.wildmode = 'list:longest,full'
vim.opt.tabstop = 4                                         -- Number of spaces that a <Tab> in the file counts for.
vim.opt.shiftwidth = 4                                      -- This allows you to use the < and > keys from VIM'S visual (marking) mode to block indent/un-indent regions
vim.opt.fillchars      = {
  diff                 = '∙',                              -- BULLET OPERATOR (U+2219, UTF-8: E2 88 99)
  eob                  = ' ',                              -- NO-BREAK SPACE (U+00A0, UTF-8: C2 A0) to suppress ~ at EndOfBuffer
  fold                 = '·',                              -- MIDDLE DOT (U+00B7, UTF-8: C2 B7)
  vert                 = '┃',                              -- BOX DRAWINGS HEAVY VERTICAL (U+2503, UTF-8: E2 94 83)
  msgsep               = '‾'
}
vim.opt.expandtab = true                                         -- Insert spaces instead of tab
if not vi then
  vim.opt.softtabstop = -1 -- use 'shiftwidth' for tab/bs at end of line
end


-------------------------------------------------------------------------------
-- Globals {{{1

-- Automatic, language-dependent indentation, syntax coloring and other
-- functionality.
--
-- Must come *after* the `:packadd!` calls above otherwise the contents of
-- package "ftdetect" directories won't be evaluated.

-- vim.cmd('filetype indent plugin on')
-- vim.cmd('syntax on')

-- vim: foldmethod=marker
