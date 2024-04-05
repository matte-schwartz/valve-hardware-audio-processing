# Valve Hardware Audio Processing
This repository contains any and all customizations audio configuration and processing we run on the Steam Deck.

This includes:

1. Configurations for source and sink setups in Pipewire for Voyager/Jupiter and Galileo.
2. Wireplumber scripts for routing those sources/sinks for Voyager/Jupiter and Galileo.
3. Individual UCM configs for session policy for Voyager/Jupiter (coupled with the acp5x soundcard) and Galileo (coupled with the sof-nau8821-max soundcard)
4. Faust scripts for generating a statically compiled speaker and microphone tuning. 
5. Prebuilt and presigned SOF firmware binaries for the audio co-processor on Galileo.
6. Scripts and a submodule setup for compiling an unsigned version of the SOF firmware binary for Galileo from source.


## Setup and Install

Generally, to build this package we require the following packages:

Arch Linux:
1. base-devel 
2. glibc
3. faust
4. ladspa 
5. lv2 
6. boost 
7. linux-api-headers
8. qt5-base

Debian:
1. build-essential
2. faust
3. ladspa-sdk
4. lv2-dev
5. libboost-all-dev
6. qtbase5-dev qtchooser qt5-qmake qtbase5-dev-tools

With these installed, you can compile lv2 plugins from our faust scripts using make:

`make FAUSTINC="/usr/include/faust"  FAUSTLIB="/usr/share/faust"` 

Note: on Debian it seems you have to pass in the SHELL:

`make SHELL="/bin/bash" FAUSTINC="/usr/include/faust"  FAUSTLIB="/usr/share/faust"` 

These can be installed to the current device using `sudo make intall`. Alternatively, they can be installed to a pacman-style pkg directory like so:

`make DEST_DIR="$pkgdir/" install`

