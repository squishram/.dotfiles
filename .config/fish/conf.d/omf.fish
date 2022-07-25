# get all dem colours
set TERM "xterm-256color"
# welcome bitch
set fish_greeting

# Path to Oh My Fish install
set -q XDG_DATA_HOME
  and set -gx OMF_PATH "$XDG_DATA_HOME/omf"
  or set -gx OMF_PATH "$HOME/.local/share/omf"

# Load Oh My Fish configuration
# source $OMF_PATH/init.fish

# get powerline functionality for icons
# set fish_function_path $fish_function_path "/usr/share/powerline/bindings/fish"
# source /usr/share/powerline/bindings/fish/powerline-setup.fish
# powerline-setup

# set -U fish_user_paths $fish_user_paths $HOME/.local/bin
# set -gx EDITOR '$HOME/nvim.appimage'
set -gx EDITOR 'nvim'
# set TERM "st"
set PATH $HOME/.cargo/bin $PATH
# export PATH="$HOME/.cargo/bin:$PATH"
# fish_add_path ~/.cargo/bin


fish_add_path ~/.local/bin
# texlive path-setting
# set MANPATH "/usr/local/texlive/2021/texmf-dist/doc/man"
# export MANPATH="/usr/local/texlive/2021/texmf-dist/doc/man"
# fish_add_path /usr/local/texlive/2021/texmf-dist/doc/man
# set INFOPATH "/usr/local/texlive/2021/texmf-dist/doc/info"
# export INFOPATH="/usr/local/texlive/2021/texmf-dist/doc/info"
# fish_add_path /usr/local/texlive/2021/texmf-dist/doc/info
set -gx INFOPATH $INFOPATH /usr/local/texlive/2021/texmf-dist/doc/info
# set PATH "/usr/local/texlive/2021/bin/x86_64-linux"
# export PATH="/usr/local/texlive/2021/bin/x86_64-linux"
# fish_add_path /usr/local/texlive/2021/bin/x86_64-linux
set -gx PATH $PATH "/usr/local/texlive/2021/bin/x86_64-linux"
# NOTE Logfile: /usr/local/texlive/2021/install-tl.log

# fish_vi_key_bindings
function fish_user_key_bindings
  fish_vi_key_bindings
end

###################
# ALIAS LIST START #
###################

alias cwd="pwd | xclip -selection clipboard"

# improved find util in Rust
alias fd="fdfind"

# rust fuzzy finder
# ripgrep fuzzy finder
alias skg="sk --ansi -i -c 'rga --color=always --line-number "{}" .'"
alias skf="sk --ansi -i --color=always"

# smart cd in Rust
alias z='zoxide'
alias zq='zoxide query'
alias za='zoxide add'
alias zr='zoxide remove'

# reboot / halt / poweroff
alias reboot='sudo /sbin/reboot'
alias pdown='systemctl poweroff'
alias halt='sudo /sbin/halt'
# boot up your display
alias sx='startx'
# reload the fish shell
alias rl='source ~/.config/fish/conf.d/omf.fish'

# check for an hdmi, if there is one plugged in, flip over to it
alias hdmi='/home/archan/documents/code/shell_scripts/flip_hdmi.sh'
# launch ranger file manager
alias rr='ranger'

# starting daemons:
# spotifyd
alias spot='systemctl --user stop spotifyd && systemctl --user start spotifyd'

##############
# CORE UTILS #
##############

# better find function in Rust
alias fde='fd --extension'

# directory contents in Rust
alias ls='exa -al --color=always --group-directories-first'
alias sl='exa -a --color=always --group-directories-first'
alias ll='exa -l --color=always --group-directories-first'
alias lt='exa -aT --color=always --group-directories-first'
alias ld='exa -lad */ --color=always'

# colorisation
alias dir='dir --color=auto'
alias vdir='vdir --color=auto'
alias grep ='grep --color=auto'

# 'go tos'
alias cod="cd / && cd /mnt/linux_data/code"
alias hdd="cd / && cd /mnt/linux_data"
alias ssd="cd ~"
alias cd..='cd ..'
alias ..='cd ..'
alias ...='cd ../../'
alias ....='cd ../../../'
alias .....='cd ../../../'
alias .2='cd ../../'
alias .3='cd ../../../'
alias .4='cd ../../../../'
alias .5='cd ../../../../..'

# git stuff
alias addall='git add .'
alias branch='git branch'
alias commit='git add commit -m'
alias push='git push'

# what runs at every new terminal?
# alias neofetch='/usr/bin/neofetch --ascii /home/ishan/neorg/todo.norg'
alias neofetch='fortune|cowsay -f tux|lolcat'
# alias neofetch='/usr/bin/neofetch --ascii "fortune|cowsay -f tux|lolcat"'
# kitty shortcuts
alias ims='kitty +kitten icat'

# clear the terminal with c
alias c='clear'
# move all to the parent directory
# (up = 'unpack' or '(move) up')
alias up='mv * ..'

# opens calculator
alias bc='bc -l'
# handy short cuts #
alias h='history'
alias j='jobs -l'

# tell me the path
# alias path='echo -e ${PATH//:/\\n}'

# check date/time
alias now='date +"%T"'
alias nowtime=now
alias nowdate='date +"%d-%m-%Y"'

# I'm a vim boi now
# alias vim='$HOME/nvim.appimage'
alias vim='nvim'
alias vi='nvim'
alias edit='nvim'

# update on one command
# debian
alias update='sudo apt-get update && sudo apt-get upgrade'
## pass options to free ##
alias meminfo='free -m -l -t'
## get top process eating memory
alias psmem='ps auxf | sort -nr -k 4'
alias psmem10='ps auxf | sort -nr -k 4 | head -10'
## get top process eating cpu ##
alias pscpu='ps auxf | sort -nr -k 3'
alias pscpu10='ps auxf | sort -nr -k 3 | head -10'
## Get server cpu info ##
alias cpuinfo='lscpu'
## get GPU ram on desktop / laptop##
alias gpumeminfo='grep -i --color memory /var/log/Xorg.0.log'
# make a new virtual environment/ activate it in but two keystrokes
alias ve='pipenv shell'
# What's yer network speed?
alias speed='speedtest-cli --server 6513 --simple'

# BLUETOOTH ALIASES
# start bluetooth (hardware)
alias bluon='sudo systemctl enable bluetooth && sudo systemctl start bluetooth'
alias blustat='sudo systemctl status bluetooth'

# TASKWARRIOR ALIASES
# add a task
alias ta='task add $1'
# list your tasks
alias tl='task list'
# edit a task
alias te='task $1 edit'
# delete a task
alias tx='task $1 delete'
# mark a task as done
alias td='task $1 done'
# undo a task action
alias tu='task undo'
# leave contexts, see it all
alias tn='task context none'

# make a new task and add it to a project
# function tap --a task_name project
#   task add $task_name project:$project
# end

# make a new task and add tags to it
# function tat --a task_name tag1 tag2 tag3
#   task add $task_name +$tag1 +$tag2 +$tag3
# end

# check all tasks with a tag
function tc --a tag
  task +$tag
end

# move into a context
function tcon --a context
  task context $context
end

# put task $1 in project $2
function tp --a task_id proj_name
  task $task_id modify project:$proj_name
end

# add tags $2 $3 $4 to task $1
function tt --a task_id tag1 tag2 tag3
  task $task_id modify tag:$tag1 $tag2 $tag3
end

# use vdirsyncer to sync khal calendar
alias vdirsyncer="~/vdirsyncer_env/bin/vdirsyncer"

##################
# ALIAS LIST END #
##################

# starship is a nicer shell prompt
starship init fish | source
# zoxide is a smart cd command
zoxide init fish | source
# status for every terminal
neofetch
