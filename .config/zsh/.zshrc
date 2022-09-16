# make sure you can use that tasty rust stuff
export PATH="~/.cargo/bin:$PATH"

# enable colours fgs
autoload -U colors
colors

# keep command history!
HISTSIZE=1000
SAVEHIST=1000
HISTFILE=~/.cache/zsh/history

# stop highlighting pasted text
zle_highlight+=(paste:none)
# tab complete
autoload -U compinit
zstyle ':completion:*' menu select
zmodload zsh/complist
compinit
# tabcomplete hidden/dot files
_comp_options+=(globdots)

# append to the history list, don't replace old entries!
setopt appendhistory
# allows for advanced pattern matching
setopt extendedglob
# don't assume a precedent 'cd' if omitted
unsetopt autocd
# no beeping whose idea even was this
unsetopt beep
# don't tell me when there's no match - I'll figure it out somehow
unsetopt nomatch
# don't notify me of background processes
unsetopt notify
# disable ctrl-s to freeze terminal
stty stop undef
# don't highlight pasted in stuff
zle_highlight=('paste:none')

# use vim keybinds
bindkey -v
bindkey -M menuselect 'h' vi-backward-char
bindkey -M menuselect 'k' vi-up-line-or-history
bindkey -M menuselect 'l' vi-forward-char
bindkey -M menuselect 'j' vi-down-line-or-history
# use ctrl-e to edit command line in neovim
autoload edit-command-line; zle -N edit-command-line
bindkey '^e' edit-command-line

# match current input to history items
# bind to up arrow and down arrow
bindkey '^[[A' up-line-or-search
bindkey '^[[B' down-line-or-search

# "compile slow, run fast."
export CFLAGS="-Ofast -march=native -pipe -flto -fuse-linker-plugin"
export CXXFLAGS=${CFLAGS}
export LDFLAGS=${CFLAGS}

# aliases!
source ~/.config/.aliasrc
# starship is a nicer shell prompt
eval "$(starship init zsh)"
# zoxide is a smart cd command
eval "$(zoxide init zsh)"
# status for every terminal
neofetch
# syntax highlighting plugin
source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh 2>/dev/null
source /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh 2>/dev/null
