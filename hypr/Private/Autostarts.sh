sleep 10
fish /home/naji/.gc/hypr/Private/ryoku-wp-rotate.fish

sleep 50
if ping -c 1 -W 1 1.1.1.1 &>/dev/null; then
  discord
fi
