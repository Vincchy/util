# !/bin/sh

setxkbmap pl

dunst &
picom -b &
sxhkd &

$HOME/.local/bin/changewallpaper.sh

# Update dwm bar
while true; do xsetroot -name "  [  $(df -h | grep '/dev/sda2' | awk {'print $3 "/" $2'})]  [  $(date '+%a %d %b') ]  [  $(date '+%H:%M') ] "; sleep 1s; done &

# Water drinking reminder
while true; do notify-send "Drink Water"; sleep 15m; done &

# Main dwm loop
while :
do
	$HOME/.local/src/dwm/dwm
done
