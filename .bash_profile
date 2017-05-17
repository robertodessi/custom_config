#  ---------------------------------------------------------------------------
#  My first .bash_profile file
#  ---------------------------------------------------------------------------

export EDITOR=/usr/bin/vim
export CLICOLOR=1
export LSCOLORS=ExFxBxDxCxegedabagacad

#   ---------------------------------
#   ALIASES AND FUNCTIONS
#   ---------------------------------

alias cp='cp -iv'                           # Preferred 'cp' implementation | -i asks for permission to overwrite | -v verbose
alias mv='mv -iv'                           # Preferred 'mv' implementation | -i asks for permission to overwrite | -v verbose
alias mkdir='mkdir -pv'                     # Preferred 'mkdir' implementation | -p creates intermidiate directories if required
                                            # e.g. mkdir Desktop/foo/bar creates foo if it does not exists
alias ll='ls -FlAhp'                        # Preferred 'ls' implementation
alias less='less -FRXc'                     # Preferred 'less' implementation
cd() { builtin cd "$@"; ll; }               # Always list directory contents upon 'cd'
alias cd..='cd ../'                         # Go back 1 directory level (for fast typers)
alias ..='cd ../'                           # Go back 1 directory level
alias ...='cd ../../'                       # Go back 2 directory levels
alias ~="cd ~"                              # ~:            Go Home
alias desk='cd ~/Desktop'                   # desk:         Go to the Desktop folder
alias f='open -a Finder ./'                 # f:            Opens current directory in MacOS Finder
alias c='clear'                             # c:            Clear terminal display
alias path='echo -e ${PATH//:/\\n}'         # path:         Echo all executable Paths
alias show_options='shopt'                  # Show_options: display bash options settings
alias cic='set completion-ignore-case On'   # cic:          Make tab-completion case-insensitive
mcd () { mkdir -p "$1" && cd "$1"; }        # mcd:          Makes new Dir and jumps inside
trash () { command mv "$@" ~/.Trash ; }     # trash:        Moves a file to the MacOS trash
alias DT='tee ~/Desktop/terminalOut.txt'    # DT:           Pipe content to file on MacOS Desktop
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
alias create="touch"                        # create:       Uses the word create rather than touch to create a new file, not really a shortcut but
                                            #               this way it makes more sense to me
alias edit_config="vim ~/.bash_profile"     # edit_config:  Opens this file with vim

#   ---------------------------
#   SEARCHING
#   ---------------------------

alias search="find . -name "                   # search:    Quickly search for file
ff () { /usr/bin/find . -name "$@" ; }         # ff:        Find file under the current directory
fstarts () { /usr/bin/find . -name "$@"'*' ; } # fstarts:   Find file whose name starts with a given string
fends () { /usr/bin/find . -name '*'"$@" ; }   # fends:     Find file whose name ends with a given string

#   spotlight: Search for a file using MacOS Spotlight's metadata
#   -----------------------------------------------------------
    spotlight () { mdfind "kMDItemDisplayName == '$@'wc"; }


#   ---------------------------    
#   EXTRACT
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


#   ---------------------------
#   6. NETWORKING
#   ---------------------------

alias myip='curl ip.appspot.com'                    # myip:         Public facing IP Address
alias netCons='lsof -i'                             # netCons:      Show all open TCP/IP sockets
alias flushDNS='dscacheutil -flushcache'            # flushDNS:     Flush out the DNS Cache
alias lsock='sudo /usr/sbin/lsof -i -P'             # lsock:        Display open sockets
alias lsockU='sudo /usr/sbin/lsof -nP | grep UDP'   # lsockU:       Display only open UDP sockets
alias lsockT='sudo /usr/sbin/lsof -nP | grep TCP'   # lsockT:       Display only open TCP sockets
alias ipInfo0='ipconfig getpacket en0'              # ipInfo0:      Get info on connections for en0
alias ipInfo1='ipconfig getpacket en1'              # ipInfo1:      Get info on connections for en1
alias openPorts='sudo lsof -i | grep LISTEN'        # openPorts:    All listening connections

#   ii:  display useful host related informaton
#   -------------------------------------------------------------------
    ii() {
        echo -e "\nYou are logged on ${RED}$HOST"
        echo -e "\nAdditionnal information:$NC " ; uname -a
        echo -e "\n${RED}Users logged on:$NC " ; w -h
        echo -e "\n${RED}Current date :$NC " ; date
        echo -e "\n${RED}Machine stats :$NC " ; uptime
        echo -e "\n${RED}Current network location :$NC " ; scselect
        echo -e "\n${RED}Public facing IP Address :$NC " ;myip
        echo
    }


#   finderShowHidden:   Show hidden files in Finder
#   finderHideHidden:   Hide hidden files in Finder
#   -------------------------------------------------------------------

alias finderShowHidden='defaults write com.apple.finder ShowAllFiles TRUE'
alias finderHideHidden='defaults write com.apple.finder ShowAllFiles FALSE'


