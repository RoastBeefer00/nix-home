source ~/.zsh_profile

export EDITOR="nvim"
export PATH="$PATH:$HOME/.cargo/bin"


function vim() {
    if [ -z "$@" ]; then
        nvim .
    else
        nvim $@
    fi
}

function dopush() {
    git add .
    git commit -m "$@"
    git push
}

function new_branch() {
    gco -b $@
    git push --set-upstream origin  $@
}

# Wasmer
export WASMER_DIR="/home/roastbeefer/.wasmer"
[ -s "$WASMER_DIR/wasmer.sh" ] && source "$WASMER_DIR/wasmer.sh"

eval $(thefuck --alias)

# The next line updates PATH for the Google Cloud SDK.
if [ -f '/home/roastbeefer/google-cloud-sdk/path.zsh.inc' ]; then . '/home/roastbeefer/google-cloud-sdk/path.zsh.inc'; fi

# The next line enables shell command completion for gcloud.
if [ -f '/home/roastbeefer/google-cloud-sdk/completion.zsh.inc' ]; then . '/home/roastbeefer/google-cloud-sdk/completion.zsh.inc'; fi
