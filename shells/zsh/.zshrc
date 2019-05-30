# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH=~/.oh-my-zsh
export TERM="xterm-256color"

#set vim keybindings (seems to break when used with oh-my-zsh)
#bindkey -v

# Set name of the theme to load. Optionally, if you set this to "random"
# it'll load a random theme each time that oh-my-zsh is loaded.
# See https://github.com/robbyrussell/oh-my-zsh/wiki/Themes
ZSH_THEME="robbyrussell"
# ZSH_THEME="powerlevel9k/powerlevel9k"

# https://github.com/zsh-users/zsh-autosuggestions.git
# not working and...not necesary?
# plugins=(
#   git python zsh-autosuggestions 
#   zsh-syntax-highlighting)

# source the plugins
source $ZSH/oh-my-zsh.sh 


case `uname` in
  Darwin)
    # commands for OS X go here
    # setup alias for MacVim
    alias vim='/usr/local/Cellar/macvim/8.1-155/MacVim.app/Contents/MacOS/Vim'
    # setup "Z" on MACOS
    # brew install z
    . `brew --prefix`/etc/profile.d/z.sh
    # date alias on osX
    local LASTWEEK=$(date -j -v-1w +"%Y-%m-%d")

    # brew install zsh-syntax-highlighting
    source /usr/local/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
    # brew install zsh-autosuggestions
    source /usr/local/share/zsh-autosuggestions/zsh-autosuggestions.zsh
  ;;
  Linux)
    # commands for Linux go here
   alias copy='xclip -sel clip'
    # allow access to Vagrant from WSL
    export VAGRANT_WSL_ENABLE_WINDOWS_ACCESS="1"
    #setup the z plugin on WSL
    . ~/z.sh
    unsetopt BG_NICE # fixes "zsh: nice(5) failed: operation not permitted" issue when running z on WSL

    #zsh plugins
    source ~/.oh-my-zsh/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
    source ~/.oh-my-zsh/zsh-autosuggestions/zsh-autosuggestions.zsh
  ;;
  FreeBSD)
    # commands for FreeBSD go here
  ;;
esac

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
# taken from https://stackoverflow.com/questions/3964068/zsh-automatically-run-ls-after-every-cd
function chpwd() 
{
    emulate -L zsh
    ls -a
}

#change format for time
HISTTIMEFORMAT="%F %R%z "

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh


# fzf
# fe [FUZZY PATTERN] - Open the selected file with the default editor
#   - Bypass fuzzy finder if there's only one match (--select-1)
#   - Exit if there's no match (--exit-0)
fe() {
  local files
  IFS=$'\n' files=($(fzf-tmux --query="$1" --multi --select-1 --exit-0))
  [[ -n "$files" ]] && ${EDITOR:-vim} "${files[@]}"
}

# Modified version where you can press
#   - CTRL-O to open with `open` command,
#   - CTRL-E or Enter key to open with the $EDITOR
fo() {
  local out file key
  IFS=$'\n' out=($(fzf-tmux --query="$1" --exit-0 --expect=ctrl-o,ctrl-e))
  key=$(head -1 <<< "$out")
  file=$(head -2 <<< "$out" | tail -1)
  if [ -n "$file" ]; then
    [ "$key" = ctrl-o ] && open "$file" || ${EDITOR -t} "$file"
  fi
}
