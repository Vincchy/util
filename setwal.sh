# !/bin/sh

# VARIABLES ---
# dmenu - path to dmenu
# root_dir - path to wallpapers
dmenu=$HOME/.local/src/dmenu/dmenu
root_dir=$HOME/pic/wal


# Choose a directory from which to choose the wallpapers
current_dir=$(basename -a $(find $root_dir -mindepth 1 -type d) | $dmenu)

# When the directory hasn't been chosen exit
if [ -z "$current_dir" ]; then
	exit 1
fi

# Choose a wallpaper (random for random wallpaper)
wall=$root_dir/$current_dir/$(echo -e "random\n$(basename -a $(find $root_dir/$current_dir -type f))" | $dmenu)
if [ "$wall" == "$root_dir/$current_dir/random" ]; then
	wall=$(find $root_dir/$current_dir -type f | shuf -n 1)
fi

# When the wallpaper hasn't been chosen exit
if [ -z "$wall" ]; then
	exit 1
fi

# Generate the colors (skip changing the theme for tty and terminals [-st] same for changing the wallpaper [-n])
wal -i $wall -st -n -q

# Cut a section from dwm color config (otherwise not working for some reason)
sed -i 'N;$!P;D' $HOME/.cache/wal/colors-wal-dwm.h

# Theme for dwm
cd $HOME/.local/src/dwm/
cat config.template.h > config.h
sed -i -e '/PLACE-COLORS-HERE/r /home/vinchy/.cache/wal/colors-wal-dwm.h' /home/vinchy/.local/src/dwm/config.h
make > /dev/null

# Theme for dmenu
cd $HOME/.local/src/dmenu/
cat config.template.h > config.h
sed -i -e '/PLACE-COLORS-HERE/r /home/vinchy/.cache/wal/colors-wal-dmenu.h' /home/vinchy/.local/src/dmenu/config.h
make > /dev/null

# Restart dwm
pkill dwm

# Set the wallpaper
wal -i $wall -q
