#!/bin/sh

set -eu

HARDCODED_PLUGIN_DEST_1=${DEST_DIR}/usr/lib/lv2/valve_deck_speakers.lv2
HARDCODED_PLUGIN_DEST_2=${DEST_DIR}/lib/lv2/valve_deck_speakers.lv2

if [ -e "$HARDCODED_PLUGIN_DEST_1" ]; then rm -r "$HARDCODED_PLUGIN_DEST_1"; fi;
if [ -e "$HARDCODED_PLUGIN_DEST_2" ]; then rm -r "$HARDCODED_PLUGIN_DEST_2"; fi;


mkdir -p "$DEST_DIR"/usr/lib/lv2
cp -r bin/lv2/g++/valve_deck_speakers.lv2 "$DEST_DIR"/usr/lib/lv2/valve_deck_speakers.lv2
cp -r bin/lv2/g++/valve_binaural.lv2 "$DEST_DIR"/usr/lib/lv2/valve_binaural.lv2
cp -r bin/lv2/g++/valve_deck_microphone.lv2 "$DEST_DIR"/usr/lib/lv2/valve_deck_microphone.dsp
# cp -r bin/svg $DEST_DIR/usr/lib/lv2/svg
# cp version.txt $DEST_DIR/usr/lib/lv2/valve_audio_dsp_version.txt
