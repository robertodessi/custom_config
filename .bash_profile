
export EDITOR=/usr/bin/vim
#export CLICOLOR=1
#export LSCOLORS=ExFxBxDxCxegedabagacad

alias ls='ls --color'
LS_COLORS='di=34:fi=33:ln=31:pi=5:so=5:bd=5:cd=5:or=31:mi=0:ex=32:*.rpm=90'
export LS_COLORS


alias p='python3'
alias e='exit'
alias cp='cp -iv'                           # Preferred 'cp' implementation | -i asks for permission to overwrite | -v verbose
alias mv='mv -iv'                           # Preferred 'mv' implementation | -i asks for permission to overwrite | -v verbose
alias mkdir='mkdir -pv'                     # Preferred 'mkdir' implementation | -p creates intermidiate directories if required
alias fair='cd ~/FBK-fairseq'
bleu() { perl ~/multi-bleu.perl $2 < $1 ;}

# e.g. mkdir Desktop/foo/bar creates foo if it does not exists
alias ll='ls -FlAhpt'                       # Preferred 'ls' implementation                                                                                                              
alias less='less -FRXc'                     # Preferred 'less' implementation
cd() { builtin cd "$@"; ls; }               # Always list directory contents upon 'cd'
alias cd..='cd ../'                         # Go back 1 directory level (for fast typers)
alias ..='cd ../'                           # Go back 1 directory level
alias ...='cd ../../'                       # Go back 2 directory levels
alias ~="cd ~"                              # ~:            Go Home
alias c='clear'                             # c:            Clear terminal display
alias path='echo -e ${PATH//:/\\n}'         # path:         Echo all executable Paths
mcd () { mkdir -p "$1" && cd "$1"; }        # mcd:          Makes new Dir and jumps inside
alias doc="less ~/.bash_profile"            # doc:          Show (using less) .bash_profile
alias upd="source ~/.bash_profile"                # upd:          Sources this file after edits has been made
alias edit_config="vim ~/.bash_profile"     # edit_config:  Opens this file with vim


# added by Anaconda3 installer
export PATH="/home/rdessi/sw/anaconda3/bin:$PATH"

export LD_LIBRARY_PATH=/hardmnt/hltmt-gpu-c0/data/software/cuda_installed/cuda_9.1/lib64:/hardmnt/hltmt-gpu-c0/data/software/cuda_installed/cuda_9.1/extras/CUPTI/lib64
export CUDA_HOME=/hardmnt/hltmt-gpu-c0/data/software/cuda_installed/cuda_9.1

export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:/hardmnt/hltmt-gpu-c0/data/software/cuda_installed/cuda_9.0/lib64
LD_LIBRARY_PATH=$LD_LIBRARY_PATH:/hardmnt/hltmt-gpu-c0/data/software/cuda_installed/cuda_8.0/lib64

