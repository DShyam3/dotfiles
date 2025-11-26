# Zinit (minimal setup)
source "$HOME/.local/share/zinit/zinit.git/zinit.zsh"
autoload -Uz _zinit
(( ${+_comps} )) && _comps[zinit]=_zinit

# Zinit Plugins (Turbo)
# Autosuggestions
zinit light-mode for \
    atinit"ZINIT[COMPINIT_OPTS]=-C; zicompinit; zicdreplay" \
    wait lucid \
    zsh-users/zsh-autosuggestions

# Completions
zinit light-mode for \
    wait lucid \
    zsh-users/zsh-completions

# fzf-tab
zinit light-mode for \
    wait lucid \
    Aloxaf/fzf-tab

# Syntax highlighting (must load last)
zinit light-mode for \
    wait lucid atload"_zsh_highlight" \
    zsh-users/zsh-syntax-highlighting

# Oh My Posh (Prompt)
eval "$(oh-my-posh init zsh --config $HOME/.config/ohmyposh/theme.toml)"

# Path & Tools
export PATH="$HOME/.pixi/bin:$PATH"
export EDITOR="cursor"
eval "$(zoxide init --cmd cd zsh)"
eval "$(mamba shell hook --shell zsh)"
eval "$(fzf --zsh)"   # fzf keybindings (Ctrl+R, Ctrl+T, etc)

# Aliases
alias cat="bat"
alias ls="eza --color=always --long --icons=always --no-permissions --time-style=long-iso --all"
alias lsa="eza --color=always --long --icons=always --no-permissions --time-style=long-iso --total-size --all"
alias lst='eza --color=always --long --icons=always --no-permissions --time-style=long-iso --total-size --all --tree'
alias cl="clear"

# History
HISTSIZE=5000
HISTFILE=~/.zsh_history
SAVEHIST=$HISTSIZE
HISTDUP=erase

# Better history handling
setopt appendhistory       # append instead of overwrite
setopt sharehistory        # share across sessions
setopt incappendhistory    # save immediately
setopt hist_ignore_dups    # ignore consecutive duplicates
setopt hist_ignore_space   # ignore commands starting with a space
setopt hist_save_no_dups   # don’t save duplicates to file
setopt hist_find_no_dups   # skip duplicates in search

# Completion Styling
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Za-z}'
zstyle ':completion:*' list-colors "${(s.:.)LS_COLORS}"
# The following lines have been added by Docker Desktop to enable Docker CLI completions.
fpath=(/Users/dhyanshyam/.docker/completions $fpath)
autoload -Uz compinit
compinit
# End of Docker CLI completions
