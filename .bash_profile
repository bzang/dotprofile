if [ "$BASH_SCRIPT_PATH" = "" ]; then
    BASH_SCRIPT_PATH=$HOME/.zang/bash_scripts
fi

if [ -d $BASH_SCRIPT_PATH ]; then
    # sort in natural order
    for script in $(ls -v $BASH_SCRIPT_PATH/*.bash); do
        . $script
    done
fi
