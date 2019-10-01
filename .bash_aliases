# some aliases

alias ll='ls -l'
alias la='ls -A'

# no steam locomotives here
alias sl='ls --color=auto'

# quick types
alias claer='clear'

alias tmux='TERM=screen-256color-bce tmux'
alias xclip='xclip -selection "clipboard"'

#memes
alias nano='echo Please use vim to open'

# nd stuff
alias sshnd='ssh student05.cse.nd.edu'
alias ndvpn='openconnect --user=$USER --passwd-on-stdin vpnaccess.nd.edu/mfa'
alias sshappa='ssh appa.ndlug.org'
alias sshjawn='ssh jawn.dhcp.nd.edu'

# Git
alias gst="git status"
alias glog="git log --oneline --decorate --graph"
alias gpsup="git push --set-upstream origin $(parse_git_branch)"
alias canada="git commit --amend --no-edit"
