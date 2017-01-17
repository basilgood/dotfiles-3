# execute .bashrc
if [ -f ~/.bashrc ]; then
        . ~/.bashrc
fi

# python
export PYENV_ROOT=$HOME/.pyenv
eval "$(pyenv init -)"
eval "$(pyenv virtualenv-init -)"

# ruby
eval "$(rbenv init -)"

# register command with date.
HISTTIMEFORMAT='%d/%m/%Y, %T '

# elixir path
export PATH="$PATH:/usr/local/Cellar/elixir/1.3.2/bin"

# node
export PATH=/usr/local/var/nodebrew/current/bin:$PATH
export PATH=$HOME/.nodebrew/current/bin:$PATH
alias brew="env PATH=${PATH//$(pyenv root)\/shims:/} brew"

# BASH completion
if [ -f /usr/local/etc/bash_completion ]; then
    . /usr/local/etc/bash_completion
fi

git_branch() {
        echo $(git branch --no-color 2>/dev/null | sed -ne "s/^\* \(.*)$/\1/p")
}

# Go lang
export GOPATH=$HOME/.go
export PATH=$PATH:$GOPATH/bin

source /usr/local/etc/bash_completion.d/git-prompt.sh
source /usr/local/etc/bash_completion.d/git-completion.bash

GIT_PS1_SHOWDIRTYSTATE=true
export PS1='\W:\[\033[31m\]$(__git_ps1 [%s])\[\033[34m\] $ \033[37m\]'
