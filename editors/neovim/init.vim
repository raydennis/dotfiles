set runtimepath^=/.vim runtimepath+=~/.vim/after "List of directories to be searched for runtime files

let &packpath = &runtimepath "Directories used to find packages.  See |packages|.


source ~/.vimrc "The rest of the settings

" TreeSitter
lua <<EOF
require'nvim-treesitter.configs'.setup {
  ensure_installed = "maintained", -- one of "all", "maintained" (parsers with maintainers), or a list of languages
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
