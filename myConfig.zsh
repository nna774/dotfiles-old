# like emacs 
bindkey -e

# use history
HISTFILE=~/.zsh_history
HISTSIZE=1000000
SAVEHIST=1000000

## show git branch
setopt prompt_subst
function branchString() {
    local br=`git symbolic-ref HEAD 2>/dev/null | sed -e "s/.*\/\(.*\)/\1/g"`
    echo -n $br
}

function branchShow() {
    local bs=$(branchString)
    if [ -n "$bs" ] ;then
       echo -n \($bs\)
    else
       echo -n
    fi
}

# use colorful zsh
autoload -Uz colors
colors

# prompt
PROMPT="%{${fg[red]}%}[%n@%m($(date +"%H:%M"))]%{${reset_color}%} %~%{${fg[blue]}%}$(branchShow)%{${reset_color}%} %{${fg[green]}%}%(?..[%?] )%{${reset_color}%}
%{${fg[green]}%} $ %{${reset_color}%}"

# complete
autoload -Uz compinit
compinit -u
zstyle ':completion:*' verbose yes
zstyle ':completion:*:default' menu select=1
zstyle ':completion:*:sudo:*' command-path /usr/local/sbin /usr/local/bin \
                   /usr/sbin /usr/bin /sbin /bin /usr/X11R6/bin

# $LS_COLORS
if [ "$LS_COLORS" -a -f /etc/DIR_COLORS ]; then
  eval $(dircolors /etc/DIR_COLORS)
fi
zstyle ':completion:*' list-colors "${LS_COLORS}" # 補完候補のカラー表示

# complete when ps 
zstyle ':completion:*:processes' command 'ps x -o pid,s,args'

# Japanese
setopt print_eight_bit

# cd
setopt auto_cd 
setopt auto_pushd
setopt pushd_ignore_dups
  
setopt auto_menu

# ls after cd
function cd() {
  builtin cd $@ && ls --color=auto;
}

# ignore case
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}'

# redirect UWAGAKI KINSHI
setopt no_clobber

# Add PATH
PATH="$PATH":~/.cabal/bin

###
export EDITOR="nano -w"

### C-u は誤爆しかしない
bindkey -r "\C-u"

###
export LANG=ja_JP.UTF-8

PATH=~/.cabal/bin:$PATH
PATH=~/local/bin:$PATH

agent="$HOME/.ssh/agent"
if [ -S "$SSH_AUTH_SOCK" ]; then
    case $SSH_AUTH_SOCK in
    /tmp/*/agent.[0-9]*)
        ln -snf "$SSH_AUTH_SOCK" $agent && export SSH_AUTH_SOCK=$agent
    esac
elif [ -S $agent ]; then
    export SSH_AUTH_SOCK=$agent
else
    eval `ssh-agent`
    ln -snf "$SSH_AUTH_SOCK" $agent && export SSH_AUTH_SOCK=$agent
fi
