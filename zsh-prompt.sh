autoload -U colors && colors
setopt PROMPT_SUBST

git_prompt() {
    git rev-parse --git-dir >/dev/null 2>&1 || return

    local branch color
    branch=$(git symbolic-ref --quiet --short HEAD 2>/dev/null \
          || git rev-parse --short HEAD)

    if git diff HEAD --quiet 2>/dev/null; then
        color="%F{cyan}"
    else
        color="%F{red}"
    fi

    echo "${color}(${branch})%f"
}

PROMPT=$'
%K{235}%F{153}%n@%m%f%K{default} %F{blue}%~%f $(git_prompt)
$ '
