#!/bin/sh

# Set Session Name
SESSION="Website"
SESSIONEXISTS=$(tmux list-sessions | grep $SESSION)

# Only create tmux session if it doesn't already exist
if [ "$SESSIONEXISTS" = "" ]
then
    # Start New Session with our name
    tmux new-session -d -s $SESSION

    # Name first Pane and start sh
    tmux rename-window -t 0 'RED GREEN REFACTOR'
    tmux split-window -h 
    tmux main-pane-width 66%
    
    tmux select-pane -t 0
    
fi

# Attach Session, on the Main window
tmux attach-session -t $SESSION:0
