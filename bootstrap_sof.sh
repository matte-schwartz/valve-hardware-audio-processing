SCRIPT_PATH=$(cd $(dirname "${BASH_SOURCE:--$0}") && pwd)

SOF_DEPS="${SCRIPT_PATH}"/build_sof
SOF_WORKSPACE="${SOF_DEPS}"/sof
echo "SOF deps will be installed in ${SOF_DEPS}."
echo "Updating sof deps..."

git submodule init
git submodule update --remote --recursive

echo "Compiling alsa-lib..."

(cd "${SOF_DEPS}"/alsa-lib && ./gitcompile --prefix=$HOME/local)

echo "Compiling alsa-utils..."

# (cd "${SOF_DEPS}"/alsa-utils && autoconf && ./gitcompile --prefix=$HOME/local \
#	--with-alsa-inc-prefix=$HOME/local/include \
#	--with-alsa-prefix=$HOME/local/lib \
#	--with-systemdsystemunitdir=$HOME/local/lib/systemd \
#	--with-udev-rules-dir=$HOME/local/lib/udev \
#&& sudo make install )

export LD_LIBRARY_PATH="${SOF_WORKSPACE}"/../alsa-lib/src/.libs:$LD_LIBRARY_PATH

echo "Library path: ${LD_LIBRARY_PATH}"
echo "Compiling crosstool-ng..."
echo "entering ${SOF_DEPS}/crosstool-ng"
# cd "${SOF_DEPS}"/crosstool-ng

cp -a "${SOF_DEPS}"/xtensa_crosstools/. "${SOF_DEPS}"/crosstool-ng

(cd "${SOF_DEPS}"/crosstool-ng && ./bootstrap)
(cd "${SOF_DEPS}"/crosstool-ng && ./configure --prefix="${SOF_DEPS}")

echo "Making crosstool-ng..."
(cd "${SOF_DEPS}"/crosstool-ng && make && make install)

unset LD_LIBRARY_PATH

echo "Making toolchain..."

( cd "${SOF_DEPS}"/crosstool-ng && time for i in vangogh; do \
  cp config-$i-gcc10.2-gdb9 .config && echo "config-${i}-gcc10.2-gdb9" &&
     time ./ct-ng build || break 
done )


TOOLCHAINS_ROOT="${SOF_DEPS}"/crosstool-ng/builds
echo "Scanning for toolchains in ${TOOLCHAINS_ROOT}"
for i in "${TOOLCHAINzS_ROOT}"/xtensa-*-elf; do PATH="$PATH:$i"/bin && echo "added ${i} toolchain to path."; done

XTENSA_ROOT="${SOF_WORKSPACE}"/xtensa-root
cd "${SOF_DEPS}"/newlib-xtensa

time for toolchain in "${TOOLCHAINS_ROOT}"/xtensa-*-elf; do
   ./configure --target="${toolchain#../}" --prefix="${XTENSA_ROOT}" &&
   make && make install || break;
   rm etc/config.cache
done

echo "Compiled Xtensa Toolchains:"
ls "${XTENSA_ROOT}"

cd $SOF_WORKSPACE
echo "Building SOF."
cp "${SOF_DEPS}"/target-config.mk "${SOF_WORKSPACE}"/installer/config.mk
make -C installer/ -j$(nproc)

cp "${SOF_DEPS}"/RImage_config/vangogh.toml "${SOF_WORKSPACE}"/rimage/config/
./scripts/xtensa-build-all.sh vangogh



