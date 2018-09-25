# == source-dependency ==
source ~/dotfiles/zsh/history.zsh
source ~/dotfiles/zsh/variables.zsh
source ~/dotfiles/zsh/aliases.zsh
source ~/dotfiles/zsh/functions.zsh
source ~/dotfiles/zsh/prompt.zsh
source ~/dotfiles/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source ~/dotfiles/zsh-history-substring-search/zsh-history-substring-search.zsh

set -o emacs

### Added by the Heroku Toolbelt
export PATH="/usr/local/heroku/bin:$PATH"

alias hsr="/Volumes/code/monterail/hussar/bin/hsr"

# docker
# eval $(docker-machine env)
# atlas
export ATLAS_TOKEN=4pS8WZJM4zzmNQ.atlasv1.kgO8QnwZSDbF6FJMwi2t6YEzfRtUBVRyaqySiiPgiqUvJHOMiBjhmIDiI5cbSXgeseo

# solarcapture-docker
export PATH="/Volumes/code/monterail/sf/solarcapture-docker/kubernetes:$PATH"

# export GEMFILE_RUBY=2.5.0
#. $HOME/.asdf/asdf.sh
#. $HOME/.asdf/completions/asdf.bash

eval "$(nodenv init -)"
eval "$(pyenv init -)"
export GPG_TTY=$(tty)
