
destination_dir=$DEST_DIR/usr/share/wireplumber

echo "setting up wireplumber configuration."
mkdir -p $destination_dir
cp -r wireplumber/* $destination_dir
echo "wireplumber setup complete. reboot your machine."

