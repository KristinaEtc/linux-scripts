# enable color support of ls and also add handy aliases
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    alias ls='ls --color=auto'
    alias dir='dir --color=auto'
    alias vdir='vdir --color=auto'
    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
fi
alias ll="grc /bin/ls --all  --escape  -l --time-style=long-iso  --color=always -F  --group-directories-first -H -v"
alias la='ls -A'
alias l='ls -CF'
alias ping='grc ping -c 5'
alias ps="grc ps"
alias which="type -a"
alias dmesg="dmesg --color=auto"
alias df="grc df -kTh"
alias ip="ip -color"
alias myip='ip addr list|grep -P "(.*inet (?!127).*)|(.*inet6 ((?!fe80)[^:]).*)"| awk "{print \$2}"'
alias tail='grc tail'
alias mount='grc mount'
alias netstat='grc netstat'
alias traceroute='grc traceroute'
alias ifconfig='sudo grc ifconfig'
alias diff="grc diff"
alias wdiff="grc wdiff"
alias last="grc last"
alias cvs="grc cvs"
alias mtr="grc mtr"
alias dig="grc dig"
alias cat="grc cat"
alias gcc="grc gcc"
alias feh='feh -.'
alias tmux='tmux -2 attach || tmux -2 new -s TMUX'
alias tmuxls='\tmux ls'
alias teaparty='$HOME/bin/teaparty.sh'
alias pb='pastebinit -i'
alias sfetch='$HOME/bin/screenfetch.sh'
alias testnet='$HOME/bin/nettest.sh'
alias restartnet='$HOME/bin/netrestart.sh'
alias startnet='systemctl restart xl2tpd.service'
alias ssswap='sudo swapoff -a && sudo swapon -a'
alias open='xdg-open'
#####################################################################
# ALIASES FOR CORRECT ENV-VARIABLES IN THE DIFFERENT TERM-EMULATORS:

# midnight commander
if [ "$TERM" = "xterm" ] || [ "$TERM" = "xterm-256color" ]
then
    alias mc='env TERM="xterm-256color" mc -c -S modarin256-defbg'
elif [ "$TERM" = "screen" ] || [ "$TERM" = "screen-256color" ]
then
    alias mc='env TERM="screen-256color" mc -c -S modarin256-defbg'
else
    alias mc='mc -S dark'
fi

# weechat
if [ "$TERM" = "xterm" ] || [ "$TERM" = "xterm-256color" ]
then
    alias weechat='env TERM="xterm-256color" weechat'
elif [ "$TERM" = "screen" ] || [ "$TERM" = "screen-256color" ]
then
    alias weechat='env TERM="screen-256color" weechat'
fi

# htop
if [ "$TERM" = "xterm" ] || [ "$TERM" = "xterm-256color" ]
then
    alias htop='env TERM="xterm-256color" htop'
elif [ "$TERM" = "screen" ] || [ "$TERM" = "screen-256color" ]
then
    alias htop='env TERM="screen-256color" htop'
fi

# toxic
if [ "$TERM" = "xterm" ] || [ "$TERM" = "xterm-256color" ]
then
    alias toxic='env TERM="xterm-256color" /opt/toxic/toxic.sh'
elif [ "$TERM" = "screen" ] || [ "$TERM" = "screen-256color" ]
then
    alias toxic='env TERM="screen-256color" /opt/toxic/toxic.sh'
fi

# mutt with all-in-one profiles, chosed in application by FN-keys
if [ "$TERM" = "xterm" ] || [ "$TERM" = "xterm-256color" ]
then
    alias mutt='env TERM="xterm-256color" mutt'
elif [ "$TERM" = "screen" ] || [ "$TERM" = "screen-256color" ]
then
    alias mutt='env TERM="screen-256color" mutt'
fi

# mutt with case-based profile selection before startup
alias mutt123='. $HOME/.mutt/mutt-mailboxes.sh'

# vim/vim-common
if [ "$TERM" = "xterm" ] || [ "$TERM" = "xterm-256color" ]
then
    alias vim='env TERM="xterm-256color" vim'
elif [ "$TERM" = "screen" ] || [ "$TERM" = "screen-256color" ] && [ -n "$DISPLAY" ]
then
    alias vim='env TERM="screen-256color" vim'
elif [ -z "$DISPLAY"] && [ -n "$TMUX" ] || [ "$TERM" = "linux" ]
then
    alias vim="vim -u $HOME/.vim/vimrc.simple --noplugin"
fi

# cmus music player
if [ "$TERM" = "xterm" ] || [ "$TERM" = "xterm-256color" ]
then
    alias cmus='\cp $HOME/.cmus/rc.colorterm $HOME/.cmus/rc && env TERM="xterm-256color" cmus'
elif [ "$TERM" = "screen" ] || [ "$TERM" = "screen-256color" ] && [ -n "$DISPLAY" ]
then
    alias cmus='\cp $HOME/.cmus/rc.colorterm $HOME/.cmus/rc && env TERM="screen-256color" cmus'
elif [ -z "$DISPLAY"] && [ -n "$TMUX" ]
then
    alias cmus='\cp $HOME/.cmus/rc.linuxterm $HOME/.cmus/rc && env TERM="screen-256color" cmus'
else
    alias cmus='\cp $HOME/.cmus/rc.linuxterm $HOME/.cmus/rc && cmus'
fi

#####################################################################
# alias for fast adding, commiting and pushing all of the repo contents
alias pushall='git add . && read -p "Edit commit message: " message && git commit -m "$message" && git push origin'
# Add an "alert" alias for long running commands.  Use like so:
#   sleep 10; alert
alias alert='notify-send --urgency=low -i "$([ $? = 0 ] && echo terminal || echo error)" "$(history|tail -n1|sed -e '\''s/^\s*[0-9]\+\s*//;s/[;&|]\s*alert$//'\'')"'
# Beep bell sound
export BELL=/usr/share/sounds/freedesktop/stereo/bell.oga
alias bell='paplay $BELL'
export BEEP=/usr/share/sounds/freedesktop/stereo/bell.oga
alias beep='paplay $BEEP'
function mdcd () { mkdir -p "$@" && eval cd "\"\$$#\""; }

# BBQ ALIASES #
# Safety
alias rm='rm -Iv --preserve-root'
alias mv='mv -iv'
alias cp='cp -iv'
alias ln='ln -i'
alias md='mkdir -p -v'
alias rd='rmdir -v'
alias chown='chown --preserve-root'
alias chmod='chmod --preserve-root'
alias chgrp='chgrp --preserve-root'
alias shred='shred -n 100 -z -v -u'
# Reboot/shutdown
alias reboot='sudo /sbin/reboot'
alias poweroff='sudo /sbin/poweroff'
alias halt='sudo /sbin/halt'
alias shutdown='sudo /sbin/shutdown'
alias suspend='sudo pm-suspend'

# Space on drive
alias disk='du -S | sort -n -r | less'
alias manb='man -H'
alias cal='ncal -Mb'
alias afk='$HOME/bin/locker.sh'
alias cwd='pwd | xclip -selection clipboard'
# Stopwatch
alias timer='echo "Timer started. Stop with Ctrl-D." && date && time cat && date'
alias weather='date +"%A, %d %b. %Y, %H:%M" ; curl -s wttr.in/Omsk | head -n 37'
alias wttr='date +"%A, %d %b. %Y, %H:%M" ; curl -s wttr.in/Omsk | head -n 7'
