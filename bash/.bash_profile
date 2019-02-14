#  ---------------------------------------------------------------------------
#  My first .bash_profile file
#  ---------------------------------------------------------------------------

alias scan='cd /Users/robertodessi/Desktop/SCAN-CNN'
alias docs='cd /Users/robertodessi/Desktop/docs'

export EDITOR=/usr/bin/vim
export CLICOLOR=1
export LSCOLORS=ExFxBxDxCxegedabagacad

# ======
# Reminder:
# <command> | peco is an interactive filtering command
#
#   mdfind search using spotlight db (thus searching through data and metadata   
# ====

#   ---------------------------------
#   1. ALIASES AND FUNCTIONS
#   ---------------------------------

alias p='python'
alias cp='cp -iv'                           # Preferred 'cp' implementation | -i asks for permission to overwrite | -v verbose
alias mv='mv -iv'                           # Preferred 'mv' implementation | -i asks for permission to overwrite | -v verbose
alias mkdir='mkdir -pv'                     # Preferred 'mkdir' implementation | -p creates intermidiate directories if required
                                            # e.g. mkdir Desktop/foo/bar creates foo if it does not exists
alias ll='ls -FlAhp'                        # Preferred 'ls' implementation
alias less='less -FRXc'                     # Preferred 'less' implementation
cd() { builtin cd "$@"; ls; }               # Always list directory contents upon 'cd'
alias cd..='cd ../'                         # Go back 1 directory level (for fast typers)
alias ..='cd ../'                           # Go back 1 directory level
alias ...='cd ../../'                       # Go back 2 directory levels
alias ~="cd ~"                              # ~:            Go Home
alias desk='cd ~/Desktop'                   # desk:         Go to the Desktop folder
alias f='open -a Finder ./'                 # f:            Opens current directory in MacOS Finder
alias c='clear'                             # c:            Clear terminal display
alias path='echo -e ${PATH//:/\\n}'         # path:         Echo all executable Paths
alias show_options='shopt'                  # Show_options: display bash options settings
mcd () { mkdir -p "$1" && cd "$1"; }        # mcd:          Makes new Dir and jumps inside
trash () { command mv "$@" ~/.Trash ; }     # trash:        Moves a file to the MacOS trash
prev() { qlmanage -p "$1" >& /dev/null;}    # prev:         Opens the file in MacOS Quicklook Preview
pdf() { open -a /Applications/Preview.app/ "$1" ;} # pdf:   Opens the file in MacOS Preview
empty() { rm -rf ~/.Trash/*; }              # empty:        Empties the Trash
alias doc="less ~/.bash_profile"            # doc:          Show (using less) .bash_profile
vlc() { open -a /Applications/VLC.app/ "$1" ;}  # vlc:      Open the file with vlc
alias show_trash="ls ~/.Trash/"             # show_trash:   Shows the content of the Trash
app() { open -a /Applications/"$1".app/ ;}  # app:          Opens the application passed as an argument
alias calc="bc -l"                          # calc:         Starts a cli calculator
alias show_app="ls /Applications/"          # show_app:     Showing all the app in the Applications folder
alias upd="source ~/.bash_profile"          # upd:          Sources this file after edits has been made
alias doc_vim="less ~/.vimrc"
alias edit_vim="vim ~/.vimrc"

#   ---------------------------
#   SSH aliases 
#   ---------------------------

alias clic="ssh roberto.dessi@clic.cimec.unitn.it"
alias sissa="ssh -X rdessi@merengue.cns.sissa.it"
alias ceribs='ssh minecraft@104.46.46.237'


latexpdf () {
    pdflatex $1
    pdf *.pdf
}

#   ---------------------------
#    config files
#   ---------------------------

alias edit_config="vim ~/.bash_profile"     # edit_config:  Opens this file with vim

#   ---------------------------
#   2. SEARCHING
#   ---------------------------

alias search="find . -name "                   # search:    Quickly search for file
ff () { /usr/bin/find . -name "$@" ; }         # ff:        Find file under the current directory
fstarts () { /usr/bin/find . -name "$@"'*' ; } # fstarts:   Find file whose name starts with a given string
fends () { /usr/bin/find . -name '*'"$@" ; }   # fends:     Find file whose name ends with a given string

#   spotlight: Search for a file using MacOS Spotlight's metadata
#   -----------------------------------------------------------
    spotlight () { mdfind "kMDItemDisplayName == '$@'wc"; }

#   extract:    extract almost file compressed in almost any format    
#   ---------------------------
    extract () {
      if [ -f $1 ] ; then
        case $1 in
            *.tar.bz2)   tar xjf $1     ;;
            *.tar.gz)    tar xzf $1     ;;
            *.bz2)       bunzip2 $1     ;;
            *.rar)       unrar e $1     ;;
            *.gz)        gunzip $1      ;;
            *.tar)       tar xf $1      ;;
            *.tbz2)      tar xjf $1     ;;
            *.tgz)       tar xzf $1     ;;
            *.zip)       unzip $1       ;;
            *.Z)         uncompress $1  ;;
            *.7z)        7z x $1        ;;
            *)     echo "'$1' cannot be extracted via extract()" ;;
              esac
      else
          echo "'$1' is not a valid file"    
      fi
  }


# Show/hide hidden files in Finder
alias show="defaults write com.apple.finder AppleShowAllFiles -bool true && killall Finder"
alias hide="defaults write com.apple.finder AppleShowAllFiles -bool false && killall Finder"

# Hide/show all desktop icons (useful when presenting)
alias hidedesktop="defaults write com.apple.finder CreateDesktop -bool false && killall Finder"
alias showdesktop="defaults write com.apple.finder CreateDesktop -bool true && killall Finder"


#   kill_screen:    kill all detached screen sessions
#   ---------------------------

# kill_screen () { for session in $(screen -ls | grep -o '[0-9]\+') do screen -S "${session}" -X quit; done }

kill_screen () {
    for session in $(screen -ls | grep -o '[0-9]\{5\}')
    do
        screen -S "${session}" -X quit;
    done
}

#   bash commands needed for virtulenvwrapper
#   ---------------------------
#
#   to create a virtualenv with a specified version of python the followin command must be ran:   
#   mkvirtualenv -p /usr/local/bin/python3 $WORKON_HOME/<virtualenv name>
#
#   a destination directory for the working project must be specified ($WORKON_HOME/<virtualenv name> in this case)
#

#   Virtualenvs location. All the new virtualenvs will be placed inside a directory there (e.g. when "mkvirtualenv mynewenv" is typed the new venv will be placed in 
#   $HOME/.virtualenvs/mynewenv)
export WORKON_HOME=$HOME/.virtualenvs
#   Python version to be used when creating a new virtualenv
export VIRTUALENVWRAPPER_PYTHON=/usr/local/bin/python3

source /usr/local/bin/virtualenvwrapper.sh

