image="$(dirname $(realpath $0))/lofi-girl.jpg"
notify-send "Playing" "Lofi" -i $image
mpv --volume=20 https://yewtu.be/watch?v=5qap5aO4i9A --no-video > /dev/null
