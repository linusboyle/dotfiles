shopt -s expand_aliases

alias ls='ls --color=auto'
alias dir='dir --color=auto'
alias grep='grep --color=auto'

#alias fbterm='LANG=zh_CN.utf-8 LC_ALL="C" fbterm'

#tag the music,of course
alias tag='mid3v2'

# just convenient
#alias ..='cd ..'
#alias ...='cd ../..'

# useful for ricing
alias xupdate='xrdb $HOME/.Xresources'

alias py='python'
alias py3='python3'
alias ag="ag --path-to-ignore $HOME/.ignore"
alias pbcopy='xclip -selection clipboard'
alias pbpaste='xclip -selection clipboard -o'

# for usual use of pandoc
alias pan='pandoc --pdf-engine=xelatex -V CJKmainfont="Noto Sans SC" -V geometry:"top=2cm, bottom=1.5cm, left=2cm, right=2cm"'

alias gr='cd $(git rev-parse --show-toplevel)'

# untar, for most of the time
alias untar='tar -zxvf'

# git
alias gcommit='git commit'
alias gpush='git push'
alias gblame='git blame'
alias gstatus='git status'
alias glog='git log'

# alias xo='xdg-open'

alias v="vim"
alias pastebin="curl -F 'sprunge=<-' http://sprunge.us | xclip -selection clipboard"
