# !/bin/sh

# Generate colors with pywal and recompile dwm
. $HOME/.local/bin/setwal.sh

# Set the apropriate colors in dunst config
rm $HOME/.config/dunst/dunstrc
$HOME/.local/bin/setdunst.sh > $HOME/.config/dunst/dunstrc
pkill dunst
dunst &

# Restart dwm
echo "You can now restart dwm ( MOD+Shift+M )"
