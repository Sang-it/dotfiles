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

# Path to Pure
fpath+=("$(brew --prefix)/share/zsh/site-functions")
autoload -U promptinit; promptinit
prompt pure

# Aliases
alias tm="tmux"
alias n="nvim"

# Editor set to nvim
export EDITOR="nvim"

# Path to llvm
export PATH="/opt/homebrew/opt/llvm/bin:$PATH"
export LDFLAGS="-L/opt/homebrew/opt/llvm/lib"
export CPPFLAGS="-I/opt/homebrew/opt/llvm/include"

# Path to Ghcup
export PATH="/Users/sangitmanandhar/.ghcup/bin:$PATH"

# Path to ruby
export PATH="/opt/homebrew/opt/ruby/bin:$PATH"

# Path to JAVA
export PATH="/opt/homebrew/opt/openjdk/bin:$PATH"
export CPPFLAGS="-I/opt/homebrew/opt/openjdk/include"

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

alias brew='env PATH="${PATH//$(pyenv root)\/shims:/}" brew'

# Path to custom binaries
export PATH="/Users/sangitmanandhar/.bin:$PATH"

# Fzf to search directories
bindkey -s '^d' 'cd_with_fzf\n'

# # Tmux new sessions
bindkey -s '^f' 'tms\n'

cd_with_fzf() {
  cd $HOME && cd "$(fd -t d --exclude .git --exclude node_modules --exclude dist | fzf)"
}

get_homebrew_package_sizes() {
  cd "/opt/homebrew/Cellar" && du -hs * | gsort -hr
}

# opam configuration
[[ ! -r /Users/sangitmanandhar/.opam/opam-init/init.zsh ]] || source /Users/sangitmanandhar/.opam/opam-init/init.zsh  > /dev/null 2> /dev/null
