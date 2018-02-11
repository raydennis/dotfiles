# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH=~/.oh-my-zsh

#set vim keybindings (seems to break when used with oh-my-zsh)
#bindkey -v

# Set name of the theme to load. Optionally, if you set this to "random"
# it'll load a random theme each time that oh-my-zsh is loaded.
# See https://github.com/robbyrussell/oh-my-zsh/wiki/Themes
 ZSH_THEME=""

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
  ;;
  Linux)
    . ~/z.sh
    unsetopt BG_NICE # fixes "zsh: nice(5) failed: operation not permitted" issue when running z on WSL
    # commands for Linux go here
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
alias sn="vim -c SimplenoteList"
alias todo="vim -c 'SimplenoteOpen deb32885f0aa11e7806ccd64099eb044'"

# taken from https://stackoverflow.com/questions/3964068/zsh-automatically-run-ls-after-every-cd
function chpwd() 
{
    emulate -L zsh
    ls -a
}

#change format for time
HISTTIMEFORMAT="%F %R%z "

#change prompt
#taken from http://aperiodic.net/phil/prompt/prompt.txt
function precmd {

    local TERMWIDTH
    (( TERMWIDTH = ${COLUMNS} - 1 ))


    ###
    # Truncate the path if it's too long.
    
    PR_FILLBAR=""
    PR_PWDLEN=""
    
    local promptsize=${#${(%):---(%n@%m:%l)---()--}}
    local pwdsize=${#${(%):-%~}}
    
    if [[ "$promptsize + $pwdsize" -gt $TERMWIDTH ]]; then
	    ((PR_PWDLEN=$TERMWIDTH - $promptsize))
    else
	PR_FILLBAR="\${(l.(($TERMWIDTH - ($promptsize + $pwdsize)))..${PR_HBAR}.)}"
    fi
}


setopt extended_glob
preexec () {
    if [[ "$TERM" == "screen" ]]; then
	local CMD=${1[(wr)^(*=*|sudo|-*)]}
	echo -n "\ek$CMD\e\\"
    fi
}


setprompt () {
    ###
    # Need this so the prompt will work.

    setopt prompt_subst


    ###
    # See if we can use colors.

    autoload colors zsh/terminfo
    if [[ "$terminfo[colors]" -ge 8 ]]; then
	colors
    fi
    for color in RED GREEN YELLOW BLUE MAGENTA CYAN WHITE; do
	eval PR_$color='%{$terminfo[bold]$fg[${(L)color}]%}'
	eval PR_LIGHT_$color='%{$fg[${(L)color}]%}'
	(( count = $count + 1 ))
    done
    PR_NO_COLOUR="%{$terminfo[sgr0]%}"


    ###
    # See if we can use extended characters to look nicer.
    
    typeset -A altchar
    set -A altchar ${(s..)terminfo[acsc]}
    PR_SET_CHARSET="%{$terminfo[enacs]%}"
    PR_SHIFT_IN="%{$terminfo[smacs]%}"
    PR_SHIFT_OUT="%{$terminfo[rmacs]%}"
    PR_HBAR=${altchar[q]:--}
    PR_ULCORNER=${altchar[l]:--}
    PR_LLCORNER=${altchar[m]:--}
    PR_LRCORNER=${altchar[j]:--}
    PR_URCORNER=${altchar[k]:--}

    
    ###
    # Decide if we need to set titlebar text.
    
    case $TERM in
	xterm*)
	    PR_TITLEBAR=$'%{\e]0;%(!.-=*[ROOT]*=- | .)%n@%m:%~ | ${COLUMNS}x${LINES} | %y\a%}'
	    ;;
	screen)
	    PR_TITLEBAR=$'%{\e_screen \005 (\005t) | %(!.-=[ROOT]=- | .)%n@%m:%~ | ${COLUMNS}x${LINES} | %y\e\\%}'
	    ;;
	*)
	    PR_TITLEBAR=''
	    ;;
    esac
    
    
    ###
    # Decide whether to set a screen title
    if [[ "$TERM" == "screen" ]]; then
	PR_STITLE=$'%{\ekzsh\e\\%}'
    else
	PR_STITLE=''
    fi
    
    ###
    # Finally, the prompt.


    PROMPT='$PR_SET_CHARSET$PR_STITLE${(e)PR_TITLEBAR}\
$PR_WHITE$PR_SHIFT_IN$PR_ULCORNER$PR_WHITE$PR_HBAR$PR_SHIFT_OUT(\
$PR_RED%(!.%SROOT%s.%n)$PR_RED@%m:%l\
$PR_WHITE)$PR_SHIFT_IN$PR_HBAR$PR_WHITE$PR_HBAR${(e)PR_FILLBAR}$PR_WHITE$PR_HBAR$PR_SHIFT_OUT(\
$PR_RED%$PR_PWDLEN<...<%~%<<\
$PR_WHITE)$PR_SHIFT_IN$PR_HBAR$PR_WHITE$PR_URCORNER$PR_SHIFT_OUT\

$PR_WHITE$PR_SHIFT_IN$PR_LLCORNER$PR_WHITE$PR_HBAR$PR_SHIFT_OUT(\
%(?..$PR_LIGHT_RED%?$PR_WHITE:)\
${(e)PR_APM}$PR_YELLOW%D{%H:%M}\
$PR_WHITE:%(!.$PR_RED.$PR_WHITE)%#$PR_WHITE)$PR_SHIFT_IN$PR_HBAR$PR_SHIFT_OUT\
$PR_WHITE$PR_SHIFT_IN$PR_HBAR$PR_SHIFT_OUT\
$PR_NO_COLOUR '

    RPROMPT=' $PR_WHITE$PR_SHIFT_IN$PR_HBAR$PR_WHITE$PR_HBAR$PR_SHIFT_OUT\
($PR_YELLOW%D{%a,%b%d}$PR_WHITE)$PR_SHIFT_IN$PR_HBAR$PR_WHITE$PR_LRCORNER$PR_SHIFT_OUT$PR_NO_COLOUR'

    PS2='$PR_WHITE$PR_SHIFT_IN$PR_HBAR$PR_SHIFT_OUT\
$PR_WHITE$PR_SHIFT_IN$PR_HBAR$PR_SHIFT_OUT(\
$PR_RED%_$PR_WHITE)$PR_SHIFT_IN$PR_HBAR$PR_SHIFT_OUT\
$PR_WHITE$PR_SHIFT_IN$PR_HBAR$PR_SHIFT_OUT$PR_NO_COLOUR '
}

setprompt
