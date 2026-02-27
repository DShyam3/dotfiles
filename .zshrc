# --- 1. Environment & Paths ---
export PATH="$HOME/.pixi/bin:$HOME/.antigravity/antigravity/bin:$PATH"
export EDITOR="cursor"

# Source Tool Envs
[ -f "$HOME/.local/bin/env" ] && . "$HOME/.local/bin/env"
[ -f "$HOME/.cargo/env" ] && . "$HOME/.cargo/env"
[ -f "$HOME/.dora/bin/env" ] && . "$HOME/.dora/bin/env"

# --- 2. Zinit Initialization ---
ZINIT_HOME="${XDG_DATA_HOME:-${HOME}/.local/share}/zinit/zinit.git"
source "${ZINIT_HOME}/zinit.zsh"
autoload -Uz _zinit
(( ${+_comps} )) && _comps[zinit]=_zinit

# --- 3. Zinit Plugins ---

# Load completions and autosuggestions
zinit ice wait lucid atinit"ZINIT[COMPINIT_OPTS]=-C; zicompinit; zicdreplay"
zinit light zsh-users/zsh-autosuggestions

zinit ice wait lucid
zinit light zsh-users/zsh-completions

zinit ice wait lucid
zinit light Aloxaf/fzf-tab

# Syntax highlighting - Loaded slightly differently to fix the $region_highlight error
zinit ice wait"0" lucid atinit"zpcompinit; zpcdreplay"
zinit light zsh-users/zsh-syntax-highlighting

# --- 4. Prompt & Tools ---
eval "$(oh-my-posh init zsh --config $HOME/.config/ohmyposh/theme.toml)"
eval "$(zoxide init --cmd cd zsh)"
eval "$(mamba shell hook --shell zsh)"
eval "$(fzf --zsh)"

# --- 5. History Configuration ---
HISTSIZE=5000
HISTFILE=~/.zsh_history
SAVEHIST=$HISTSIZE
HISTDUP=erase

setopt appendhistory       
setopt sharehistory        
setopt incappendhistory    
setopt hist_ignore_dups    
setopt hist_ignore_space   
setopt hist_save_no_dups   
setopt hist_find_no_dups   

# --- 6. Completion Styling & Docker ---
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Za-z}'
zstyle ':completion:*' list-colors "${(s.:.)LS_COLORS}"

# Docker completions
fpath=(/Users/dhyanshyam/.docker/completions $fpath)
autoload -Uz compinit && compinit

# --- 7. Aliases ---
alias cat="bat"
alias cl="clear"
alias tm="tmux"
alias tmls="tmux ls" 
alias tma="tmux attach-session -t"
alias tmn="tmux new-session -t"
alias tmk="tmux kill-session -t"

# Eza (Improved ls)
alias ls="eza --color=always --long --icons=always --no-permissions --time-style=long-iso --all"
alias ll="eza --color=always --long --icons=always --time-style=long-iso --total-size --all"
alias lst='eza --color=always --long --icons=always --no-permissions --time-style=long-iso --total-size --all --tree'

# Git
alias ga="git add"
alias gb="git branch"
alias gc="git commit"
alias gcl="git clone" 
alias gco="git checkout"
alias gd="git diff"
alias gf="git fetch"
alias gl="git pull" 
alias gm="git merge"
alias gp="git push"
alias grs="git restore"
alias gsu="git submodule update"
alias gst="git status" 
alias gsta="git stash" 
alias gsw="git switch"
