# install deps for building this on arch.
sudo pacman -S base-devel glibc faust ladspa lv2 boost linux-api-headers
make
./setup_pipewire.sh
