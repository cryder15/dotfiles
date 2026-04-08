# Git integration for prompt
autoload -Uz vcs_info
precmd() { vcs_info }
zstyle ':vcs_info:git:*' formats ' %F{cyan}(%b)%f'
zstyle ':vcs_info:*' enable git

# Prompt: directory + git branch
setopt PROMPT_SUBST
PROMPT='%F{blue}%~%f${vcs_info_msg_0_} %F{yellow}❯%f '

# Ruby/Rails aliases
alias be="bundle exec"
alias bers="bundle exec rails s"
alias berc="bundle exec rails c"

# Git aliases
alias gcm="git checkout master"
alias gcmain="git checkout main"
alias gfm="git fetch origin master"
alias gfmain="git fetch origin main"

# Disable XON/XOFF flow control (allows Ctrl+S in terminal)
stty -ixon
