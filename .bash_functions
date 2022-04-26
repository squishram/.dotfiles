# creates command "cl" that changes to a directory and lists it
function cl() {
    DIR="$*";
        # if no DIR given, go home
        if [ $# -lt 1 ]; then
                DIR=$HOME;
    fi;
    builtin cd "${DIR}" && \
    # use your preferred ls command
        ls -F --color=auto
}

# make a new directory and open it
function mk() {
  mkdir -p "$@" && cd  "$@"
}
