# This config utilises several plugins:
# zoxide
# starship
# zsh-history-substring-search
# zsh-autosuggestions
# zsh-syntax-highlighting
# neofetch

######################
# OPTIONS / SETTINGS #
######################

# enable colours fgs
autoload -U colors
colors

# keep command history!
HISTSIZE=1000
SAVEHIST=1000
HISTFILE=~/.cache/zsh/history

# tab complete
autoload -U compinit
zstyle ':completion:*' menu select
zmodload zsh/complist
compinit
# tabcomplete includes hidden/dot files
_comp_options+=(globdots)

# append to the history list, don't replace old entries!
# advanced pattern matching
setopt appendhistory extendedglob
# don't assume a precedent 'cd' if omitted
# no beeping noise (whose idea even was this)
# don't tell me when there's no match
# don't notify me of background processes
unsetopt autocd beep nomatch notify
# don't highlight pasted-in text
zle_highlight=('paste:none')
# disable ctrl-s to freeze terminal
stty stop undef

#################################
# NEO(VIM) COMMAND LINE EDITING #
#################################

# use vim keybinds
bindkey -v
bindkey -M menuselect 'h' vi-backward-char
bindkey -M menuselect 'l' vi-forward-char
# use ctrl-e to edit command line in neovim
autoload edit-command-line; zle -N edit-command-line
bindkey '^e' edit-command-line

################################
# PLUGINS & OTHER CONFIG FILES #
################################

# aliases!
source ~/.config/.aliasrc
# starship is a nicer shell prompt
eval "$(starship init zsh)"
# zoxide is a smart cd command
eval "$(zoxide init zsh)"
# syntax highlighting plugin
source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh 2>/dev/null
# suggest shell prompts based in first characters
source /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh 2>/dev/null
# scroll back through command history after typing substring (and create associated keymaps)
source /usr/share/zsh/plugins/zsh-history-substring-search/zsh-history-substring-search.zsh 2>/dev/null
bindkey '^[[A' history-substring-search-up
bindkey '^[[B' history-substring-search-down
bindkey -M vicmd 'k' history-substring-search-up
bindkey -M vicmd 'j' history-substring-search-down

# status for every terminal
neofetch
