#
# Executes commands at the start of an interactive session.
#
# Authors:
#   Sorin Ionescu <sorin.ionescu@gmail.com>
#

# Source Prezto.
if [[ -s "${ZDOTDIR:-$HOME}/.zprezto/init.zsh" ]]; then
  source "${ZDOTDIR:-$HOME}/.zprezto/init.zsh"
fi

# Customize to your needs...

export PATH=/usr/local/bin:${PATH}
export MANPATH=/usr/local/share/man:${MANPATH}
export PATH=/usr/local/opt/coreutils/libexec/gnubin:${PATH}
export MANPATH=/usr/local/opt/coreutils/libexec/gnuman:${MANPATH}

export PATH=/usr/local/opt/python/libexec/bin:${PATH}


export EDITOR=vim
export PATH=$PATH:~/.local/bin
eval "$(direnv hook zsh)"
eval `dircolors ~/.colorrc`
eval "$(nodenv init -)"

fpath=(/usr/local/share/zsh-completions $fpath)
fpath=(~/.zsh/completions $fpath)

export LANG=ja_JP.UTF-8
export TERM=xterm-256color
autoload -Uz colors
colors
HISTFILE=~/.zsh_history
HISTSIZE=1000000
SAVEHIST=1000000

autoload -Uz select-word-style
select-word-style default

zstyle ':zle:*' word-chars " /=;@:{},|"
zstyle ':zle:*' word-style unspecified

autoload -U compinit
compinit

zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}'

zstyle ':completion:*' ignore-parents parent pwd ..

zstyle ':completion:*:sudo:*' command-path /usr/local/sbin /usr/local/bin \
                   /usr/sbin /usr/bin /sbin /bin /usr/X11R6/bin

zstyle ':completion:*:processes' command 'ps x -o pid,s,args'

# vcs_info
autoload -Uz vcs_info
autoload -Uz add-zsh-hook

zstyle ':vcs_info:*' formats '%F{green}(%s)-[%b]%f'
zstyle ':vcs_info:*' actionformats '%F{red}(%s)-[%b|%a]%f'

setopt print_eight_bit
setopt no_beep
setopt no_flow_control
setopt ignore_eof
setopt interactive_comments
setopt auto_cd
setopt auto_pushd
setopt pushd_ignore_dups
setopt share_history
setopt hist_ignore_all_dups
setopt hist_ignore_space
setopt hist_reduce_blanks
setopt extended_glob

alias la='ls -a'
alias ll='ls -l'
alias rm=' rm -i'
alias cp='cp -i'
alias mv='mv -i'
alias mkdir='mkdir -p'
alias l="ls"
alias cd..="cd .."
alias s="ls"
alias zsh="zsh"
# cdでディレクトリ移動後にlsを実行
function chpwd() { ls -F --color=auto }

alias ls='ls -F --color=auto'


[[ -z "$TMUX" && ! -z "$PS1" && ! $TERM_PROGRAM = "vscode" ]] && exec tmux
alias tmux-copy="tmux save-buffer - | pbcopy"


export PATH="$HOME/.yarn/bin:$HOME/.config/yarn/global/node_modules/.bin:$PATH"
export PATH="$HOME/.yarn/bin:$HOME/.config/yarn/global/node_modules/.bin:$PATH"
