
destination_dir=$DEST_DIR/usr/share/pipewire
systemd_dir=$DEST_DIR/usr/lib/systemd/system

echo "setting up pipewire configuration."

mkdir -p $destination_dir
cp -r pipewire-confs/hardware-profiles $destination_dir

mkdir -p $systemd_dir
cp -a pipewire-confs/systemd/system/* $systemd_dir
echo "pipewire setup complete. reboot your machine."

