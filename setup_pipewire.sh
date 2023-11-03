
destination_dir=$DEST_DIR/usr/share/pipewire/pipewire.conf.d

echo "setting up pipewire configuration."
mkdir -p $destination_dir
cp -r pipewire-confs/filter-chain-speakers.conf $destination_dir/filter-chain-sink.conf
cp -r pipewire-confs/filter-chain-mic.conf      $destination_dir/filter-chain.conf 
cp -r pipewire-confs/virtual-sink.conf          $destination_dir/virtual-sink.conf
cp -r pipewire-confs/virtual-source.conf        $destination_dir/virtual-source.conf
echo "pipewire setup complete. reboot your machine."

