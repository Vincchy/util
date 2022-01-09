# !/bin/sh

# Choose a random .jpg wallpaper from $HOME/pic/wal
wall=$(find $HOME/pic/wal -type f | shuf -n 1)

# Set the wallpaper
xwallpaper --zoom $wall

# Generate the colors
wal -i $wall

sed -i 'N;$!P;D' $HOME/.cache/wal/colors-wal-dwm.h

cd $HOME/.local/src/dwm/
cat config.template.h > config.h

#infile=$HOME/.cache/wal/colors-wal-dwm.h
#outfile=$HOME/.local/src/dwm/config.h
sed -i -e '/PLACE-COLORS-HERE/r /home/vinchy/.cache/wal/colors-wal-dwm.h' /home/vinchy/.local/src/dwm/config.h

make

pkill dwm
