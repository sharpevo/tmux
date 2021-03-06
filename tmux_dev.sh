#!/bin/bash

session_name='DEVELOP'

if [ -n "$1" ]
then
    session_name=$1
fi

tmux has-session -t $session_name

if [ $? != 0 ]
then
    tmux new-session -s $session_name -n MAIN -d
    tmux split-window -h -t $session_name
    tmux split-window -v -p 30 -t $session_name:1.2
    tmux send-keys -t $session_name:1.2 'g ll -n 10' C-m

    tmux select-window -t $session_name:1
    tmux select-pane -t $session_name:1.1
fi
tmux attach -t $session_name
