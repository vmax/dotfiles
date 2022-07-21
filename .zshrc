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
  z
  kubectl
  kubectx
  helm
  poetry
  fzf-tab
)

eval "$(/opt/homebrew/bin/brew shellenv)"
FPATH="$(brew --prefix)/share/zsh/site-functions:${FPATH}"

source $ZSH/oh-my-zsh.sh

export PATH="/opt/homebrew/opt/node@14/bin/:/Users/vmax/Library/Python/3.8/bin:/usr/share/virtualenvwrapper/:$HOME/.local/bin:$HOME/.pulumi/bin:$PATH"


export WORKON_HOME=~/.virtualenvs/
export VIRTUALENVWRAPPER_PYTHON=$(which python3)
source virtualenvwrapper_lazy.sh

source $HOME/dotfiles/az.completion
source $HOME/dotfiles/ssh.completion


function agr { ag -0 -l "$1" | AGR_FROM="$1" AGR_TO="$2" xargs -r0 perl -pi -e 's/$ENV{AGR_FROM}/$ENV{AGR_TO}/g'; }


alias cargo='nocorrect cargo'
alias killall='nocorrect killall'
alias t='git commit --allow-empty -m "Trigger CI" && git push'
alias git-copy-last-commit-message="git log -1 --pretty=%B | tr -d '\n' | pbcopy"
alias git-copy-last-commit-sha="git rev-parse HEAD | tr -d '\n' | pbcopy"
alias e="fd --type=f | fzf --bind 'enter:execute(vim {1})+abort' || true"
alias ec="fd --type=f | fzf --bind 'enter:execute(cat {1})+abort' || true"
function es {
    sk --ansi -i -c 'ag --color "{}"' --preview "$HOME/preview.sh {}"
}
alias size="du -d1 -h"
alias docker-images-gc="docker image ls --format='{{ .ID }}' | xargs docker image rm -f"



export PATH="$HOME/.poetry/bin:$PATH"

eval "$(mcfly init zsh)"

if [[ "$(defaults read -g AppleInterfaceStyle 2&>/dev/null)" != "Dark" ]]; then
    export MCFLY_LIGHT=TRUE
fi

export MCFLY_FUZZY=2


RPROMPT='$(kubectx_prompt_info)'

source $HOME/dotfiles/mapping.zsh


export PYENV_ROOT="$HOME/.pyenv"
eval "$(pyenv init -)"

export AWS_REGION=us-east-1

export PATH="${PATH}:${HOME}/.krew/bin"
