ZSH=$HOME/.oh-my-zsh/

ZSH_THEME="dieter"
ENABLE_CORRECTION="true"
COMPLETION_WAITING_DOTS="true"

plugins=(
  aws
  git
  z
  kubectl
  django
  docker
  docker-compose
)
source $ZSH/oh-my-zsh.sh

export PATH="$HOME/.fastlane/bin:$HOME/work/GraknLabs/tools/:$PATH"

brew-graph-deps() {
   tempfile=$(mktemp); brew graph --installed --highlight-outdated --highlight-leaves | dot -Tsvg > $tempfile; mv $tempfile $tempfile.svg; open -a "Google Chrome.app" $tempfile.svg 
}

#export USE_BAZEL_VERSION=0.29.1

alias bazel='nocorrect bazel'

export WORKON_HOME=~/.virtualenvs/
export VIRTUALENVWRAPPER_PYTHON=$(which python3)
source /usr/local/bin/virtualenvwrapper_lazy.sh

export PATH="$HOME/.jenv/bin:$PATH"
eval "$(jenv init -)"

