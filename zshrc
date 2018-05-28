export LANG=ja_JP.UTF-8
export PATH="$HOME/.rbenv/bin:$PATH"

source ~/.dotfiles/myConfig.zsh
source ~/.dotfiles/aliases.zsh
source ~/.dotfiles/localConfig.zsh

if [ -r /usr/share/doc/pkgfile/command-not-found.zsh ]
then
    source /usr/share/doc/pkgfile/command-not-found.zsh
fi
export PERL_LOCAL_LIB_ROOT="/home/nona/perl5:$PERL_LOCAL_LIB_ROOT";
export PERL_MB_OPT="--install_base "/home/nona/perl5"";
export PERL_MM_OPT="INSTALL_BASE=/home/nona/perl5";
export PERL5LIB="/home/nona/perl5/lib/perl5:$PERL5LIB";
export PATH="/home/nona/perl5/bin:$PATH";

# コマンドラインが空の場合、Enterで補完を更新する。
function _rehash()
{
  zle accept-line  # accept-line がデフォルトのEnterに割り当てられている
  if [[ -z "$BUFFER" ]]; then
    rehash
  fi
}
zle -N _rehash
bindkey "\C-m" _rehash

fpath=(~/.dotfiles/zsh-completions/src $fpath)
autoload -U compinit; compinit

export CLOUDSDK_PYTHON=/usr/bin/python2
export PATH=/home/nona/google-cloud-sdk/bin:$PATH

# The next line enables shell command completion for gcloud.
source '/home/nona/google-cloud-sdk/completion.zsh.inc'

export NVM_DIR="/home/nona/.nvm"
nvm() {
  unset -f nvm
  \. "$NVM_DIR/nvm.sh" # This loads nvm
  nvm "$@"
}

# if (which zprof > /dev/null 2>&1) ;then
#   zprof
# fi
