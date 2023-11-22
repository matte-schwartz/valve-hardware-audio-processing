
destination_dir=$DEST_DIR/usr/share/wireplumber
systemd_dir=$DEST_DIR/usr/lib/systemd/system

echo "setting up wireplumber configuration."

mkdir -p $destination_dir
cp -r wireplumber/{*.d,scripts,hardware-profiles} $destination_dir

mkdir -p $systemd_dir
cp -a wireplumber/systemd/system/* $systemd_dir

mkdir -p $DEST_DIR/etc
cd $DEST_DIR/etc && ln -s /run/wireplumber wireplumber
echo "wireplumber setup complete. reboot your machine."

