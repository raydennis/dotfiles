# powerlevel10k theme
source /usr/local/opt/powerlevel10k/powerlevel10k.zsh-theme

# set vim keybindings (seems to break when used with oh-my-zsh)
set -o vi

autoload -U compinit
compinit -u

# completions for zsh
# Make completion:
# - Case-insensitive.
# - Accept abbreviations after . or _ or - (ie. f.b -> foo.bar).
# - Substring complete (ie. bar -> foobar).
zstyle ':completion:*' matcher-list 'm:{[:lower:][:upper:]}={[:upper:][:lower:]}' 'r:|[._-]=* r:|=*' 'l:|=* r:|=*'

#
# Correction
#

# exceptions to auto-correction
alias bundle='nocorrect bundle'
alias cabal='nocorrect cabal'
alias man='nocorrect man'
alias mkdir='nocorrect mkdir'
alias mv='nocorrect mv'
alias stack='nocorrect stack'
alias sudo='nocorrect sudo'
alias ps='nocorrect ps'
alias docker='nocorrect docker'
alias wnotes='nocorrect wnotes'
alias wnotes='nocorrect wnotes'
alias vagrant='nocorrect vagrant'
alias local='nocorrect local'

#
# History
#
export HISTSIZE=100000
export HISTFILE="$HOME/.zsh_history"
export SAVEHIST=$HISTSIZE

#
# Options
#
setopt autocd               # .. is shortcut for cd .. (etc)
setopt autoparamslash       # tab completing directory appends a slash
setopt autopushd            # cd automatically pushes old dir onto dir stack
setopt clobber              # allow clobbering with >, no need to use >!
setopt correct              # command auto-correction
setopt correctall           # argument auto-correction
setopt noflowcontrol        # disable start (C-s) and stop (C-q) characters
setopt nonomatch            # unmatched patterns are left unchanged
setopt histignorealldups    # filter duplicates from history
setopt histignorespace      # don't record commands starting with a space
setopt histverify           # confirm history expansion (!$, !!, !foo)
setopt ignoreeof            # prevent accidental C-d from exiting shell
setopt interactivecomments  # allow comments, even in interactive shells
setopt printexitvalue       # for non-zero exit status
setopt pushdignoredups      # don't push multiple copies of same dir onto stack
setopt pushdsilent          # don't print dir stack after pushing/popping
setopt sharehistory         # share history across shells

#
# Alias
#
alias :q="exit"
alias q="exit"
alias c="clear"
alias cls="clear && ls"
alias e="vim"
alias gp="git pull && git push"
alias grd="git add . && git commit -am \"fast update\" && git push"
alias gs="git status"
alias ll="ls -Glha"
alias ls="ls -G"
alias f=". ranger"
alias rgrep="ag -il 'first' | xargs ag -il 'second' | xargs ag -il 'third'"
alias st="wget -O /dev/null http://speedtest.wdc01.softlayer.com/downloads/test10.zip"
alias tg="terraform graph -draw-cycles -type=plan | dot -Tsvg > graph.svg && open graph.svg"
alias ti="terraform init"
alias tnc="ping -c 1 8.8.8.8 -t 1 | grep '0.0% \| 100.0%'"
alias tp="terraform plan -compact-warnings"
alias v="vim"
alias vino="vim -u NONE"
alias vir="vi -- *(D.om[1])"

#
# Bindings
#
bindkey '^x^x' edit-command-line
bindkey ' ' magic-space # do history expansion on space
autoload -U edit-command-line
zle -N edit-command-line

# 
# OS specific
#
case `uname` in
  Darwin)
    # commands for OS X go here
    # setup alias for MacVim
    alias vim='nvim'
    # setup "Z" on MACOS
    # brew install z
    . `brew --prefix`/etc/profile.d/z.sh
    # date alias on osX
    local LASTWEEK=$(date -j -v-1w +"%Y-%m-%d")
    # brew install zsh-syntax-highlighting
    source /usr/local/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
    # brew install zsh-autosuggestions
    source /usr/local/share/zsh-autosuggestions/zsh-autosuggestions.zsh
    alias o="open"
    alias o.="open ."
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
    source ~/.zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
    source ~/.zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh
    alias o="xdg-open"
    alias ll="ls -Glha --color=auto"
    alias ls="ls -G --color=auto"
  ;;
  FreeBSD)
    # commands for FreeBSD go here
  ;;
esac

#
# FZF
#
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
# fzf
export FZF_DEFAULT_COMMAND='ag --hidden --ignore .git -g ""'
# fe [FUZZY PATTERN] - Open the selected file with the default editor
#   - Bypass fuzzy finder if there's only one match (--select-1)
#   - Exit if there's no match (--exit-0)
fe() {
  local files
  IFS=$'\n' files=($(fzf-tmux --query="$1" --multi --select-1 --exit-0))
  [[ -n "$files" ]] && ${EDITOR:-nvim} "${files[@]}"
}
# Modified version where you can press
#   - CTRL-O to open with `open` command,
#   - CTRL-E or Enter key to open with the $EDITOR
fo() {
  local out file key
  IFS=$'\n' out=("$(fzf-tmux --query="$1" --exit-0 --expect=ctrl-o,ctrl-e)")
  key=$(head -1 <<< "$out")
  file=$(head -2 <<< "$out" | tail -1)
  if [ -n "$file" ]; then
    [ "$key" = ctrl-o ] && open "$file" || ${EDITOR:-vim} "$file"
  fi
}
fp(){
  fzf --preview="cat {}" --preview-window=right:70%:wrap
}
#
# search using ag on multiple keywords recursively
#
function agr() {
    if [ -n "$3" ]
    then
        Ag -il $1 | xargs ag -il $2 | xargs ag -il $3
    elif [ -n "$2" ]
    then
        Ag -il $1 | xargs ag -il $2
    fi
}

#
# Make CTRL-Z background things and unbackground them.
#
function fg-bg() {
  if [[ $#BUFFER -eq 0 ]]; then
    fg
  else
    zle push-input
  fi
}
zle -N fg-bg
bindkey '^Z' fg-bg

#
# Hooks
#
autoload -U add-zsh-hook
function set-tab-and-window-title() {
  emulate -L zsh
  local CMD="${1:gs/$/\\$}"
  print -Pn "\e]0;$CMD:q\a"
}
function update-window-title-precmd() {
  emulate -L zsh
  set-tab-and-window-title `history | tail -1 | cut -b8-`
}
add-zsh-hook precmd update-window-title-precmd
function update-window-title-preexec() {
  emulate -L zsh
  setopt extended_glob
  # skip ENV=settings, sudo, ssh; show first distinctive word of command;
  # mostly stolen from:
  #   https://github.com/robbyrussell/oh-my-zsh/blob/master/lib/termsupport.zsh
  set-tab-and-window-title ${2[(wr)^(*=*|mosh|ssh|sudo)]}
}
add-zsh-hook preexec update-window-title-preexec
typeset -F SECONDS
function record-start-time() {
  emulate -L zsh
  ZSH_START_TIME=${ZSH_START_TIME:-$SECONDS}
}
add-zsh-hook preexec record-start-time
function report-start-time() {
  emulate -L zsh
  if [ $ZSH_START_TIME ]; then
    local DELTA=$(($SECONDS - $ZSH_START_TIME))
    local DAYS=$((~~($DELTA / 86400)))
    local HOURS=$((~~(($DELTA - $DAYS * 86400) / 3600)))
    local MINUTES=$((~~(($DELTA - $DAYS * 86400 - $HOURS * 3600) / 60)))
    local SECS=$(($DELTA - $DAYS * 86400 - $HOURS * 3600 - $MINUTES * 60))
    local ELAPSED=''
    test "$DAYS" != '0' && ELAPSED="${DAYS}d"
    test "$HOURS" != '0' && ELAPSED="${ELAPSED}${HOURS}h"
    test "$MINUTES" != '0' && ELAPSED="${ELAPSED}${MINUTES}m"
    if [ "$ELAPSED" = '' ]; then
      SECS="$(print -f "%.2f" $SECS)s"
    elif [ "$DAYS" != '0' ]; then
      SECS=''
    else
      SECS="$((~~$SECS))s"
    fi
    ELAPSED="${ELAPSED}${SECS}"
    local ITALIC_ON=$'\e[3m'
    local ITALIC_OFF=$'\e[23m'
    export RPROMPT="%F{cyan}%{$ITALIC_ON%}${ELAPSED}%{$ITALIC_OFF%}%f $RPROMPT_BASE"
    unset ZSH_START_TIME
  else
    export RPROMPT="$RPROMPT_BASE"
  fi
}
add-zsh-hook precmd report-start-time

#
# auto ls after a cd
#
function auto-ls-after-cd() {
  emulate -L zsh
  # Only in response to a user-initiated `cd`, not indirectly (eg. via another
  # function).
  if [ "$ZSH_EVAL_CONTEXT" = "toplevel:shfunc" ]; then
    ls -a
  fi
}
add-zsh-hook chpwd auto-ls-after-cd


# 
# Path
#
export PATH="$HOME/.yarn/bin:$HOME/.config/yarn/global/node_modules/.bin:$PATH"
export PATH="/usr/local/sbin:$PATH"
export PATH="/usr/local/sbin/terraform-lsp:$PATH"
export PATH="/ascldap/users/rsdenni/.nvm/versions/node/v8.12.0/bin:$PATH"

#
# Go development
#

export GOPATH="${HOME}/.go"
export GOROOT="$(brew --prefix golang)/libexec"
export PATH="$PATH:${GOPATH}/bin:${GOROOT}/bin"
test -d "${GOPATH}" || mkdir "${GOPATH}"
test -d "${GOPATH}/src/github.com" || mkdir -p "${GOPATH}/src/github.com"

#
# Mage
#
export MAGEFILE_ENABLE_COLOR=1 # magefile to print the list of target when you run mage or mage -l in ANSI colors.
export MAGEFILE_IGNOREDEFAULT=1 # tells the compiled magefile to ignore the default target and print the list of targets when you run mage.


# env vars
source ~/Repositories/Azure/Sandia/dotfiles/shells/zsh/.env
export OBJC_DISABLE_INITIALIZE_FORK_SAFETY=YES

export TERM="xterm-256color"

autoload -U +X bashcompinit && bashcompinit
complete -o nospace -C /usr/local/bin/terraform terraform

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
