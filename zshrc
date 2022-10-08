# Path to your oh-my-zsh installation.
ZSH=$HOME/.oh-my-zsh/

ZSH_THEME="minimal"
DISABLE_AUTO_UPDATE="true"

plugins=(colored-man-pages copydir copyfile git)

source $ZSH/oh-my-zsh.sh

# You may need to manually set your language environment
# export LANG=en_US.UTF-8
# Lines configured by zsh-newuser-install
HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=4096
setopt appendhistory autocd extendedglob notify
bindkey -e
# End of lines configured by zsh-newuser-install
# The following lines were added by compinstall
zstyle :compinstall filename "$HOME/.zshrc"

autoload -Uz compinit
compinit

alias mc=". /usr/lib/mc/mc-wrapper.sh"

unset GREP_OPTIONS
alias grep="grep --color=auto"
alias ls="ls --color -h --group-directories-first"
alias ll="ls -l"
alias la="ll -a"
alias l.="ls -a"
alias dls="ls --hide=\*.{,l}{o,a}"
alias cat="lolcat -t"
alias vim=nvim

# pip zsh completion start
function _pip_completion {
  local words cword
  read -Ac words
  read -cn cword
  reply=( $( COMP_WORDS="$words[*]" \
             COMP_CWORD=$(( cword-1 )) \
             PIP_AUTO_COMPLETE=1 $words[1] 2>/dev/null ))
}
compctl -K _pip_completion pip
# pip zsh completion end

typeset -aU path
path+="$GOPATH/bin"
path+=$(ruby -e "print Gem::user_dir + '/bin'")
path+="$HOME/.local/bin"

fortune | cowsay | lolcat -t
