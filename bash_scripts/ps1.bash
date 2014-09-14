git_prompt() {
    branch=$(__git_ps1 | sed 's/[ ()]//g')

    if [ ! -z $branch ];
    then
        if [ "$(git status 2>/dev/null | tail -n1)" != "nothing to commit, working directory clean" ];
        then
            dirty="*"
        fi

        echo " ($branch$dirty)"
    fi
}

export PS1="[\[\033[1;36m\]\u\[\033[1;33m\] \[\033[32m\]\w\[\033[0m\]]\$(git_prompt)$ "


export LSCOLORS="ExGxBxDxCxEgEdxbxgxcxd"
export CLICOLOR=1
