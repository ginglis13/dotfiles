# some aliases

alias ll='ls -l'
alias la='ls -A'
alias setbg='feh --bg-scale /home/ginglis/pictures/bg.png &'


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

alias sshpi='ssh pi@67.161.39.80'

# Git
alias gst="git status"
alias glog="git log --oneline --decorate --graph"
alias gpsup="git push -u origin $(parse_git_branch | sed 's/(\(.*\))/\1/g')"
alias canada="git commit --amend --no-edit"
alias gco="git checkout"

# tui audio mixer
alias audio='alsamixer -c 1'
