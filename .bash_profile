export PATH="/Applications/Postgres.app/Contents/Versions/latest/bin/:$PATH"
export PATH="~/Library/Android/sdk/platform-tools/:$PATH"
export RANGER_LOAD_DEFAULT_RC='FALSE'

export HISTFILESIZE=-1
export HISTCONTROL=ignoreboth
export HISTIGNORE='l:ls:fg:history:h:hs:bconf:vconf:td:night:unnight'

shopt -s histverify
export CDPATH=.:~

function alias_msg {
	echo "$(tput rev)$(tput setaf 1)$1$(tput setaf 0) for $2$(tput sgr 0)"
}

alias amend='\git commit --amend --no-edit'
alias b='\brew'
alias bconf='v ~/.bash_profile && source ~/.bash_profile'
alias bi='b install'
alias brew='alias_msg b brew'
alias bs='b search'
alias cd='alias_msg c cd'
alias c='\cd'
alias cask='b cask'
alias cs='cask search'
alias ci='cask install'
alias Ds='./manage.py shell_plus'
alias g="\git"
alias gA='g add -A'
alias gC='g commit -a && git push'
alias gU='g diff --name-only --diff-filter=U'
alias ga='g add -nA'
alias gc='g commit'
alias gcl='g clone'
alias gco='g checkout'
alias gd='g diff'
alias gf='g fetch -p'
alias gsb='g branch -a|grep'
alias git='alias_msg g git'
alias gp='g push'
alias h='\heroku'
alias hr='\heroku run'
alias hs='\history | grep --color=auto '
alias hide='chflags hidden'
alias ipython='alias_msg p ipython'
alias l="\ls -G1l"
alias ls='alias_msg l ls'
alias nano='vi'
alias night='~/nshift 100 && sleep 2 && ~/brightness 0.01'
alias unnight='~/nshift 0'
alias p='\ipython'
alias pp='\python'
alias python='alias_msg pp python'
alias r='\ranger'
alias ranger='alias_msg r ranger'
alias R='\rm -v'
alias rm='alias_msg R rm'
alias td='v ~/TODO.md'
alias v='\vi'
alias vconf='\vim ~/.vimrc'
alias vi='alias_msg v vi'
alias vim='alias_msg v vim'
transfer() { if [ $# -eq 0 ]; then echo -e "No arguments specified. Usage:\necho transfer /tmp/test.md\ncat /tmp/test.md | transfer test.md"; return 1; fi 
	tmpfile=$( mktemp -t transferXXX ); if tty -s; then basefile=$(basename "$1" | sed -e 's/[^a-zA-Z0-9._-]/-/g'); curl --progress-bar --upload-file "$1" "https://transfer.sh/$basefile" >> $tmpfile; else curl --progress-bar --upload-file "-" "https://transfer.sh/$1" >> $tmpfile ; fi; cat $tmpfile; echo; command rm -f $tmpfile; } 
