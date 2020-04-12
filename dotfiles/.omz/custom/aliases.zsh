#ALIASES
alias b='cd -'
alias h='cd ~'
alias of='xdg-open'
alias off='shutdown now'
alias kp='pidof $1 | xargs kill -9'
alias pi='sudo apt install -y'
alias pu='sudo apt purge'
alias Update='sudo apt update'
alias Upgrade='sudo apt upgrade'
alias clh='cat /dev/null > ~/.oh-my-zsh/.zsh_history && history -c'
alias reload!='source ~/.oh-my-zsh/.zshrc'
alias lock='gnome-screensaver-command -l'
alias log-out='gnome-session-quit --no-prompt'
alias tools='source ~/.bash_profile'
alias lhf='ls -d .?*'
alias lf='ls -p | grep -v / --color=auto'
alias ls='ls --color=auto'
alias dir='dir --color=auto'
alias history='history 0'
alias wget="wget --hsts-file ~/.cache/wget/.wget-hsts"
alias vi="vi -i ~/.cache/vim/info"
alias vim="vim -i ~/.cache/vim/info"
alias update-OMZ="cd "$ZSH" && git stash && upgrade_oh_my_zsh && git stash pop"
alias docker='sudo docker'
# Works with lenovo ThinkPad Yoga 260
alias touchoff='xinput --disable $(xinput --list | egrep -io "Wacom.+Finger.+id=([0-9]+)" | awk '\''{print substr($8,length($8)-0)}'\'')'
alias touchon='xinput --enable $(xinput --list | egrep -io "Wacom.+Finger.+id=([0-9]+)" | awk '\''{print substr($8,length($8)-0)}'\'')'
alias public-ip="curl -s checkip.dyndns.org | grep -Eo '[0-9\.]+'"
alias file-size='du -h $1'

#Functions placed in ALIAS Mode:
# CSV Editor with pspg
csview(){
	pspg -f ${1} --csv -s 5
}

# List files in a directory
lfd(){
	ls -p "$1" | grep -v / --color=auto
}

# Restart Service
rs(){
	sudo systemctl restart "$1"
}

# Show contents of dir after action
cd-ls(){
   cd "$1"
   ls -a
}

#Extract common type of archived file types
ext(){
   if [ -f $1 ] ; then
       case $1 in
           *.tar.bz2)   tar xvjf $1    ;;
           *.tar.gz)    tar xvzf $1    ;;
           *.tar.xz)    tar xzf $1     ;;
           *.bz2)       bunzip2 $1     ;;
           *.rar)       unrar x $1     ;;
           *.gz)        gunzip $1      ;;
           *.tar)       tar xvf $1     ;;
           *.tbz2)      tar xvjf $1    ;;
           *.tgz)       tar xvzf $1    ;;
           *.zip)       unzip $1       ;;
           *.Z)         uncompress $1  ;;
           *.7z)        7z x $1        ;;
           *)           echo "don't know how to extract '$1'..." ;;
       esac
   else
       echo '"$1" is not a valid file!'
   fi
 }

 #Directory navigation using down
behind(){
  local d=""
  limit=$1
  for ((i=1 ; i <= limit ; i++))
    do
      d=$d/..
    done
  d=$(echo $d | sed 's/^\///')
  if [ -z "$d" ]; then
    d=..
  fi
  cd $d
}

# Copy a file to a server.
transfer-file(){
  scp "$1" root@"$2":/root/
}
