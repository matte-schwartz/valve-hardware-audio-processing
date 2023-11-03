
SCRIPT_DIR=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )
export LADSPA_PATH=$SCRIPT_DIR/bin

echo "LADSPA PATH: $LADSPA_PATH"

make
mkdir gen
applyplugin Test.wav gen/Test-dsm.wav bin/dsm_process.so dsm
aplay -D hw:1,1 gen/Test-dsm.wav


