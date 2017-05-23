#!/bin/zsh

dropbox start
compton -b -f --backend glx --vsync=drm !&
~/.fehbg
xinput set-prop "SynPS/2 Synaptics TouchPad" "libinput Tapping Enabled" 1
pulseaudio --start
/usr/lib/notify-osd/notify-osd 2>&1 >/dev/null &!
