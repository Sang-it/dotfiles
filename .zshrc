# Fig pre block. Keep at the top of this file.
export PATH="${PATH}:${HOME}/.local/bin"
eval "$(fig init zsh pre)"

# Path to your oh-my-zsh installation.
export ZSH="/Users/sangitmanandhar/.oh-my-zsh"

# Theme setup
ZSH_THEME=""

# Plugins
plugins=(
  git
  zsh-syntax-highlighting
)

# Path to Oh-my-zsh
source $ZSH/oh-my-zsh.sh

# Aliases
alias tm="tmux"
alias kube="kubectl"

# Path to HomeBrew
export PATH="/opt/homebrew/bin:$PATH"
export PATH="/opt/homebrew/sbin:$PATH"

# Path to Pure
fpath=("$HOME/.zsh" $fpath)

# Pure configs
autoload -U promptinit
promptinit
prompt pure

# Path to JAVA
export PATH="/opt/homebrew/opt/openjdk/bin:$PATH"

# JAVA_HOME env
export JAVA_HOME="/Library/Java/JavaVirtualMachines/openjdk.jdk/Contents/Home"

#Path to NVM
export NVM_DIR="$HOME/.nvm"
[ -s "/opt/homebrew/opt/nvm/nvm.sh" ] && . "/opt/homebrew/opt/nvm/nvm.sh"
[ -s "/opt/homebrew/opt/nvm/etc/bash_completion.d/nvm" ] && . "/opt/homebrew/opt/nvm/etc/bash_completion.d/nvm"

# Default FZF configs
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
export FZF_DEFAULT_COMMAND='rg --files --hidden -g '!.git' -g '!dist' -g '!node_modules' -g '!.Trash' -g '!Library' -g '!Pictures''
export FZF_DEFAULT_OPTS="--height=50% --layout=reverse"
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"

# Path to OpenSSL
export PATH="/opt/homebrew/opt/openssl@3/bin:$PATH"

# Path to Python
export PATH="/opt/homebrew/opt/python@3.10/bin:$PATH"

# Path to zlib
export PKG_CONFIG_PATH="/opt/homebrew/opt/zlib/lib/pkgconfig"
export LDFLAGS="-L/opt/homebrew/opt/zlib/lib"
export CPPFLAGS="-I/opt/homebrew/opt/zlib/include"

# Path to Pyenv
eval "$(pyenv init -)"

# [[ DOESN'T WORK WELL WITH FIG ]]
# alias brew='env PATH="${PATH//$(pyenv root)\/shims:/}" brew'

# Path to custom binaries
export PATH=/Users/sangitmanandhar/.bin:$PATH

# Fzf to search directories
bindkey -s '^d' 'cd_with_fzf\n'

# Fzf to cheatsheet
bindkey -s '^e' 'cht\n'

# Tmux new sessions
bindkey -s '^f' 'tms\n'

# Show Homebrew Cellar
bindkey -s '^s' 'get_homebrew_package_sizes\n'

cd_with_fzf() {
  cd $HOME && cd "$(fd -t d --exclude .git --exclude node_modules --exclude dist | fzf)"
}

get_homebrew_package_sizes() {
  cd "/opt/homebrew/Cellar" && du -hs * | gsort -hr
}

pr() {
  CURRENT_BRANCH=$(git branch | grep \* | cut -d ' ' -f2-)
  git checkout -b $1
  git commit --allow-empty -m "Create branch"
  hub pull-request --push --base $CURRENT_BRANCH --message $1
}

# Fig post block. Keep at the bottom of this file.
eval "$(fig init zsh post)"

