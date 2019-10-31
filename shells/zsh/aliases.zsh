alias tnc="ping -c 1 8.8.8.8 -t 1 | grep '0.0% \| 100.0%'"

# TODO: Figure out how to load based on OS

# *nix
# alias o="xdg-open"

# MacOS
alias o="open"
alias o.="open ."

alias e="vim"
alias q="exit"

alias grd="git add . && git commit -am \"fast update\" && git push"
alias gs="git status"

alias r="ranger"

alias rgrep="ag -il 'first' | xargs ag -il 'second' | xargs ag -il 'third'"

alias c="clear"

alias st="wget -O /dev/null http://speedtest.wdc01.softlayer.com/downloads/test10.zip"

alias vir="vi -- *(D.om[1])"

alias t="tree"

