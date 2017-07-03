# Tmux Screentime

A [Tmux](https://github.com/tmux/tmux/wiki) plugin that tells you to take a break when you've been staring at your screen for too long. 

Yes, it's a fancy alarm clock.

![tmux-screentime screenshot](https://user-images.githubusercontent.com/4107518/27671637-13f37dfa-5c63-11e7-8775-0aa6acaece7f.png)

Every 20 minutes, for 20 seconds, your status bar will tell you to look up. The tmux clock will also show up in the current pane to get your attention. See the [USAGE](#usage) section for details and customization.

# INSTALL
### With TPM
If you use Tmux Plugin Manager, add the following line to `~/.tmux.conf`

```
set -g @plugin 'devend711/tmux-screentime'
```

And then download + source the plugin with `prefix`+ I (capital `I`, as in Install)

### Manually
1. Clone this repo to ~/some_dir
2. Add `run-shell ~/some_dir/tmux_screentime.tmux` to end of your `~/.tmux.conf`
3. Run `tmux source-file ~/.tmux.conf`

# USAGE
Once you have installed the plugin, it's ready to use in your status bar. Just add `#{screentime_status}` to your status bar via your `~/.tmux.conf` and then reload with `tmux source-file ~/.tmux.conf`

```
set -g status-right #{screentime_status} %a %h-%d %H:%M "
``` 

### Customization

You can set the following options, shown here with their defaults, in your `.tmux.conf`

```
set -g @screentime_look_string "👀" # what shows up in your status bar when the alarm is on
set -g @screentime_nolook_string "" # what shows up in your status bar when the alarm is off
set -g @screentime_interval 20 # alarm sounds every n minutes on the hour
set -g @screentime_show_clock 0 # automatically show the clock? 0 for yes, 1 for no 
```

# DEVELOPMENT
### To do:
- Test outside of OSX 
- Interval count start on tmux start, not just on the hour
