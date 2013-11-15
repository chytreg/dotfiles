# == aliases ==
alias s="subl ."
alias ls="ls -GF"
alias l="ls -GFalh"
alias dt="tail -F -n 0 log/development.log"
alias rt="touch tmp/restart.txt"
alias grep="grep --color"
alias jsonp="ruby -r json -e 'puts JSON.pretty_generate(JSON.parse(readlines.join))'"
alias g="git"
alias gpsh="g up; g push"
