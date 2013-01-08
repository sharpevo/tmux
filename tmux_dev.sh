#!/bin/bash

session_name='develop'

if [ -n "$1" ]
then
    session_name=$1
fi
tmux has-session -t $session_name

if [ $? != 0 ]
then
    tmux new-session -s $session_name -n EDITOR -d
    tmux split-window -h -t $session_name
    tmux split-window -v -p 30 -t $session_name:1.2
    tmux send-keys -t $session_name:1.2 'gl -n 7' C-m

    tmux new-window -n DOC -t $session_name
    tmux split-window -h -t $session_name

    # two window is enough for normally usage.
    #tmux new-window -n SERVER -t $session_name
    #tmux split-window -h -t $session_name

    tmux select-window -t $session_name:1
    tmux select-pane -t $session_name:1.1
fi
tmux attach -t $session_name
