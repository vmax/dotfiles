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

_transfer(){ if [ $# -eq 0 ];then echo "No arguments specified.\nUsage:\n transfer <file|directory>\n ... | transfer <file_name>">&2;return 1;fi;if tty -s;then file="$1";file_name=$(basename "$file");if [ ! -e "$file" ];then echo "$file: No such file or directory">&2;return 1;fi;if [ -d "$file" ];then file_name="$file_name.zip" ,;(cd "$file"&&zip -r -q - .)|curl --progress-bar --upload-file "-" "http://transfer.sh/$file_name"|tee /dev/null,;else cat "$file"|curl --progress-bar --upload-file "-" "http://transfer.sh/$file_name"|tee /dev/null;fi;else file_name=$1;curl --progress-bar --upload-file "-" "http://transfer.sh/$file_name"|tee /dev/null;fi;}

function transfer { _transfer "$*" | xsel --clipboard --input }

function encrypt { openssl enc -aes-256-cbc -pbkdf2 -in "$1" -out "$1.enc" }


alias bazel='nocorrect bazel'
alias cargo='nocorrect cargo'
alias killall='nocorrect killall'
alias t='git commit --allow-empty -m "Trigger CI" && git push'
alias git-copy-last-commit-message="git log -1 --pretty=%B | tr -d '\n' | pbcopy"
alias git-copy-last-commit-sha="git rev-parse HEAD | tr -d '\n' | pbcopy"
alias J8='sudo update-java-alternatives -s java-1.8.0-openjdk-amd64'
alias J11='sudo update-java-alternatives -s java-1.11.0-openjdk-amd64'
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

. <(flux completion zsh)
