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
  helm
  fzf-tab
)
source $ZSH/oh-my-zsh.sh

export PATH="$HOME/Android/Sdk/platform-tools/:/usr/share/virtualenvwrapper/:$HOME/work/vaticle/tools/:$PATH"


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
alias pbcopy='xsel --clipboard --input'
alias pbpaste='xsel --clipboard --output'
alias vi='nocorrect nvim'
alias J8='sudo update-java-alternatives -s java-1.8.0-openjdk-amd64'
alias J11='sudo update-java-alternatives -s java-1.11.0-openjdk-amd64'
alias fd=fdfind
alias bat=batcat
alias e="fd --type=f | fzf --bind 'enter:execute(nvim {1})+abort' || true"
alias ec="fd --type=f | fzf --bind 'enter:execute(batcat {1})+abort' || true"
alias size="du -d1 -h"
alias docker-images-gc="docker image ls --format='{{ .ID }}' | xargs docker image rm -f"

# Created by `userpath` on 2020-11-20 19:33:45
export PATH="$PATH:/home/vmax/.local/bin"

bindkey -s '^T' ' e\n'


export NVM_DIR="$([ -z "${XDG_CONFIG_HOME-}" ] && printf %s "${HOME}/.nvm" || printf %s "${XDG_CONFIG_HOME}/nvm")"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh" # This loads nvm

export PATH="$HOME/.pyenv/bin:$PATH"
eval "$(pyenv init -)"
eval "$(pyenv virtualenv-init -)"

