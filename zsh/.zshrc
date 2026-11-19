# --- Environment -------------------------------------------------------------
# zsh plugins are installed by mise (see mise.toml, http: backend)
ZSH_PLUGINS="$HOME/.local/share/mise/installs"
export EDITOR=nvim
export PNPM_HOME="$HOME/Library/pnpm"

# --- PATH (deduplicated) -----------------------------------------------------
typeset -U path PATH
eval "$(/opt/homebrew/bin/brew shellenv)"
path=(
  "$HOME/.local/bin"
  "$PNPM_HOME/bin"
  "$HOME/.opencode/bin"
  "$HOME/.docker/bin"
  $path
)

# --- Tools -------------------------------------------------------------------
eval "$("$HOME/.local/bin/mise" activate zsh)"
eval "$(starship init zsh)"
source <(fzf --zsh)   # Ctrl-R history, Ctrl-T files, Alt-C cd

# --- Aliases -----------------------------------------------------------------
alias v=nvim

# --- History -----------------------------------------------------------------
HISTFILE=~/.zsh_history
HISTSIZE=50000
SAVEHIST=50000
setopt SHARE_HISTORY HIST_IGNORE_ALL_DUPS HIST_IGNORE_SPACE HIST_REDUCE_BLANKS

# --- Completion --------------------------------------------------------------
# Extra completion definitions (zsh-completions)
[[ -d $ZSH_PLUGINS/http-zsh-completions/latest/src ]] && fpath=($ZSH_PLUGINS/http-zsh-completions/latest/src $fpath)

autoload -Uz compinit
# Rebuild the dump at most once a day, otherwise trust the cache (fast startup).
# -u skips the insecure-directory check (mise-installed plugins are group-writable).
if [[ -n ~/.zcompdump(#qN.mh+24) ]]; then compinit -u; else compinit -u -C; fi

zstyle ':completion:*' menu select
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Za-z}'   # case-insensitive
zstyle ':completion:*' list-colors "${(s.:.)LS_COLORS}"

# --- Plugins (installed via mise) --------------------------------------------
ZSH_AUTOSUGGEST_STRATEGY=(history completion)
[[ -r $ZSH_PLUGINS/http-zsh-autosuggestions/latest/zsh-autosuggestions.zsh ]] \
  && source $ZSH_PLUGINS/http-zsh-autosuggestions/latest/zsh-autosuggestions.zsh
# must be sourced last
[[ -r $ZSH_PLUGINS/http-zsh-syntax-highlighting/latest/zsh-syntax-highlighting.zsh ]] \
  && source $ZSH_PLUGINS/http-zsh-syntax-highlighting/latest/zsh-syntax-highlighting.zsh

# --- Local / private (not tracked): API keys, tokens, machine-specific stuff --
[[ -r ~/.zshrc.local ]] && source ~/.zshrc.local
