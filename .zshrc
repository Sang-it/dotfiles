# zmodload zsh/zprof

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

# Path to dotnet tools
export PATH="$PATH:/Users/sangitmanandhar/.dotnet/tools"

# Path to go installed binaries
export PATH="$PATH:/Users/sangitmanandhar/go/bin"

# Path to Pure
fpath+=("$(brew --prefix)/share/zsh/site-functions")
autoload -U promptinit; promptinit
prompt pure

# Aliases
alias tm="tmux"
# alias n="nvim"
# alias tn="tmux new-session -A -s "$(basename "$(PWD)")" \; send-keys "nvim" C-m"

# Editor set to nvim
export EDITOR="nvim"

# Path to Logger bin
export PATH="$PATH:/Users/sangitmanandhar/Projects/OlympusObservatory/build"

# Path to Cabal
export PATH="$PATH:/Users/sangitmanandhar/.cabal/bin"

# Path to llvm
export PATH="/opt/homebrew/opt/llvm/bin:$PATH"
export LDFLAGS="-L/opt/homebrew/opt/llvm/lib"
export CPPFLAGS="-I/opt/homebrew/opt/llvm/include"


# Path to Cabal
export PATH="/Users/sangitmanandhar/.cabal/bin:$PATH"

# Path to ruby
export PATH="/opt/homebrew/opt/ruby/bin:$PATH"

# Path to JAVA
export PATH="/opt/homebrew/opt/openjdk/bin:$PATH"
export CPPFLAGS="-I/opt/homebrew/opt/openjdk/include"

# JAVA_HOME env
export JAVA_HOME="/Library/Java/JavaVirtualMachines/openjdk.jdk/Contents/Home"

#Path to FVM
export PATH="/Users/sangitmanandhar/.local/state/fnm_multishells/39198_1732249238031/bin":$PATH
export FNM_MULTISHELL_PATH="/Users/sangitmanandhar/.local/state/fnm_multishells/39198_1732249238031"
export FNM_VERSION_FILE_STRATEGY="local"
export FNM_DIR="/Users/sangitmanandhar/.local/share/fnm"
export FNM_LOGLEVEL="info"
export FNM_NODE_DIST_MIRROR="https://nodejs.org/dist"
export FNM_COREPACK_ENABLED="false"
export FNM_RESOLVE_ENGINES="true"
export FNM_ARCH="arm64"

# Default FZF configs
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
export FZF_DEFAULT_COMMAND='rg --files --hidden -g '!.git' -g '!dist' -g '!node_modules' -g '!.Trash' -g '!Library' -g '!Pictures''
export FZF_DEFAULT_OPTS="
    --height=50% --layout=reverse
	--color=fg:#908caa,bg:#191724,hl:#ebbcba
	--color=fg+:#e0def4,bg+:#26233a,hl+:#ebbcba
	--color=border:#403d52,header:#31748f,gutter:#191724
	--color=spinner:#f6c177,info:#9ccfd8,separator:#403d52
	--color=pointer:#c4a7e7,marker:#eb6f92,prompt:#908caa
    "
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"

alias brew='env PATH="${PATH//$(pyenv root)\/shims:/}" brew'

# Path to custom binaries
export PATH="/Users/sangitmanandhar/.bin:$PATH"

# Fzf to search directories
bindkey -s '^d' 'cd_with_fzf\n'

# # Tmux new sessions
bindkey -s '^f' 'tms\n'

cd_with_fzf() {
  cd $HOME && cd "$(fd -t d --exclude .git --exclude node_modules --exclude dist --exclude Applications --exclude go | fzf)"
}

get_homebrew_package_sizes() {
  cd "/opt/homebrew/Cellar" && du -hs * | gsort -hr
}

# opam configuration
[[ ! -r /Users/sangitmanandhar/.opam/opam-init/init.zsh ]] || source /Users/sangitmanandhar/.opam/opam-init/init.zsh  > /dev/null 2> /dev/null

# Required for sdl2 to work
export LIBRARY_PATH="$LIBRARY_PATH:$(brew --prefix)/lib"

# Path to V-Analyzer
export PATH="/Users/sangitmanandhar/.config/v-analyzer/bin:$PATH"

# Path to Z
. /opt/homebrew/etc/profile.d/z.sh

# Path to RISCV
export PATH="$PATH:/opt/riscv/bin"

# Path to Ghcup
export PATH="/Users/sangitmanandhar/.ghcup/bin:$PATH"

# >>> coursier install directory >>>
export PATH="$PATH:/Users/sangitmanandhar/Library/Application Support/Coursier/bin"
# <<< coursier install directory <<<

# zprof
