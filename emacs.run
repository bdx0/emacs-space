#!/bin/bash -   
#title          :emacs.app
#description    :call specific mode for emacs server.
#author         :dbd    
#date           :20131012
#version        :0.1    
#usage          :./emacs.app 
#notes          :config terminal integrate with emacs.       
#bash_version   :4.2.24(1)-release
#============================================================================

# export EDITOR="emacsclient -t -n -a nano"
# alias ec='emacsclient -c -n -a nano'
# alias et='emacsclient -t -a nano'
# ecs() { emacsclient -c -n -a emacs "/sudo::$*" }
# ets() { emacsclient -t -a emacs "/sudo::$*" }

alias org2blog='emacsclient -e "(dbd-org2blog-mode)"'		    # $*: bash argument 
alias ec='emacsclient -e "(dbd-default-mode)"'
alias ec-new='emacsclient -e "(dbd-ec-new)"'
alias c-code='emacsclient -e "(dbd-c-cpp-mode)"'
alias java-code='emacsclient -e "(dbd-java-mode)"'
alias eclim-code='emacsclient -e "(dbd-eclim-mode)"'
alias clojure-code='emacsclient -e "(dbd-clojure-mode)"'
alias ..='cd ..'
alias ...='cd ../..'
alias ....='cd ../../..'
alias ll='ls -l'
alias la='ls -l -a'


export INSTANCE=0
export GTK_IM_MODULE=ibus
export XMODIFIERS="@im=ibus"
export QT_IM_MODULE=ibus

export NODE_PATH=~/tools/installed/lib/node			    # node.js
export LC_ALL=en_US.UTF-8					    # fix for rb with jekyll generating .html file.
export LANG=en_US.UTF-8
export PT5HOME=/home/w34p0n/tools/PacketTracer53/		    # setting for packet tracer on linux
export JAVA_HOME=/usr/lib/jvm/java-6-openjdk-amd64		    # setting for openJDK on linux
export PATH=$PATH:~/tools/android_sdk/platform-tools		    # setting for AndrodiSdk on linux
export PATH=$PATH:~/tools/android_sdk/tools			    # ....
export PATH=$PATH:~/tmp/bin/:/opt/flex/bin			    # flex
export PATH=$PATH:~/mydisk/google-dev/automate/cef3/depot_tools	    # chromium
export PATH=$PATH:~/bin/heroku/bin				    # heroku -- a ruby/clojure/java server
export PATH=$PATH:~/tools/apache-maven-3.1.1/bin   # fix mvn on window
export SSH_AUTH_SOCK=0
export EDITOR=/home/w34p0n/bin/SciTE
#export EDITOR=~/tools/installed/bin/emacs-24.0.94
export CHROMIUM_SRC_PATH=/home/w34p0n/mydisk/google-dev/chromium/src # chromium
export LD_LIBRARY_PATH=$LD_LIBRARY_PATH


# Local Variables:
# mode: sh  
# comment-column: 80
# End:
