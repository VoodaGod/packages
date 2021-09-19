#!/bin/bash

# CLONE PHASE
git clone https://github.com/FluidSynth/fluidsynth.git fluidsynth
pushd fluidsynth
git checkout -f 9265818
popd

# BUILD PHASE
pushd "fluidsynth"
mkdir -p build
cd build
cmake \
    -DCMAKE_INSTALL_PREFIX="$pfx" \
    ..
make -j "$(nproc)" install
popd
