# Path to your oh-my-zsh installation.
ZSH=$HOME/.oh-my-zsh/

ZSH_THEME="minimal"
DISABLE_AUTO_UPDATE="true"

# TODO: load 'fedora' plugin only in fedora, 'archlinux' ony on archlinux
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

# That's why we can't have nice things:
# Fedora keeps 'mc-wrapper.sh' in 'libexec', but Arch in 'lib'
if [[ -a /usr/lib/mc/mc-wrapper.sh ]];
then
  alias mc=". /usr/lib/mc/mc-wrapper.sh"
fi

if [[ -a /usr/libexec/mc/mc-wrapper.sh ]];
then
  alias mc=". /usr/libexec/mc/mc-wrapper.sh"
fi

unset GREP_OPTIONS
alias grep="grep --color=auto"
alias ls="ls --color -h --group-directories-first"
alias ll="ls -l"
alias la="ll -a"
alias l.="ls -a"
alias dls="ls --hide=\*.{,l}{o,a}"
alias cat="lolcat -t"

fortune | cowsay | lolcat -t
