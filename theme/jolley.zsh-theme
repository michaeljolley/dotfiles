
# User colored by priviliges (if not overridden in username abbreviation)
local path_string="%{$fg[cyan]%}%~"
local prompt_string="$fg[green]»$fg[white]"

# From agnoster theme; Indicate if background jobs are running
job_status() {
    typeset -a job_running

    if [[ $(jobs -l | wc -l) -gt 0 ]]
    then
        job_running+="%{%F{cyan}%}☕ "
    # else # maybe too distracting
    #   job_running+="%{%F{cyan}%} "
    fi

    echo "$job_running"
}

# git-prompt options
ZSH_THEME_GIT_PROMPT_PREFIX="" # "("
ZSH_THEME_GIT_PROMPT_SUFFIX="" # ")"
ZSH_THEME_GIT_PROMPT_SEPARATOR="|"
ZSH_THEME_GIT_PROMPT_BRANCH=" %{$fg_bold[magenta]%}"
ZSH_THEME_GIT_PROMPT_STAGED="%{$fg[red]%}%{●%G%}"
ZSH_THEME_GIT_PROMPT_CONFLICTS="%{$fg[red]%}%{✖%G%}"
ZSH_THEME_GIT_PROMPT_CHANGED="%{$fg[blue]%}%{✚%G%}"
ZSH_THEME_GIT_PROMPT_BEHIND="%{↓%G%}"
ZSH_THEME_GIT_PROMPT_AHEAD="%{↑%G%}"
ZSH_THEME_GIT_PROMPT_UNTRACKED="%{…%G%}"
ZSH_THEME_GIT_PROMPT_CLEAN="%{$fg_bold[green]%}%{✔%G%}"

# Left prompt
PROMPT='$(job_status) ${path_string} $(git_prompt_info) %{$reset_color%}$prompt_string '
# Right prompt
# RPROMPT='$(git_super_status) ${time_string}%{$reset_color%}'

# Other symbols (scratch): ⚙ ✗ ✘ ⚡⭒ 