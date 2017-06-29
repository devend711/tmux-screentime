# Tmux Screentime

A Tmux plugin that tells you when you've been staring at your screen for too long

# How to

### Install
#### With TPM
If you use Tmux Plugin Manager, add the following line to `~/.tmux.conf`

```
set -g @plugin 'devend711/tmux-screentime'
```

And then download + source the plugin with `prefix`+ I (capital I, as in Install) to fetch the plugin

#### Manually
1. Clone this repo to ~/tmp
2. Add `run-shell ~/tmp/tmux_screentime.tmux` to end of your `~/.tmux.conf`
3. Run tmux source-file `tmux source-file ~/.tmux.conf`

### Use
Once you have installed the plugin, it's ready to use in your status bar. Just add `#{screentime_status}` to `~/.tmux.conf`

```
set -g status-right #{screentime_status} %a %h-%d %H:%M "
``` 
