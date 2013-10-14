#!/bin/bash -   
#title          :emacs.app.sh
#description    :call specific mode for emacs server.
#author         :dbd    
#date           :20131012
#version        :0.1    
#usage          :./emacs.app.sh
#notes          :       
#bash_version   :4.2.24(1)-release
#============================================================================

alias org2blog='emacsclient -e "(dbd-org2blog-mode)"'
#alias ec='emacsclient -e "(dbd-default-mode)"'
alias ec-new='emacsclient -e "(dbd-ec-new)"'
alias programming-c='emacsclient -e "(dbd-c-cpp-mode)"'
alias ..='cd ..'
alias ...='cd ../..'
alias ....='cd ../../..'
