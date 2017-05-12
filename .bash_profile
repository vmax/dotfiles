export PATH="$HOME/.fastlane/bin:$PATH:$HOME/chunkwm/bin/"
export RANGER_LOAD_DEFAULT_RC='FALSE'

export HISTFILESIZE=-1
export HISTCONTROL=ignoreboth
export HISTIGNORE='l:ls:fg:history:h:hs:bconf:vconf:td'

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
alias git='alias_msg g git'
alias gp='g push'
alias h='\history'
alias hs='\history | grep --color=auto '
alias history='alias_msg h history'
alias ipython='alias_msg p ipython'
alias l="\ls -G1l"
alias ls='alias_msg l ls'
alias nano='vi'
alias p='\ipython'
alias pp='\python'
alias python='alias_msg pp python'
alias r='\ranger'
alias ranger='alias_msg r ranger'
alias R='\rm -v'
alias rm='alias_msg R rm'
alias td='v ~/TODO.md'
alias v='\vi'
alias vconf='\v ~/.vimrc'
alias vi='alias_msg v vi'
alias vim='alias_msg v vim'
transfer() { if [ $# -eq 0 ]; then echo -e "No arguments specified. Usage:\necho transfer /tmp/test.md\ncat /tmp/test.md | transfer test.md"; return 1; fi 
	tmpfile=$( mktemp -t transferXXX ); if tty -s; then basefile=$(basename "$1" | sed -e 's/[^a-zA-Z0-9._-]/-/g'); curl --progress-bar --upload-file "$1" "https://transfer.sh/$basefile" >> $tmpfile; else curl --progress-bar --upload-file "-" "https://transfer.sh/$1" >> $tmpfile ; fi; cat $tmpfile; rm -f $tmpfile; } 
