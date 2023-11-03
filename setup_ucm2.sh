
destination_dir=$DEST_DIR/usr/share/alsa/ucm2

echo "setting up ucm2 configuration."
mkdir -p $destination_dir
cp -r ucm2/* $destination_dir
