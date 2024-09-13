# This config utilises several plugins:
# zoxide
# starship
# zsh-history-substring-search
# zsh-syntax-highlighting
# zsh-vi-mode
# macchina

######################
# OPTIONS / SETTINGS #
######################

# enable colours fgs
autoload -U colors
colors

# HISTORY
HISTSIZE=1000
SAVEHIST=$HISTSIZE
HISTFILE=~/.config/zsh/.zsh_history
HISTDUP=erase
# append to the history list, don't replace old entries!
setopt appendhistory
# share command history accross zsh sessions
setopt sharehistory
setopt hist_ignore_space
setopt hist_ignore_all_dups
setopt hist_save_no_dups
setopt hist_find_no_dups
setopt hist_ignore_dups
bindkey '^p' history-search-backward
bindkey '^n' history-search-forward

# tab complete
autoload -U compinit
zstyle ':completion:*' menu select
zmodload zsh/complist
compinit
# tabcomplete includes hidden/dot files
_comp_options+=(globdots)

# advanced pattern matching
setopt extendedglob
# don't assume a precedent 'cd' if omitted
# no beeping noise (whose idea even was this)
# don't tell me when there's no match
# don't notify me of background processes
unsetopt autocd beep nomatch notify
# don't highlight pasted-in text
zle_highlight=('paste:none')
# disable ctrl-s to freeze terminal
stty stop undef
# use ctrl-e to edit command line in neovim
autoload -z edit-command-line; zle -N edit-command-line
bindkey "^X^E" edit-command-line

################################
# PLUGINS & OTHER CONFIG FILES #
################################

# aliases!
source ~/.config/.aliasrc
# starship is a nicer shell prompt
eval "$(starship init zsh)"
# zoxide is a smart cd command
eval "$(zoxide init zsh)"
# atuin is a better history search
eval "$(atuin init zsh)"
# syntax highlighting plugin
source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh 2>/dev/null
# suggest shell prompts based in first characters
# scroll back through command history after typing substring (and create associated keymaps)
source /usr/share/zsh/plugins/zsh-history-substring-search/zsh-history-substring-search.zsh 2>/dev/null
bindkey '^[[A' history-substring-search-up
bindkey '^[[B' history-substring-search-down

# vi-mode breaks blinking cursor without this in WezTerm
ZVM_CURSOR_STYLE_ENABLED=false
# better vi mode, set kj to escape
function zvm_config() {
  ZVM_LINE_INIT_MODE=$ZVM_MODE_INSERT
  ZVM_VI_ESCAPE_BINDKEY=kj
  ZVM_VI_INSERT_ESCAPE_BINDKEY=$ZVM_VI_ESCAPE_BINDKEY
  ZVM_VI_VISUAL_ESCAPE_BINDKEY=$ZVM_VI_ESCAPE_BINDKEY
  ZVM_VI_OPPEND_ESCAPE_BINDKEY=$ZVM_VI_ESCAPE_BINDKEY
}
source /usr/share/zsh/plugins/zsh-vi-mode/zsh-vi-mode.plugin.zsh 2>/dev/null

# use keychain to ensure SSH keys are remembered (must type on login)
eval $(keychain --eval --quiet --agents ssh id_rsa)

# speedy system status
macchina
# task list due.before:eow
