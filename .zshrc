ZSH=$HOME/.oh-my-zsh/

ZSH_THEME="dieter"
ENABLE_CORRECTION="true"
COMPLETION_WAITING_DOTS="true"

# collect history from shells running in parallels
setopt APPEND_HISTORY
# never store same command twice
setopt HIST_IGNORE_ALL_DUPS
# trim multiple spaces in commands
setopt HIST_REDUCE_BLANKS
# `history` command invocation is not stored in history
setopt HIST_NO_STORE

plugins=(
  aws
  git
  z
  kubectl
  django
  docker
  docker-compose
  globalias
)
source $ZSH/oh-my-zsh.sh

export PATH="$HOME/.poetry/bin:$HOME/work/graknlabs/tools/:$PATH"

brew-graph-deps() {
   tempfile=$(mktemp); brew graph --installed --highlight-outdated --highlight-leaves | dot -Tsvg > $tempfile; mv $tempfile $tempfile.svg; open -a "Google Chrome.app" $tempfile.svg 
}

alias bazel='nocorrect bazel'

export WORKON_HOME=~/.virtualenvs/
export VIRTUALENVWRAPPER_PYTHON=$(which python3)
source /usr/share/virtualenvwrapper/virtualenvwrapper_lazy.sh

source $HOME/dotfiles/az.completion

alias t='git commit --allow-empty -m triggerCI && git push'
