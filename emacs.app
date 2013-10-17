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

alias org2blog='emacsclient -e "(dbd-org2blog-mode)"'
alias ec='emacsclient -e "(dbd-default-mode)"'
alias ec-new='emacsclient -e "(dbd-ec-new)"'
alias c-code='emacsclient -e "(dbd-c-cpp-mode)"'
alias java-code='emacsclient -e "(dbd-java-mode)"'
alias eclim-code='emacsclient -e "(dbd-eclim-mode)"'
alias clojure-code='emacsclient -e "(dbd-clojure-mode)"'
alias ..='cd ..'
alias ...='cd ../..'
alias ....='cd ../../..'

export GTK_IM_MODULE=ibus
export XMODIFIERS="@im=ibus"
export QT_IM_MODULE=ibus

export NODE_PATH=~/tools/installed/lib/node
export LANG=C
export PT5HOME=/home/w34p0n/tools/PacketTracer53/
export JAVA_HOME=/usr/lib/jvm/java-6-openjdk-amd64
export PATH=$PATH:~/tools/android_sdk/platform-tools:~/tools/android_sdk/tools:~/tmp/bin/:/opt/flex/bin:~/mydisk/google-dev/automate/cef3/depot_tools
export SSH_AUTH_SOCK=0
export EDITOR=/home/w34p0n/bin/SciTE
#export EDITOR=~/tools/installed/bin/emacs-24.0.94
export CHROMIUM_SRC_PATH=/home/w34p0n/mydisk/google-dev/chromium/src
