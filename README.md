# Tmux Screentime

A [Tmux](https://github.com/tmux/tmux/wiki) plugin that tells you to take a break when you've been staring at your screen for too long

Every 20 minutes, for 20 seconds, your status bar will tell you to look up

# How to

### Install
##### With TPM
If you use Tmux Plugin Manager, add the following line to `~/.tmux.conf`

```
set -g @plugin 'devend711/tmux-screentime'
```

And then download + source the plugin with `prefix`+ I (capital I, as in Install)

##### Manually
1. Clone this repo to ~/tmp
2. Add `run-shell ~/tmp/tmux_screentime.tmux` to end of your `~/.tmux.conf`
3. Run `tmux source-file ~/.tmux.conf`

### Use
Once you have installed the plugin, it's ready to use in your status bar. Just add `#{screentime_status}` to `~/.tmux.conf` and then reload with `tmux source-file ~/.tmux.conf`

```
set -g status-right #{screentime_status} %a %h-%d %H:%M "
``` 

# Development
### To do:
- Document options
- Test outside of OSX 
