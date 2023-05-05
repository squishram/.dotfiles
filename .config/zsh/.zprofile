# default programs
export EDITOR="nvim"
export BROWSER="firefox"
export READER="zathura"

# where zsh config files are located
export ZDOTDIR="$HOME/.config/zsh"

# programming languages
# Rust
export PATH="~/.cargo/bin:$PATH"
# Julia
export PATH="$PATH:/home/sammy/julia-1.8.1/bin"

# "compile slow, run fast."
export CFLAGS="-Ofast -march=native -pipe -flto -fuse-linker-plugin"
export CXXFLAGS=${CFLAGS}
export LDFLAGS=${CFLAGS}

# icons for lf file browser
[ -f ~/.config/lf/lf_icons ] && {
	export LF_ICONS="$HOME/.config/lf/lf_icons"
}
