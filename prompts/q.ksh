load_extension git-prompt
load_extension got

PS1='\u@\h[\[\e[01;$(($??31:39))m\]$?\[\e[0m]\]:\w\]$(__got_ps1 " got:(%s)")$(__git_ps1 " git:(%s)")\$ '

export PS1
