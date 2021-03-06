# A bash prompt with colors and Git annotations
# Put this in your ~/.profile file.

# Derived from
# http://vvv.tobiassjosten.net/git/add-current-git-branch-to-your-bash-prompt
# modified by dstroma

# Configure colors, if available.
if [ -x /usr/bin/tput ] && tput setaf 1 >&/dev/null; then
    c_reset='\[\e[0m\]'
    c_user='\[\033[01;32m\]'
    c_path='\[\e[01;34m\]'
    c_git_clean='\[\e[01;36m\]'
    c_git_dirty='\[\e[01;31m\]'
else
    c_reset=
    c_user=
    c_path=
    c_git_clean=
    c_git_dirty=
fi

# Function to assemble the Git part of our prompt.
git_prompt ()
{
    if ! git rev-parse --git-dir > /dev/null 2>&1; then
        return 0
    fi

    git_branch=$(git branch 2>/dev/null| sed -n '/^\*/s/^\* //p')

    if git diff HEAD --quiet 2>/dev/null >&2; then
        git_color="$c_git_clean"
    else
        git_color="$c_git_dirty"
    fi

    echo "$git_color($git_branch)${c_reset}"
}

# Thy holy prompt.
PROMPT_COMMAND='PS1="\n${c_user}\u@\h${c_reset} ${c_path}\w${c_reset} $(git_prompt)\n\$ "'

