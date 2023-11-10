
destination_dir=$DEST_DIR/usr/lib/firmware/amd/

echo "setting up SOF firmware."
mkdir -p $destination_dir
cp -r sof_fw/* $destination_dir
