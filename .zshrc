# --- 1. Environment & Paths ---
export PATH="$HOME/.pixi/bin:$HOME/.antigravity/antigravity/bin:$PATH"
export EDITOR="cursor"

# Added by Antigravity IDE
export PATH="/Users/dhyanshyam/.antigravity-ide/antigravity-ide/bin:$PATH"

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

# Docker completions
fpath=(/Users/dhyanshyam/.docker/completions $fpath)
autoload -Uz compinit && compinit

# --- 5. Aliases ---
# ==========================================
# History Configs
# ==========================================
export HISTSIZE=100000                 # Memory command capacity
export SAVEHIST=200000                 # Disk command capacity
export HISTFILE="$HOME/.zsh_history"   # History storage path

setopt APPEND_HISTORY                  # Append history on exit
setopt INC_APPEND_HISTORY              # Save commands instantly
setopt SHARE_HISTORY                   # Share history across tabs
setopt HIST_IGNORE_ALL_DUPS            # Erase matching duplicates
setopt HIST_IGNORE_SPACE               # Skip spaces (hides secrets)
setopt HIST_REDUCE_BLANKS              # Strip extra blank spaces

# ==========================================
# Navigation & System Settings
# ==========================================
autoload -Uz compinit && compinit      # Load completion engine
zstyle ':completion:*' matcher-list 'm:{a-zA-Z}={A-Za-z}' 'r:|=*' 'l:|=* r:|=*' # Case insensitive tab match
zstyle ':completion:*' list-colors "${(s.:.)LS_COLORS}"
setopt CORRECT                         # Autocorrect typos in commands

# Shortcuts, Navigation & Lists
alias hg="history | grep --color=always" # Keyword history search
alias cl="clear"                       # Wipe screen
alias home="cd ~"                      # Go home
alias dev="cd ~/dev"                   # Go to projects folder
alias ezsh="nano ~/.zshrc"             # Edit zsh configuration
alias szsh="source ~/.zshrc"           # Source zsh configuration
alias ..="cd .."                       # Up 1 level
alias ...="cd ../.."                   # Up 2 levels
alias ....="cd ../../.."               # Up 3 levels

# Directory
alias ll="eza --color=always --long --icons=always --time-style=long-iso --total-size --all" # List of folders and files
alias lst='eza --color=always --long --icons=always --no-permissions --time-style=long-iso --total-size --all --tree'         # Graph tree layout

# ==========================================
# Dev Tools
# ==========================================

# Git Core & Branching
alias ga="git add"                     # Stage changes
alias gb="git branch"                  # Manage branches
alias gc="git commit"                  # Save changes
alias gcl="git clone"                  # Download repo
alias gd="git diff"                    # View raw diffs
alias gm="git merge"                   # Merge branch
alias gp="git push"                    # Upload commits
alias gsu="git submodule update"       # Sync submodules
alias gsw="git switch"                 # Switch branch
alias gswc="git switch -c"             # Create & switch branch

# Git History & Workspace Safeties
alias gr1="git reset --soft HEAD~1"    # Undo the last commit
alias grs="git restore"                # Discard local changes
alias grss="git restore --staged"      # Unstage files
alias ggl="git log --oneline --graph --all" # Linear history graph
alias gsta="git stash push -m"         # Label and shelf changes
alias gst="git status -s"              # Short status table
alias gf="git fetch --prune"           # Fetch & prune dead remotes
alias gl="git pull --rebase"           # Linear safe sync pull
alias gstp="git stash pop"             # Restore shelf changes

# Tmux
alias tx="tmux"                        # Launch multiplexer
alias txl="tmux ls"                    # List active sessions
alias txn="tmux new -s"                # New named session
alias txa="tmux attach -t"             # Reconnect to session
alias txk="tmux kill-session -t"       # Shut down session
alias txka="tmux kill-server"          # Kill all sessions

# Ansible
alias ap="ansible-playbook"            # Run playbook
alias apc="ansible-playbook --syntax-check" # Syntax validator
alias apv="ansible-playbook -v"        # Verbose execution debug
alias ainv="ansible-inventory --list"  # List assets inventory
alias ave="ansible-vault encrypt"      # Secure files/secrets
alias avd="ansible-vault decrypt"      # Unencrypt target vault
alias avv="ansible-vault view"         # Read vault without edits

# Docker
alias d="docker"                       # Container controller
alias dc="docker-compose"              # Compose orchestrator
alias dps="docker ps --format 'table {{.ID}}\t{{.Names}}\t{{.RunningFor}}\t{{.Status}}\t{{.Ports}}'" # Compact active process list
alias dpa="docker ps -a"               # List all environments
alias ddi="docker images"              # List all image artifacts
alias dl="docker logs --tail 100 -f"   # Follow execution logs
alias dex="docker exec -it"            # Execute active bash checks
alias dclean="docker container prune -f" # Wipe stopped environments
alias dprune="docker system prune -a --volumes -f" # Nuclear storage purge

# Rsync
alias rsync-cp="rsync -ahv --progress --partial" # Safe copy with resume
alias rsync-sync="rsync -ahv --progress --partial --delete" # Clean mirror directory
alias rsync-ssh="rsync -ahvz -e ssh --progress --partial" # Fast compressed SSH sync
