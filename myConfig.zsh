# use colorful zsh
autoload -Uz colors
colors

# like emacs 
bindkey -e

# use history
HISTFILE=~/.zsh_history
HISTSIZE=1000000
SAVEHIST=1000000

# prompt
PROMPT="%{${fg[red]}%}[%n@%m]%{${reset_color}%} %~
%{${fg[green]}%} $ %{${reset_color}%} "
# moshikashite
#SPROMPT="%{$fg[red]%}%{$suggest%}(*'~'%)? < もしかして %B%r%b %{$fg[red]%}かな? [そう!(y), 違う!(n),a,e]:${reset_color} "

# complete
autoload -Uz compinit
compinit
zstyle ':completion:*:sudo:*' command-path /usr/local/sbin /usr/local/bin \
                   /usr/sbin /usr/bin /sbin /bin /usr/X11R6/bin

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
  builtin cd $@ && ls;
}

# ignore case
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}'

# redirect UWAGAKI KINSHI
setopt no_clobber
