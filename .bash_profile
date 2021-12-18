export PATH="/Applications/Postgres.app/Contents/Versions/latest/bin/:$PATH"
export PATH="~/Library/Android/sdk/platform-tools/:$HOME:$PATH"

. ~/.fastlane/completions/completion.sh

export HISTFILESIZE=-1
export HISTCONTROL=ignoreboth
export HISTIGNORE='l:ls:fg:history:h:hs:bconf:vconf:td:night:unnight'

shopt -s histverify
export CDPATH=.:~

function alias_msg {
	echo "$(tput rev)$(tput setaf 1)$1$(tput setaf 0) for $2$(tput sgr 0)"
}

alias apm-ls='adb shell pm list packages'
alias apm-rm='adb shell pm uninstall -k --user 0'
alias amend='\git commit --amend --no-edit'
alias b='\brew'
alias bconf='v ~/.bash_profile && source ~/.bash_profile'
alias bi='b install'
alias bs='b search'
alias c='\cd'
alias cask='b cask'
alias cs='cask search'
alias ci='cask install'
alias fp='\yapf --in-place'
alias fpa='gd --name-only | grep py | xargs ls'
alias fpA='gd --name-only | grep py | xargs yapf --in-place'
alias Ds='./manage.py shell_plus'
alias g="\git"
alias gA='g add -A'
alias gC='g commit -a && git push'
alias gU='g diff --name-only --diff-filter=U'
alias ga='g add -nA'
alias gb='g branch'
alias gbD='g branch -D'
alias gc='g commit'
alias gcl='g clone'
alias gco='g checkout'
alias gd='g diff --relative'
alias gf='g fetch -p'
alias gsb='g branch -a|grep'
alias gp='g push'
alias gpu='g push -u origin HEAD 2>&1 | urlview'
alias h='\heroku'
alias hr='\heroku run'
alias hs='\history | grep --color=auto '
alias hide='chflags hidden'
alias l="\ls -G1l"
alias nano='vi'
alias night='~/nshift 100 && sleep 2 && ~/brightness 0.01'
alias unnight='~/nshift 0'
alias p='\ipython'
alias pp='\python'
