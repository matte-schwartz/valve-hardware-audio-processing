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

1. base-devel 
2. glibc
3. faust
4. ladspa 
5. lv2 
6. boost 
7. linux-api-headers
8. qt5-base

With these installed, you can compile lv2 plugins from our faust scripts using make:

`make FAUSTINC="/usr/include/faust"  FAUSTLIB="/usr/share/faust"` 

These can be installed to the current device using `sudo make intall`. Alternatively, they can be installed to a pacman-style pkg directory like so:

`make DEST_DIR="$pkgdir/" install`

