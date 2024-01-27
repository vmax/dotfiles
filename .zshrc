ZSH=$HOME/.oh-my-zsh/

ZSH_THEME="dieter"
ENABLE_CORRECTION="true"
COMPLETION_WAITING_DOTS="true"
ZSH_COMPDUMP="${ZSH}/cache/.zcompdump"
SAVEHIST=50000

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


source $HOME/dotfiles/az.completion
source $HOME/dotfiles/ssh.completion


function agr { ag -u -0 -l "$1" | AGR_FROM="$1" AGR_TO="$2" xargs -r0 perl -pi -e 's/$ENV{AGR_FROM}/$ENV{AGR_TO}/g'; }


alias cargo='nocorrect cargo'
alias killall='nocorrect killall'
alias k='nocorrect kubectl'
alias t='git commit --allow-empty -m "Trigger CI" && git push'
alias git-copy-last-commit-message="git log -1 --pretty=%B | tr -d '\n' | pbcopy"
alias git-copy-last-commit-sha="git rev-parse HEAD | tr -d '\n' | pbcopy"
alias e="fd --type=f | fzf --bind 'enter:execute(vim {1})+abort' || true"
alias ec="fd --type=f | fzf --bind 'enter:execute(cat {1})+abort' || true"
function es {
    sk --ansi -i -c 'ag --color "{}"' --preview "$HOME/dotfiles/preview.sh {}"
}
alias docker-images-gc="docker image ls --format='{{ .ID }}' | xargs docker image rm -f"
alias tfp='terraform plan'
alias tfa='terraform apply'
alias tfA='terraform apply -auto-approve'
alias tfo="terraform output -json | jq -r '.|map_values(.value)'"


brew-graph-deps-copy() {
   brew graph --installed --highlight-outdated --highlight-leaves | pbcopy
}

RPROMPT='$(kubectx_prompt_info)'


typeset -U path
path=(
  /usr/share/virtualenvwrapper/
  $HOME/.local/bin
  $HOME/.krew/bin
  $path
)
export PATH


eval "$(direnv hook zsh)"


export VIRTUALENVWRAPPER_PYTHON=`which python3.12`
source /opt/homebrew/bin/virtualenvwrapper_lazy.sh

alias hg='history | grep $1'
alias p1="awk '{print \$1}'"
