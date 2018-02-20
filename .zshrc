# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH=~/.oh-my-zsh

#set vim keybindings (seems to break when used with oh-my-zsh)
#bindkey -v

# Set name of the theme to load. Optionally, if you set this to "random"
# it'll load a random theme each time that oh-my-zsh is loaded.
# See https://github.com/robbyrussell/oh-my-zsh/wiki/Themes
 ZSH_THEME="powerlevel9k/powerlevel9k"

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
# https://github.com/zsh-users/zsh-autosuggestions.git
plugins=(
  git python zsh-autosuggestions 
  zsh-syntax-highlighting)

# source the plugins
source $ZSH/oh-my-zsh.sh 
# brew install zsh-syntax-highlighting
source ~/.oh-my-zsh/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
# brew install zsh-autosuggestions
source ~/.oh-my-zsh/zsh-autosuggestions/zsh-autosuggestions.zsh


case `uname` in
  Darwin)
    # commands for OS X go here
    # setup alias for MacVim
    alias vim='/usr/local/Cellar/macvim/8.0-144_3/MacVim.app/Contents/MacOS/Vim'
    # setup "Z" on MACOS
    # brew install z
    . `brew --prefix`/etc/profile.d/z.sh
    # simplenote date alias on osX
    local LASTWEEK=$(date -j -v-1w +"%Y-%m-%d")
  ;;
  Linux)
    # commands for Linux go here

    # allow access to Vagrant from WSL
    export VAGRANT_WSL_ENABLE_WINDOWS_ACCESS="1"
    #setup the z plugin on WSL
    . ~/z.sh
    unsetopt BG_NICE # fixes "zsh: nice(5) failed: operation not permitted" issue when running z on WSL
  ;;
  FreeBSD)
    # commands for FreeBSD go here
  ;;
esac

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
alias zshconfig="vim  ~/.zshrc"
alias ohmyzsh="vim ~/.oh-my-zsh"
alias tnc="ping -c 1 8.8.8.8 -t 1 | grep '0.0% \| 100.0%'"
alias sn="vim -c 'SimplenoteList $LASTWEEK'"
alias todo="vim -c 'SimplenoteOpen deb32885f0aa11e7806ccd64099eb044'"

# taken from https://stackoverflow.com/questions/3964068/zsh-automatically-run-ls-after-every-cd
function chpwd() 
{
    emulate -L zsh
    ls -a
}

#change format for time
HISTTIMEFORMAT="%F %R%z "
