
SCRIPT_DIR=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )
export LADSPA_PATH=$SCRIPT_DIR/bin

echo "LADSPA PATH: $LADSPA_PATH"

make
mkdir gen
echo "applying dynamics + eq chain."
lv2apply -i Test.wav -o gen/Test-eq.wav https://faustlv2.bitbucket.io/galileo_dynamics_hardcoded
applyplugin Test.wav gen/Test-dsm.wav bin/dsm_process.so dsm
applyplugin gen/Test-eq.wav gen/Test-both.wav bin/dsm_process.so dsm
parole -p gen/Test-dsm.wav


