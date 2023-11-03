SCRIPT_PATH=$(cd $(dirname "${BASH_SOURCE:--$0}") && pwd)

echo "pulling down submodules"
git submodule update --init

docker pull thesofproject/sof
docker tag thesofproject/sof sof

SOF_WORKSPACE="${SCRIPT_PATH}"/build_sof
cd "${SOF_WORKSPACE}"/sof/scripts/docker_build/sof_qemu
./docker-build.sh
cd "${SOF_WORKSPACE}"/sof/scripts/docker_build/sof_builder
./docker-build.sh

cd "${SOF_WORKSPACE}"/sof
sudo ./scripts/docker-run.sh ./scripts/xtensa-build-all.sh vangogh

