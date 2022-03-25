# !/bin/sh

# Generate colors with pywal and recompile dwm

. $HOME/.local/bin/setwal.sh

# Set the apropriate colors in dunst config
rm $HOME/.config/dunst/dunstrc
$HOME/.local/bin/setdunst.sh > $HOME/.config/dunst/dunstrc
pkill dunst
dunst &

. $HOME/.cache/wal/colors.sh

pywalfox update
pywal-discord $HOME/.cache/wal/colors.css

# Theme for rofi
cat $HOME/.cache/wal/colors-rofi-light.rasi > $HOME/.config/rofi/config.rasi

# color0 - dark background
# color2 - active workspace + bar
# color7 - active
# color8 - not active
curl -X POST -d "color0=${color0}&color1=${color2}&color2=${color7}&color3=${color8}" --silent -o /dev/null 192.168.0.222:5000/colors

# Restart dwm
echo "You can now restart dwm ( MOD+Shift+M )" > /dev/null
