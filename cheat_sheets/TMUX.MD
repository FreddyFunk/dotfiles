# tmux cheat sheet

1.  Installation:

    -   On Ubuntu: `sudo apt-get install tmux`
    -   On macOS: `brew install tmux`
2.  Navigating through sessions and windows:

    -   Start a new session: `tmux new -s myname`
    -   Detach from a session: `ctrl + b + d`
    -   List sessions: `tmux ls`
    -   Attach to a session: `tmux attach -t #no.`
    -   Kill a session: `tmux kill-session -t #no.`
3.  Windows (tabs):

    -   Create a new window: `ctrl + b + c`
    -   Navigate to the next window: `ctrl + b + n`
    -   Navigate to the previous window: `ctrl + b + p`
    -   Find a window: `ctrl + b + f`
    -   Rename a window: `ctrl + b + ,`
4.  Panes (splits):

    -   Split horizontally: `ctrl + b + %`
    -   Split vertically: `ctrl + b + "`
    -   Close a pane: `ctrl + b + x`
    -   Navigate between panes: `ctrl + b + #arrow`
    -   Scroll up: `ctrl + b + [`
    -	Resize panes: `ctrl + b`, then `hold ctrl + #arrow`
5.  Exiting tmux:

    -   Gracefully kill tmux `tmux kill-server`
    -   Kill tmux: `pkill -f tmux`
